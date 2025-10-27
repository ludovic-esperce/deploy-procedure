# Déploiement conteunerisé manuel

Cette procédure a pour objectif de détailler les étapes à suivre pour vous permettre de **déployer manuellement un application conteunerisé**.

Compétences abordées :
- utilisation de SSH pour conexion à un serveur ;
- déployer manuellement une composition Docker.

Pré-requis :
- [application web conteneurisée](https://github.com/afpa-learning/stack-spring-react-postgres-docker?tab=readme-ov-file) ;
- client SSH installé sur votre poste de travail (par défaut sur Windows) ;
- [client Git](https://winget.run/pkg/Git/Git) installé sur votre poste de travail ;
- clef SSH publiques ajoutées sur votre serveur et connexion possible ;
- Docker engine installé sur le serveur.

## Etapes à suivre

1. Se connecter au serveur
2. Créer une clef SSH pour le serveur
3. Ajouter la clef SSH à Github
4. Cloner sur le projet conteneurisé sur le serveur
5. Démarrer la stack conteunerisée

Ces différentes étapes seront détaillées dans la suite de cette procédure.

> [!IMPORTANT]  
> Vous allez partager un serveur à plusieurs.
>
> Il est fort probable que certaines commandes interfères avec les autres.
> A vous d'échanger et de vous synchroniser pour mener à bien le déploiement. 

### 1 - Connexion en SSH

Pour se connecter au serveur vous pouvez utiliser la commande suivante :
```sh
ssh <user>@<ip>
```

> [!CAUTION]
> A la première connexion pensez à [modifier votre mot de passe](https://linuxize.com/post/how-to-change-user-password-in-linux/#change-your-user-password).

> [!IMPORTANT]  
> Si vous clef SSH n'est pas ajoutée au serveur la connexion se fera pas mot de passe utilisateur.
>
> Il est conseillé d'ajouter votre clef SSH pour pouvoir vous connecter en utilisant ce protocol.
>
> Afin d'ajouter la clef SSH vous pourrez suivre la procédure disponible [ici](https://linuxhandbook.com/add-ssh-public-key-to-server/).

### 2 - Créer une clef SSH pour le serveur

L'objectif est de pouvoir récupérer le code du projet à partir d'un dépôt Git.

Pour se faire vous pouvez créer une clef SSH sur le serveur qui nous servira uniquement pour le déploiement.

> [!WARNING]  
> Ne mettez pas votre clef SSH privée personnelle sur le serveur. Il vous faut absolument recréer une clef propre au déploiement.
>
> Pour permettre à une machine de récupérer en SSH le code **d'un seul dépôt** Github propose la création de "clef de déploiement".

Pour la création et l'ajout de cette clef de déploiement à votre dépôt vous pourrez vous référer à la [documentation disponible ici](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/managing-deploy-keys#set-up-deploy-keys).

### 4 - Cloner sur le projet conteneurisé sur le serveur

Commande possible (si submodules):
```sh
git clone --recurse-submodules <url-ssh>
```

> [!IMPORTANT]  
> Cette procédure correspond à 1 approche particulière basée sur la récupération d'un dépôt Git.
>
> Il existe d'autres façons de transférer des fichiers sur une machine distante.
> Voici, par exemple, une présentation de plusieurs [façons de transférer des fichiers](https://tecadmin.net/transferring-files-over-ssh/).

### 5 - Démarrer la stack conteunerisée

Commande à faire :
```sh
docker compose up
```

## Commande utiles en bash

### Commande de déplacement/

`cd` : change directory, permet de se déplacer dans un dossier

`cd ..` : permet de se déplacer 1 dossier en arrière dans l'arboresence

`pwd` : "Print Working Directory", affiche le dossier courant

`ls` : list, permet d'afficher le contenu du dossier courant

### Gestion des logiciels

> [!IMPORTANT]  
> le VPS fourni est un système Ubuntu basé sur le gestionnaire de paquets `apt get`
>
> Vous trouverez une liste de commandes utiles pour une maintenance quotidienne en suivant [ce lien](https://geekflare.com/fr/apt-command-examples/).

Voici une sélection :

`apt get install <nom-logiciel>` : le VPS fourni est un système Ubuntu basé sur le gestionnaire de paquets `apt get`

Vous pouvez essayer d'installer un logiciel en utilisant la commande suivante (pour nano, éditeur de texte en ligne de commande) : `apt get install nano`
