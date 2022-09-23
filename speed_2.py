#!/usr/bin/env python
import rospy
import numpy as np
from std_msgs.msg import String
from geometry_msgs.msg import Twist

def rotate(ang_vel, n_side):

	pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
	rospy.init_node('navigator', anonymous=True)
	rate = rospy.Rate(1) # 10hz
	twist_msg_ang = Twist()
	twist_msg_ang_stop = Twist()
	twist_msg_ang.angular.z = ang_vel
	#twist_msg_ang_stop.angular.z = 0.0

	t2 = rospy.Time.now()
	t1 = rospy.Time.now()
	theta = 2*3.14/n_side
	t1 = rospy.Time.now()
	while (t2 - t1) < rospy.Duration(theta/(twist_msg_ang.angular.z*1.15)) and (not rospy.is_shutdown()):
	    pub.publish(twist_msg_ang)
	    t2 = rospy.Time.now()
	    duration = (t2 - t1)
	    angle = twist_msg_ang.angular.z * duration.to_sec()
	    rospy.loginfo(angle)
	    rospy.sleep(0.02)

	#pub.publish(twist_msg_ang_stop)


def move_lin(velocity, distance):
	pub = rospy.Publisher('cmd_vel', Twist, queue_size=100)
	rospy.init_node('navigator', anonymous=True)
	rate = rospy.Rate(10) # 10hz

	twist_msg_lin = Twist()
	twist_msg_lin_stop = Twist()
	twist_msg_lin.linear.x = velocity
	twist_msg_lin_stop.linear.x = 0.0

	t2 = rospy.Time.now()
	t1 = rospy.Time.now()
        
	while (t2 - t1) < rospy.Duration(distance/twist_msg_lin.linear.x) and (not rospy.is_shutdown()):
            
            pub.publish(twist_msg_lin)
            t2 = rospy.Time.now()

	pub.publish(twist_msg_lin_stop)





def speed(n_side):

    

    dist = 0.3
    while not rospy.is_shutdown():

        move_lin(0.1, dist)
	
        rospy.sleep(2)
    
        rotate(0.8, n_side)

	rospy.sleep(2)
	
        

        
        






# def talker():
#     #pub = rospy.Publisher('cmd_vel_mux/input/navi', Twist, queue_size=10)
#     pub = rospy.Publisher('cmd_vel_mux/input/navi', Twist, queue_size=10)
    
#     rospy.init_node('navigator', anonymous=True)
#     rate = rospy.Rate(10) # 10hz    
    
#     while not rospy.is_shutdown():

#         twist_msg = Twist()
#         twist_msg.linear.x = 0.1
#         twist_msg.angular.z = 0.1
# 	now = rospy.get_rostime()
#         # while pub.get_num_connections() < 1:
#         #     rospy.loginfo("Waiting")
#         rospy.loginfo(twist_msg)
# 	rospy.loginfo("Current time %i %i", now.secs)
# 	#rospy.loginfo(twist_msg + now.secs, now.nsecs)
        
#         pub.publish(twist_msg)
#         rate.sleep()


if __name__ == '__main__':
    try:
        speed(6)
    except rospy.ROSInterruptException:
        pass
