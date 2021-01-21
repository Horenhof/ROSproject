; Auto-generated. Do not edit!


(cl:in-package ki_robotics-srv)


;//! \htmlinclude AIService-request.msg.html

(cl:defclass <AIService-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass AIService-request (<AIService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AIService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AIService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ki_robotics-srv:<AIService-request> is deprecated: use ki_robotics-srv:AIService-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <AIService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ki_robotics-srv:image-val is deprecated.  Use ki_robotics-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AIService-request>) ostream)
  "Serializes a message object of type '<AIService-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AIService-request>) istream)
  "Deserializes a message object of type '<AIService-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AIService-request>)))
  "Returns string type for a service object of type '<AIService-request>"
  "ki_robotics/AIServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AIService-request)))
  "Returns string type for a service object of type 'AIService-request"
  "ki_robotics/AIServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AIService-request>)))
  "Returns md5sum for a message object of type '<AIService-request>"
  "ebf5e3c3cf0200651dc17aec0c4cde8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AIService-request)))
  "Returns md5sum for a message object of type 'AIService-request"
  "ebf5e3c3cf0200651dc17aec0c4cde8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AIService-request>)))
  "Returns full string definition for message of type '<AIService-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AIService-request)))
  "Returns full string definition for message of type 'AIService-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AIService-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AIService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AIService-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude AIService-response.msg.html

(cl:defclass <AIService-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass AIService-response (<AIService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AIService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AIService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ki_robotics-srv:<AIService-response> is deprecated: use ki_robotics-srv:AIService-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <AIService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ki_robotics-srv:result-val is deprecated.  Use ki_robotics-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AIService-response>) ostream)
  "Serializes a message object of type '<AIService-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AIService-response>) istream)
  "Deserializes a message object of type '<AIService-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AIService-response>)))
  "Returns string type for a service object of type '<AIService-response>"
  "ki_robotics/AIServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AIService-response)))
  "Returns string type for a service object of type 'AIService-response"
  "ki_robotics/AIServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AIService-response>)))
  "Returns md5sum for a message object of type '<AIService-response>"
  "ebf5e3c3cf0200651dc17aec0c4cde8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AIService-response)))
  "Returns md5sum for a message object of type 'AIService-response"
  "ebf5e3c3cf0200651dc17aec0c4cde8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AIService-response>)))
  "Returns full string definition for message of type '<AIService-response>"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AIService-response)))
  "Returns full string definition for message of type 'AIService-response"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AIService-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AIService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AIService-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AIService)))
  'AIService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AIService)))
  'AIService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AIService)))
  "Returns string type for a service object of type '<AIService>"
  "ki_robotics/AIService")