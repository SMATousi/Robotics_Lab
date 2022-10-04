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

# global flag
flag = False
counter = 0

def odometryCb(msg):
    print msg.pose.pose


def Position(odom_data):
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


def transformation(tf_data):
    global counter
    # rospy.sleep(1)
    transform = tf_data.transform
    # print transform

# def get_rotation (msg):
#     global roll, pitch, yaw
#     orientation_q = msg.pose.pose.orientation
#     orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
#     (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
#     # print yaw
#     return yaw

def initilize():
    sd_transform = np.zeros((4,4)) #sd : source to destination 
    sc_transform = np.zeros((4,4)) #sc : source to current
    cd_transform = np.zeros((4,4)) #cd : current to destination 

    return sd_transform, sc_transform, cd_transform

def build(x,y,yaw):
    
    sd_transform1 = [np.cos(yaw), -np.sin(yaw), 0, x]
    sd_transform2 = [np.sin(yaw), np.cos(yaw), 0, y]
    sd_transform3 = [0, 0, 1, 0]
    sd_transform4 = [0, 0, 0, 1]
    sd_transform = np.array([sd_transform1,sd_transform2,sd_transform3,sd_transform4])
    return sd_transform

def calculate_cd(sd_transform, sc_transform):
    cd_transform = np.matmul(inv(sc_transform), sd_transform)
    # cd_transform = np.matmul(sd_transform, inv(sc_transform))
    return cd_transform

def cartesian_to_polar(yaw, cd_transform):
    rho = np.sqrt(cd_transform[0,3]**2 + cd_transform[1,3]**2)
    theta = yaw
    alpha = -theta + np.arctan2(cd_transform[1,3],cd_transform[0,3])
    beta = - (theta + alpha)
    
    
    return rho, alpha, beta

def talker(v, w):
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)
    # pub = rospy.Publisher('cmd_vel_', Twist, queue_size=10)
    
    
     # 10hz    
    


    twist_msg = Twist()
    twist_msg.linear.x = v
    twist_msg.angular.z = w
    # rospy.loginfo(twist_msg)

    pub.publish(twist_msg)



def begin():
    global flag
    # global pose
    rospy.init_node('navigator', anonymous=True)
    rospy.Subscriber('odom',Odometry,Position)
    rate = rospy.Rate(10)
    sd_transform, sc_transform, cd_transform = initilize()
    
    
    x,y,dest_yaw,K_p,K_a,K_b = -1,-1,-3.14/2,0.1,0.3,-0.7

    sd_transform = build(x,y,dest_yaw)
    # rospy.loginfo(sd_transform)
    rate.sleep()
    # rospy.loginfo(flag)
    init_x = pose.position.x
    init_y = pose.position.y
    while not rospy.is_shutdown():
        
        rate.sleep()
        # rospy.loginfo(flag)
        # if flag:    

            
        # rospy.loginfo("2  odom  pose \n" + str(pose))

    
        # print(pose)

    
    # rospy.Subscriber('odom',Odometry,get_rotation)
    # print(pose)
        # current_x = pose.position.x - init_x
        # current_y = pose.position.y - init_y
        current_x = pose.position.x
        current_y = pose.position.y

        if np.abs(current_x - x) < 0.05 and np.abs(current_y - y) < 0.05 and np.abs(yaw - dest_yaw) < 0.1:
            print("BREAK")
            break

        rospy.loginfo("X:" + str(current_x))
        rospy.loginfo("Y:" + str(current_y))
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

        # rospy.loginfo(velocity)

            # rospy.init_node('odometry', anonymous=True) #make node 
        # rospy.Subscriber('odom',Odometry,Position)
        # control_loop(1,1,0,1,1,1)
        





if __name__ == "__main__":
    begin()
    rospy.spin()
    # rospy.spin() # not really necessary because we have while not rospy.is_shutdown()