#!/usr/bin/env python3
from __future__ import print_function

import rospy
import cv2
from ki_robotics.srv import AIService, AIServiceResponse

def handel_prediction(req):
    print("Returning the class of the image ....")
    return AIServiceResponse(1)


def main():
    rospy.init_node("ai_servise",anonymous=True)
    s = rospy.Service("predict_image",AIService,handel_prediction)
    print("Prediction Service is Ready")
    rospy.spin()


if __name__=="__main__":
    try:
        main()
    except rospy.ROSInterruptException as e:
        print(e)