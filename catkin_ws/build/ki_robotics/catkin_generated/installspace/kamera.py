#!/usr/bin/env python3
from __future__ import print_function


import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


def callback(data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)

    (rows,cols,channels) = cv_image.shape
    if cols > 60 and rows > 60 :
      cv2.circle(cv_image, (50,50), 10, 255)

    cv2.imshow("Image window", cv_image)
    cv2.waitKey(3)


def main(argv):
    rospy.init_node("Processor",anonymous=True)
    rospy.Subscriber("image_topic",Image,callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        main(sys.argv)
    except rospy.ROSException:
        pass