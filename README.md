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


## Projektstruktur
 ### ROS Node-Struktur
 ![alt text](https://github.com/Horenhof/ROSproject/blob/master/image.jpg?raw=true)
 

 ### Struktur des neuronalen Netzes

## Implementation

## Fazit

## Quellen






