# ROS AI Task

* [Überblick](#überblick)
  * [Verwendungsrichtlinien und Anforderungen](#verwendungsrichtlinien-und-anforderungen)
* [Theoretical Background](#theoretical-background)
  * [Ros](#ros)
  * [Neuronale Netze](#neuronale-netze)
* [Projektstruktur](#projektstruktur)
  * [ROS Node-Struktur](ros-node-struktur)
  * [Struktur des neuronalen Netzes](#struktur-des-neuronalen-netzes)
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

### Deep Neural Networks :
oft `Feedforword neural Networks` oder `multilayer perceptrons (MLPs)` gennant.[4]. Das Ziel von neuronalen Netzen ist es, eine Funktion zu approximieren. 
</br>Zum Beispiel : Die Fuktion `y=a+bx`  wo `a=Achsenabschnitt der Ordinate` und  `b=Steigung`, ist eine `lineare Funktion`. Diese Lineare Funktion mappt das Input `X` zum Output `y`. Die Aufgabe des neuronalen Netzes ist es, die Parameter `a und b` zu trainieren oder lernen, damit sie das Output `Y` approximiert. [4]

In Deep Learning oder Neuronalen Netzen geht es darum, dass man ein Input `X` hat, angenommen `X = Bild von einer handgeschriebenen Zahl`, und ein Output `Y`, angenommen `Y = was steht im Bild`. Der Rechner sieht das Bild als Zahlen, die in ein- oder mehrdimensionalem Array gespeichert sind. um dies zu verwirklichen, braucht man eine Lineare Gleichung, die die Beziehung zwischen `X` und `Y` darstellt. 

### Lineare Regression
Besteht ein Zusammenhang zwischen einer unabhängigen Variablen x und einer abhängigen Variablen y, der einer Geraden entspricht, so wird diese Problemstellung als lineare Regression behandelt und durch die Geradengleichung [5] </br>

Y = Theta * X + B, Theta sind die learnbaren Parameter, die Input X zum Output Y mappen. aber wir kennen sie nicht. </br>
Man kann aber einen beliebigen Wert für `theta` setzten. Und das Output mit dem richtigen Wert von `Y` vergleichen.</br>
Im Falle vieler X Werte ist das Vergleichen sehr zeitaufwending, deshalb hat man eine Funktion eingefüht, die `Const Function` bezeichnet wird.

### Const Function
Die Const Funktion `oder Loss Function ` berechnet den Fehler von den Outpus der Linearen Regression Funktion, in dem sie die Distanz zwischen den wahren Labels und dem Output von unserer Funktion. </br> [6]
Als Beispiel nehmen die ME `mean error` Funktion :</br>
MSE = 1/n * sum(y - output)  wo `n` ist die Anzahl der Inputs `X`
![quation](https://github.com/Horenhof/ROSproject/blob/master/cost.jpg?raw=true)</br>
Wenn diese Distanz nah zum Null ist, bedeutet es, dass der Fehler sehr gering ist. und das hilft dabei, dass der approximierte Ausgabe unserer Funktion sehr nah zum wahren Wert von `Y`.

### Training und Gradient Descent
Die beliebigen Wert, die man `Theta` gibt, müssen trainiert werden, um die Outputs so zu approximieren, dass sie den wahren Werten nahkommen.
Das Thema `Gradient Descent` wird hier nicht tiefgründlich geklärt. aber ganz kurz gesagt, die Aufgabe von `Gradient Descent` ist es, die lernbaren Parameter mithilfe von den mathematischen gleichung `Ableitung` zu manipulieren, [7]
Lesen Sie über Ableitung unter disesm Link : https://www.studyhelp.de/online-lernen/mathe/ableiten/

## Projektstruktur
 ### ROS Node-Struktur
 In dieser Applikation wurden die folgenden Knoten implementiert :
 ##### Kamera-Knoten : 
 Der Kamera-Kntoen definiert ein Thema (Topic) namesn `"image_from_cam"`, das eine Nachricht vom Datentype `"sensor_msgs/Image"` veröffentlicht, sowie ein anderes Thema namens `"int_from_cam"`, das eine Nachricht vom benutzerdefinierten Type `"Num"` veröffentlicht.
 
 ##### Processor-Knoten : 
 Der Processor abonniert das Thema (topic) namens `"image_from_cam"`, um das Image `"frame"` von der Kamera zu bekommen. 
 Das Image wird im Processor bearbeitet (e.g Größe ändern, schneiden, ...usw) und zur Veröffentlichung vorbereitet.
 Processor definiert ein Thema (topic) namesn ´"processed_image"´, das das bearbeitete Image veröffentlicht.
 
 ###### Die Beziehung zwischen den beiden Knoten ist im Graph `"G1"` visualisiert : ![G1 Graph](https://github.com/Horenhof/ROSproject/blob/master/rosgraph.png?raw=true)
 
 ##### AIService-Knoten :
 AIService definiert ein Thema (topic) namens ´"predict_image"´, das eine Funktion zur Verfügung stellt, die ein Bild als Argument bekommt, um es mit hilfe eines Neuronalen Netzes zu klassifizieren. 
 
 ##### Controller-Knoten :
 Controller abonniert zwei Themen (topics), das erste ist ´"int_from_cam"´ und das zweite ´"processed_image"´.
 Im Controller werden die Zeitstempel von beiden Nachrichten verglichen, wenn sie übereinstimmen, werden sie einer Funktion übergeben, die dementsprechen das Image an den AIService weiterleitet.
 ###### Die Beziehung zwischen den beiden Knoten ist im Graph `"G2"` visualisiert : ![G1 Graph](https://github.com/Horenhof/ROSproject/blob/master/rosgraph2.png?raw=true)

 ### Struktur des neuronalen Netzes
 #### Dataset :
 THE MNIST DATABASE of handwritten digits (60000 pics, (28 * 28) pixel)
 #### Das Model no.1:
 Das Model ist ein `Neuronales Netz`, das aus Drei `fullyconnected` Schichten besteht. eine Hidden-layer, input und output Layer</br>
 #### Distribution :
  * Train set
  * Test set
 ##### Network :
  * (fc1): Linear(in_features=784, out_features=128, bias=True)
  * (fc2): Linear(in_features=128, out_features=64, bias=True)
  * (fc3): Linear(in_features=64, out_features=10, bias=True)
  * (dropout): Dropout(p=0.3, inplace=False)
##### Loss Function : 
* The negative log likelihood loss *for more information[8]*
##### optimizer :
* SGD () Optimizer *for more Information [10]* (lr=0.01)
Mehr Informationen sind im Jypeter notbook zu sehen.

 #### Das Model no.2:
 Das Model ist ein `Neuronales Netz`, das aus Fier `fullyconnected` Schichten besteht. zwei Hidden-layers, input und output Layer</br>
  #### Distribution :
  * Train set (geteilt auf "validation" und "train" set 
  * Test set
 ##### Network :
  * (fc1): Linear(in_features=784, out_features=128, bias=True)
  * (fc2): Linear(in_features=256, out_features=128, bias=True)
  * (fc3): Linear(in_features=128, out_features=64, bias=True)
  * (fc4): Linear(in_features=64, out_features=10, bias=True)
  * (dropout): Dropout(p=0.3, inplace=False)

##### Loss Function : 
* The negative log likelihood loss 
##### optimizer :
* Adam Optimizer (lr=0.0003) *for more Information [9]* 
Mehr Informationen sind im Jypeter notbook zu sehen.

## Quellen

* [1] ROS official website. Was ist ROS ?. Abgerufen 18. Jan 2021, von https://www.ros.org/
* [2] ROS Tutorials, Abgerufen am 18. Jan 2021, von https://wiki.ros.org/ROS/Tutorials
* [3] Was sind neuronale Netze, Abgerufen am 18. Jan 2021 von http://www.chemgapedia.de/vsengine/vlu/vsc/de/ch/13/vlu/daten/neuronalenetze/einfuehrung.vlu.html
* [4] Deep Learning Book, Chapter 6 Deep Feedforward Networks, Abgerufen am 18. Jan 2021 von https://www.deeplearningbook.org/contents/mlp.html 
* [5] Allgemeine Multivariate Datenanalyse, Autoren :Prof. Dr. Guenter Gauglitz, Frank Dieterle, Dr. Manuela Reicher, Abgerufen am 18. Jan 2020 http://www.chemgapedia.de/vsengine/vlu/vsc/de/ch/13/vlu/daten/multivariate_datenanalyse_allg/multivar_datenanalyse_allg.vlu/Page/vsc/de/ch/13/anc/daten/multivar_datenanalyse_allg/lineareregression.vscml.html
* [6] What is Mean Error?, Abgerufen am 18. Jan 2021 von https://www.statisticshowto.com/mean-error/#:~:text=The%20mean%20error%20is%20an,error%2C%20also%20called%20observational%20error.
* [7] Chapter 8 Optimization for Training Deep Models, Abgerufen am 18. Jan 2021 von https://www.deeplearningbook.org/contents/optimization.html
* [8] likelihood loss, Abgerufen am 18. Jan von https://pytorch.org/docs/stable/generated/torch.nn.NLLLoss.html
* [9] Adam Optimizer, Abgerufen am 18. Jan von https://pytorch.org/docs/stable/optim.html
* [10] SGD Optimiyzer, Abgerufen am 18. Jan von https://pytorch.org/docs/stable/optim.html#algorithms
