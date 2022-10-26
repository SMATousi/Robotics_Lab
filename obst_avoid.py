#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from ca_msgs.msg import *


# global right_touch, left_touch
left_touch = False
right_touch = False

def bumper_callback(data):
    '''
    This is the callback function that reads the touching sensor
    '''
    global right_touch, left_touch
    right_touch = data.is_right_pressed
    left_touch = data.is_left_pressed

    rospy.loginfo("right    " + str(right_touch))
    rospy.loginfo("left     " + str(left_touch))


def talker(v, w):
    '''
    The velocity publisher function
    '''
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
    # pub = rospy.Publisher('cmd_vel_', Twist, queue_size=10)
    
    
     # 10hz    print("")

    


    twist_msg = Twist()
    twist_msg.linear.x = v
    twist_msg.angular.z = w
    # rospy.loginfo(twist_msg)

    pub.publish(twist_msg)



def main():
    # global right_touch, left_touch

    rospy.init_node('navigator', anonymous=True)
    rospy.Subscriber('bumper',Bumper,bumper_callback)
    rospy.sleep(1)
    
    rate = rospy.Rate(100)

    while not rospy.is_shutdown():
        '''
        In this loop we check the touching sensors and publishing velocities 
        based on them.
        '''
        
        print("")
        rospy.loginfo("right    " + str(right_touch))
        rospy.loginfo("left     " + str(left_touch))
        print("")


        if left_touch and not right_touch:
            rospy.loginfo("############ left_pressed #############")
            ang_vel = -0.1
            lin_vel = 0
            talker(lin_vel,ang_vel)
        elif right_touch and not left_touch:
            rospy.loginfo("############ right_pressed #############")
            ang_vel = 0.1
            lin_vel = 0
            talker(lin_vel,ang_vel)
        elif right_touch and left_touch:
            rospy.loginfo("############ both_pressed #############")
            ang_vel = 0.2
            lin_vel = 0
            talker(lin_vel,ang_vel)

    rospy.spin()
    rate.sleep()


if __name__ == "__main__":
    main()