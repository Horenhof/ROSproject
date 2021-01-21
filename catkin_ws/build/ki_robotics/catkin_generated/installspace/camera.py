#!/usr/bin/env python3
from __future__ import print_function
import random
import os
import sys
import rospy #sor lib for python to create nodes and publish or subscribe topics
import cv2 #a lib to process images and deal with their encoding types
from sensor_msgs.msg import Image #message type for images 
from cv_bridge import CvBridge # to convert images to image/msgs
import numpy as np
from ki_robotics.msg import Num #message of type number with head
from pathlib import Path


def camera(args,pic):
  
  bridge = CvBridge()
  image_pub = rospy.Publisher("image_from_cam",Image,queue_size=10)
  int_pub = rospy.Publisher("int_from_cam",Num,queue_size=10)
  rospy.init_node('camera_node', anonymous=True)
  rate = rospy.Rate(10)

  # to achieve synchronizing, rostime is used.
  # the header message of type Num has 2 params, head and Integer
  # rostime is being attached to the header of message Num.msg
  # rostime is also being attached to the head of message sensor.msgs/Image
  # in this case we have the same timstamp in both messages 
  while not rospy.is_shutdown():
    try:
      image_msg = "Camera node is running...."
      rospy.loginfo(image_msg)
      picNum = random.randint(0,9)
      msg = Num()
      time = rospy.get_rostime()
      msg.header.frame_id = "/digit"
      msg.header.stamp  = time
      msg.a = int(pic[picNum][0])
      img = cv2.cvtColor(pic[picNum][1],cv2.COLOR_RGB2BGR)
      img = bridge.cv2_to_imgmsg(img, "bgr8")
      img.header.stamp=time
      image_pub.publish(img)
      int_pub.publish(msg)
      rate.sleep()
    except rospy.ROSException :
      pass


def load_images_from_folder(folder):
    images = []
    for filename in os.listdir(folder):
        img = cv2.imread(os.path.join(folder,filename))
        if img is not None:
            images.append([filename[0] ,img])
    return images

# in Main an image is being read and sent as an argument to the function 'camera' to be published in topic 'image_from_cam'
# the image is being transfered to type 'imgmsg' to make possible to send it to other nodes as ROS Image
# in main another Integer Value in being send to another node in a topic 'int_from_cam'
if __name__ == '__main__':
  home = Path(__file__).parent
  pics = load_images_from_folder(str(home)+"/mnist_images")
  try:
    camera(sys.argv,pics)
  except rospy.ROSInterruptException:
    pass

