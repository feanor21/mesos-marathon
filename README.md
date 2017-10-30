# sympo-mesos_marathon
 ## Intro 
 
 on this repo, there is the scripts used to setup a cluster with mesos / marathon , in order to expose a dockerised API on a pull of machine.
 
 The machine are standart ubuntu PC. We use a wifi router to set up a local network. each machine have a static IP.
 
 ## Installation des machines
 
 Dans le dossier install, le script 'setup.sh' installe les paquets pour mesos, marathon, curl, ansible.
 L'utilisateur utilisé ici s'appelle "sympo". Il dispose des droits sudo sans mot de pass (sur toutes les machines).
 
 ## registre docker et zookeeper
 
 Afin de pouvoir distribuer correctement les container, un registre docker est créé. le script 'setup_dockerandzookeeper.yml' ajout le fichier 'daemon.json' sur tout les hotes, et change rajoute un champ hostname dans le fichier etc/hosts des machines afin qu'elles puissent contacter le registre.
 
 Pour zookeeper, j'ai choisi l'image officielle.
 
Ici, un seul zookeeper est set up. En production ,il sera nécessaire d'avoir au moins 3 instances.

Je forward les ports depuis 2181 vers 3000.
Le script 'launch zookeeper.yml' sera a compléter pour lancer plusieurs zookeeper. J'en ai juste lancé un à la main sur un serveur ebn utilisant la commande.

## mesos master

Par habitude, je lance mesos en utilisant le binaire. Il serait intéressant de voir si le service mesos fonctionne correctement aujourd'hui.

le script 'mesos-master.sh' lance un master mesos sur la machine locale

## mesos slave

le script 'mesos-slave.sh' lance les slave mesos, et setup les repéertoires nécessaires.

le script ansible 'kill_mesos_slave.yml' va kill les slaves sur les machines. Ce script est bancal, à charge de l'utilisateur qu'il a bien fonctionné via l'UI du master.

'launch-mesos-slave.yml' lance les slaves mesos sur toutes les machines.

## mesos dns

J'ai suivi la doc officielle. Le container docker n'as pas bien marché. J'ai du modifier resolv.conf pour faire fonctionner le dns. Cela m'as provoqué de l'instabilité sur le lancement des slaves et du master. 

Afin d'éviter ce souci, je suis retourné en arriére sans dns. Un peut de temps sera nécessaire pour tout vérifier.

