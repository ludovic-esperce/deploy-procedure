#!/bin/bash

for user_name in "$@"
do
    # création d'un utilisateur
    adduser --disabled-password --gecos "" $user_name
    usermod -a -G docker,sudo,audio,video,dialout,floppy,cdrom $user_name
    passwd_user="g89gt*F*zw&yEL"
    echo -e "$passwd_user\n$passwd_user" | passwd $user_name
    echo "Mot de passe pour l'utilisateur $user_name $passwd_user"

    # création du fichier "authorized_keys" pour inscrire les clés ssh autorisées par le serveur
    mkdir /home/$user_name/.ssh
    touch /home/$user_name/.ssh/authorized_keys
    chown -R $user_name:$user_name /home/$user_name/.ssh
done
