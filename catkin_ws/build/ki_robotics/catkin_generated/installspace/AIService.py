#!/usr/bin/env python3
from __future__ import print_function
import torch
from torch import nn
import torch.nn.functional as F
import rospy
import cv2
import numpy as np
from ki_robotics.srv import AIService, AIServiceResponse
from cv_bridge import CvBridge
from pathlib import Path

class Network(nn.Module):
    def __init__(self):
        super().__init__()
        self.fc1 = nn.Linear(784,256)
        self.fc2 = nn.Linear(256,128)
        self.fc3 = nn.Linear(128,64)
        self.fc4 = nn.Linear(64,10)
        self.dropout = nn.Dropout(p=0.3)

    def forward(self,x):
        x = x.view(x.shape[0],-1)
        x = self.dropout(F.relu(self.fc1(x)))
        x = self.dropout(F.relu(self.fc2(x)))
        x = self.dropout(F.relu(self.fc3(x)))
        x = F.softmax(self.fc4(x),dim=1)
        return x


# AIService is a ROS Service, which is receiving an image and passing it to the Neural Network model
# the output of the Model is being sent back to the subscriber node as prediction of the Digit in the image
def handel_prediction(req):
    bridge = CvBridge()
    rospy.loginfo("Returning the class of the image ....")
    image = bridge.imgmsg_to_cv2(req.image,"bgr8") 
    image = cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
    pic = torch.FloatTensor(image[None,:,:])
    top_v,top_c = model(pic).topk(1,dim=1)
    return AIServiceResponse(top_c)


def main():
    rospy.init_node("ai_servise",anonymous=True)
    s = rospy.Service("predict_image",AIService,handel_prediction)
    rospy.loginfo("Prediction Service is Ready")
    rospy.spin()


if __name__=="__main__":
    model = Network()
    home = Path(__file__).parent
    param = torch.load(str(home)+"/model_cifar.pt")
    model.load_state_dict(param)
    try:
        main()
    except rospy.ROSInterruptException as e:
        print(e)