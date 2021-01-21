#!/usr/bin/env python3

import rospy
import message_filters
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from ki_robotics.msg import Num
import cv2
from ki_robotics.srv import *

def callback(image,num):
    bridge = CvBridge()
    image1 = bridge.imgmsg_to_cv2(image,"bgr8") 
    image1 = cv2.cvtColor(image1,cv2.COLOR_BGR2GRAY)
    ps =predict(image)
    right = ps==num.a
    rospy.loginfo("The real Value is {num}, the predicted Value is {ps}, Prediction was : {right}".
    format(num=num.a,ps=ps,right="right" if right else "wrong"))

    


def predict(img):
    rospy.wait_for_service("predict_image")
    try :
        predict = rospy.ServiceProxy("predict_image",AIService)
        resp = predict(img)
        return resp.result 

    except rospy.ServiceException as e:
        print("Service call Failed: %s" %e)

def controller():
    rospy.loginfo("controller is running")
    rospy.init_node("controller_node",anonymous=True)
    image_sub = message_filters.Subscriber("processed_image",Image)
    int_sub = message_filters.Subscriber("int_from_cam",Num)
    time_syn = message_filters.TimeSynchronizer([image_sub,int_sub],10)
    time_syn.registerCallback(callback)
    rospy.spin()


# the node controller subscribes 2 topics, 
# 1- processed_image topic : a processed image is being send with a timestamp to controller node
# 2- int_from_cam topic : an integer value comes from the camera node with the same timestamp of image 
# in callback the image and the integer value are being send as argument if they have the same timestamp
# TimeSynchronizer object is checking the timestamps of the image and the integer value. if they match, they will be passed to the callback func
# in callback the image is being send to the AI Service to be predicted.
if __name__=="__main__":
    try:
        controller()
    except rospy.ROSInterruptException as e:
        print(e)

