# Installation

1. Commande du VPS sur OVH
2. Ajout de la clef SSH sur la machine
3. Se connecter en SSH sur le port 22 (par défaut)
4. Configurer le Firewall

# Ajout d'utilisateurs

https://help.ovhcloud.com/csm/fr-public-cloud-compute-additional-ssh-keys?id=kb_article_view&sysparm_article=KB0050579

1. sudo adduser <nom-user> :
useradd john -G docker,sudo,audio,video,dialout,floppy,cdrom
2. Ajout dans dans groupes :
```usermod -a -G <nom-group> <nom-utilisateur>```
3. Saisie du mot de passe :
```sudo passwd ludo```
4. Vérification des gourps :
```groups```

# Transfert de fichiers 

S'effectue en utilisant sftp (si clef SSH bien ajoutée).
Il vous est conseillé d'utiliser FileZilla.

1. Se connecter au port sftp

### Activation du TLS

1. générer le certificat :
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt
