#!/usr/bin/env python
import rospy
import numpy as np
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from geometry_msgs.msg import *
from tf.msg import *
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from numpy.linalg import inv
# import matplotlib.pyplot as plt

# global flag
flag = False
counter = 0

# pose = 0

def Position(odom_data): 
    '''
    This is the callback function to use for odometry data. We will get the odometry
    position and orientation here and change a global variable to use this in the 
    control loop. 
    '''
    global pose
    global counter
    global roll, pitch, yaw
    # rospy.sleep(1)
    curr_time = odom_data.header.stamp
    pose = odom_data.pose.pose #  the x,y,z pose and quaternion orientation
    counter= counter+1
    orientation_q = odom_data.pose.pose.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
    # print counter, curr_time
    # print
    # print pose

    flag = True

    # rospy.loginfo(flag)


def initilize():
    '''
    This function will initilize the three transforms that we 
    use in the control loop. 
    '''
    sd_transform = np.zeros((4,4)) #sd : source to destination 
    sc_transform = np.zeros((4,4)) #sc : source to current
    cd_transform = np.zeros((4,4)) #cd : current to destination 

    return sd_transform, sc_transform, cd_transform

def build(x,y,yaw):
    '''
    This function will build the transform matrix based on the 
    x, y and the orientation yaw.
    '''
    sd_transform1 = [np.cos(yaw), -np.sin(yaw), 0, x]
    sd_transform2 = [np.sin(yaw), np.cos(yaw), 0, y]
    sd_transform3 = [0, 0, 1, 0]
    sd_transform4 = [0, 0, 0, 1]
    sd_transform = np.array([sd_transform1,sd_transform2,sd_transform3,sd_transform4])
    return sd_transform

def calculate_cd(sd_transform, sc_transform):
    '''
    This function will calculate the current to destination transform
    based on the source to destination and source to current transforms
    '''
    cd_transform = np.matmul(inv(sc_transform), sd_transform)
    # cd_transform = np.matmul(sd_transform, inv(sc_transform))
    return cd_transform

def cartesian_to_polar(yaw, cd_transform):
    '''
    This function will transform the cartesian to polar transformation
    '''
    rho = np.sqrt(cd_transform[0,3]**2 + cd_transform[1,3]**2)
    theta = yaw
    alpha = -theta + np.arctan2(cd_transform[1,3],cd_transform[0,3])
    beta = - (theta + alpha)
    
    
    return rho, alpha, beta

def talker(v, w):
    '''
    The publisher function that publishes the velocity to the robot
    '''
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
    # pub = rospy.Publisher('cmd_vel_', Twist, queue_size=10)
    
    
     # 10hz    
    


    twist_msg = Twist()
    twist_msg.linear.x = v
    twist_msg.angular.z = w
    # rospy.loginfo(twist_msg)

    pub.publish(twist_msg)



def begin():
    '''
    The main control loop
    '''
    try:
        global flag
        trajectory = []
        # global pose
        rospy.init_node('navigator', anonymous=True) # initilizing the subscriber node
        rospy.Subscriber('odom',Odometry,Position)
        rate = rospy.Rate(100)
        sd_transform, sc_transform, cd_transform = initilize()
        
        # defining the destination coordinates and the control gains
        x,y,dest_yaw,K_p,K_a,K_b = 1,1,3.14/2,0.05,0.0501,-2

        sd_transform = build(x,y,dest_yaw)
        # rospy.loginfo(sd_transform)
        # rospy.spin()
        rospy.sleep(1)
        # rospy.loginfo(flag)
        init_x = pose.position.x
        init_y = pose.position.y
        while not rospy.is_shutdown():
            
            rate.sleep()

            current_x = pose.position.x
            current_y = pose.position.y

            # This is the stopping criteria for the robot when it approaches the destination
            if np.abs(current_x - x) < 0.05 and np.abs(current_y - y) < 0.05 and np.abs(yaw - dest_yaw) < 0.15:
                print("BREAK")
                break

            rospy.loginfo("X:" + str(current_x))
            rospy.loginfo("Y:" + str(current_y))
            ps = [current_x,current_y]
            trajectory.append(ps)
            rospy.loginfo(np.abs(yaw - dest_yaw))

            sc_transform = build(current_x,current_y,yaw)
            # rospy.loginfo(sc_transform)

            # current_rho, current_alpha, current_beta = cartesian_to_polar(sc_transform)

            cd_transform = calculate_cd(sd_transform, sc_transform)
            # rospy.loginfo(cd_transform)
            rho, alpha, beta = cartesian_to_polar(yaw, cd_transform)

            # diff = [rho, alpha, beta] - [current_rho, current_alpha, current_beta]
            diff = [rho, alpha, beta]
            # rospy.loginfo(diff)

            diff = np.array(diff)

            gains = np.zeros((2,3))

            gains[0,0] = K_p
            gains[1,1] = K_a
            gains[1,2] = K_b
            # rospy.loginfo(gains)

            velocity = np.matmul(gains, np.transpose(diff))

            talker(velocity[0],velocity[1])
            rospy.loginfo("###########" + str(velocity[1]))

            # rospy.loginfo(velocity)

                # rospy.init_node('odometry', anonymous=True) #make node 
            # rospy.Subscriber('odom',Odometry,Position)
            # control_loop(1,1,0,1,1,1)
        rospy.spin()
        
    finally:
        # after ending the main control loop we will save the trajectory of the robot
        # in a numpy file here. 
        trajectory = np.array(trajectory)
        np.save("real_3_0.npy", trajectory)
        print(trajectory.shape)
        





if __name__ == "__main__":
    begin()
    
    # rospy.spin() # not really necessary because we have while not rospy.is_shutdown()