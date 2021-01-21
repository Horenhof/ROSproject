
(cl:in-package :asdf)

(defsystem "ki_robotics-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "AIService" :depends-on ("_package_AIService"))
    (:file "_package_AIService" :depends-on ("_package"))
  ))