#!/usr/bin/env python
from __future__ import print_function

import numpy as np
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


# in Class Processor a Subscriber and a Publisher are being created
# Subscriber sub is subscribing the topic 'image_from_cam' to recieve the sent image from cam
# Publisher pub will publish the processed image to another topic 'controller'
# the image is being modified in the callback function and published in a topic 'processed_image'
# the image is being resized and transfered to grayscale image to fit the model


class Processor():

  def __init__(self):
    self.pub = rospy.Publisher("processed_image",Image,queue_size=10)
    self.sub = rospy.Subscriber("image_from_cam",Image,self.callback)
  
  def callback(self,data):
    bridge = CvBridge()
    try:
      cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
      cv_image = cv2.resize(cv_image,(28,28))

    except CvBridgeError as e:
      rospy.logerr("Error")
    cv = cv_image[None,:,:]
    cv2.waitKey(1)
    cv = cv2.cvtColor(cv_image,cv2.COLOR_RGB2BGR)
    img = bridge.cv2_to_imgmsg(cv,"bgr8")
    img.header = data.header
    self.pub.publish(img)
    

def main(argv):
    rospy.loginfo("Processor is listning")
    rospy.init_node("processor",anonymous=True)
    Processor()
    try:
      rospy.spin()
    except KeyboardInterrupt:
      rospy.logerr("Shutting down...")

if __name__ == '__main__':
    try:
        main(sys.argv)
    except rospy.ROSException:
        pass