# ROS AI Task

* [Überblick](#überblick)
  * [Verwendungsrichtlinien und Anforderungen](#verwendungsrichtlinien-und-anforderungen)
* [Theoretical Background](#theoretical-background)
  * [Ros](#ros)
  * [Neuronale Netze](#neuronale-netze)
* [Projektstruktur](#projektstruktur)
  * [ROS Node-Struktur](ros-node-struktur)
  * [Struktur des neuronalen Netzes](#struktur-des-neuronalen-netzes)
* [Implementation](#implementation)
* [Fazit](#fazit)
* [Quellen](#quellen)


## Überblick
Das Projekt ist eine ROS-Anwendung, die einen Videostream (die Frames als Bilder) verarbeiten kann und ein vollständig verbundenes neuronales Netzwerk verwendet, um handschriftliche Ziffern vorherzusagen.

## Verwendungsrichtlinien und Anforderungen

## Anforderungen
* Ubuntu 20.04 LTS : https://ubuntu.com/#download
* Robot Operating System "ROS" : http://wiki.ros.org/noetic/Installation (ROS Noetic for Ubuntu)
* Python3 : https://www.python.org/downloads/
* OpenCv Bibliothek für Bildverarbeitung und Computer Vision : https://opencv.org/
* Pytorch (open source machine learning framework) : https://pytorch.org/get-started/locally/

## Verwendungsrichtlinien
 * Nachdem die oben genannten Anforderungen erfüllt und das Projekt ausgecheckt werden, navigiert man im Bash zum Projekt-root-Verzeichnis 'Workspace' `catkin_ws`.
 * Bash muss mit ROS-Umgebung verbunden werden, in dem der Command : `source /opt/ros/<distro>/setup.bash` ausgeführt wird.
 * Die *Setup.sh* von dem Workspace müssen auch mit Bash verbunden werden, in dem der Command `source devel/setup.bash` ausgeführt wird.
 * Um die Anwendung zu starten, sollte der Comand `roslaunch ki_robotics launch.launch` ausgeführt werden

## Theoretical Background
### Ros
##### What is ROS?
The Robot Operating System (ROS) is a set of software libraries and tools that help you build robot applications. From drivers to state-of-the-art algorithms, and with powerful developer tools, ROS has what you need for your next robotics project. And it's all open source.[1]

##### Die fundamentale Bestandteile von ROS sind : [2]
* *Nodes*: Ein Knoten ist eine ausführbare Datei, die ROS verwendet, um mit anderen Knoten zu kommunizieren.

* *Messages*: ROS-Datentyp, der beim Abonnieren oder Veröffentlichen eines Themas verwendet wird.

* *Topics*: Knoten können Nachrichten (message)zu einem Thema (topic) veröffentlichen sowie ein Thema abonnieren, um Nachrichten zu empfangen.

* *Master*: Namensdienst für ROS (Hilft Knoten, sich gegenseitig zu finden)

Ros basiert auf Knoten, die miteinander kommunizieren und Nachrichten verschiedener Datentypen austauchen. Ein Knoten sucht nach anderen Knoten in einer Tabelle, die von Master `Roscore` zur Verfügung gestellt wird. Ein Knoten A veröffentlicht ein Thema (topic) mit einem Nachrichtentyp, anhand dessen ein anderer Knoten B die Nachricht vom A bekommen kann, wenn B das Thema (topic) abonniert (subscribe)

Ros bietet die Möglichkeit zur Erstellung von Services und Messages eigener Datentypes. Ein Service stellt eine Funktion zur Verfügung, die von einem Knoten (Client) aufgerufen,der der Funktion ein Parameter eines von dem Service bestimmten Datentypes übergibt. Die Antwort kann auch von einem verschiedenen Datentype sein.

### Neuronale Netze

Neuronale Netze, oft auch als künstliche, neuronale Netze oder artificial neural networks, bezeichnet, sind informationsverarbeitende Systeme, die aus einer großen Anzahl einfacher Einheiten (Zellen, Neuronen) bestehen, die sich Informationen in Form der Aktivierung der Zellen über gerichtete Verbindungen (connections, links) zusenden.[3]





## Projektstruktur
 ### ROS Node-Struktur
 In dieser Applikation wurden die folgenden Knoten implementiert :
 ##### Kamera-Knoten : 
 Der Kamera-Kntoen definiert ein Thema (Topic) namesn ´"image_from_cam"´, das eine Nachricht vom Datentype "sensor_msgs/Image" veröffentlicht, sowie ein anderes Thema namens ´"int_from_cam"´, das eine Nachricht vom benutzerdefinierten Type "Num" veröffentlicht.
 
 ##### Processor-Knoten : 
 Der Processor abonniert das Thema (topic) namens ´"image_from_cam"´, um das Image "frame" von der Kamera zu bekommen. 
 Das Image wird im Processor bearbeitet (e.g Größe ändern, schneiden, ...usw) und zur Veröffentlichung vorbereitet.
 Processor definiert ein Thema (topic) namesn ´"processed_image"´, das das bearbeitete Image veröffentlicht.
 
 ###### Die Beziehung zwischen den beiden Knoten ist im Graph ´"G1"´ visualisiert : ![G1 Graph](https://github.com/Horenhof/ROSproject/blob/master/rosgraph.png?raw=true)
 
 ##### AIService-Knoten :
 AIService definiert ein Thema (topic) namens ´"predict_image"´, das eine Funktion zur Verfügung stellt, die ein Bild als Argument bekommt, um es mit hilfe eines Neuronalen Netzes zu klassifizieren. 
 
 ##### Controller-Knoten :
 Controller abonniert zwei Themen (topics), das erste ist ´"int_from_cam"´ und das zweite ´"processed_image"´.
 Im Controller werden die Zeitstempel von beiden Nachrichten verglichen, wenn sie übereinstimmen, werden sie einer Funktion übergeben, die dementsprechen das Image an den AIService weiterleitet.
 ###### Die Beziehung zwischen den beiden Knoten ist im Graph ´"G2"´ visualisiert : ![G1 Graph](https://github.com/Horenhof/ROSproject/blob/master/rosgraph2.png?raw=true)

 ### Struktur des neuronalen Netzes

## Fazit

## Quellen

* [1] ROS official website. Was ist ROS ?. Abgerufen 18. Jan 2021, von https://www.ros.org/
* [2] ROS Tutorials, Abgerufen am 18. Jan 2021, von https://wiki.ros.org/ROS/Tutorials
* [3] Was sind neuronale Netze, Abgerufen am 18. Ja 2021 von http://www.chemgapedia.de/vsengine/vlu/vsc/de/ch/13/vlu/daten/neuronalenetze/einfuehrung.vlu.html




