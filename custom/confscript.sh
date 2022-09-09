#!/bin/sh
sudo echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo useradd -m -d /home/milanp milanp
sudo usermod -aG sudo milanp

sudo mkdir /home/milanp/.ssh
sudo > /home/milanp/.ssh/authorized_keys
sudo echo "ssh-rsa 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 milan.piscevic@europoint.com
" >> /home/milanp/.ssh/authorized_keys

sudo useradd -m -d /home/miroslavv miroslavv
sudo usermod -aG sudo miroslavv

sudo mkdir /home/miroslavv/.ssh
sudo > /home/miroslavv/.ssh/authorized_keys
sudo echo "ssh-rsa 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 miroslav.vujicic@europoint.com
" >> /home/miroslavv/.ssh/authorized_keys

# Take a backup of sudoers file and change the backup file.
sudo cp /etc/sudoers /tmp/sudoers.bak
sudo echo "miroslavv ALL=(ALL) NOPASSWD:ALL" >> /tmp/sudoers.bak
sudo echo "milanp ALL=(ALL) NOPASSWD:ALL" >> /tmp/sudoers.bak

# Check syntax of the backup file to make sure it is correct.
sudo visudo -cf /tmp/sudoers.bak
if [ $? -eq 0 ]; then
  # Replace the sudoers file with the new only if syntax is correct.
  sudo cp /tmp/sudoers.bak /etc/sudoers
else
  echo "Could not modify /etc/sudoers file. Please do this manually."
fi
sudo rm /tmp/sudoers.bak

# Take a backup of limits file and change the backup file.
sudo cp /etc/security/limits.conf /tmp/limits.conf.bak
sudo echo "*                -       core            unlimited" >> /tmp/limits.conf.bak
sudo echo "*                -       data            unlimited" >> /tmp/limits.conf.bak
sudo echo "*                -       fsize           unlimited" >> /tmp/limits.conf.bak
sudo echo "*                -       sigpending      119934" >> /tmp/limits.conf.bak
sudo echo "*                -       memlock         64" >> /tmp/limits.conf.bak
sudo echo "*                -       rss             unlimited" >> /tmp/limits.conf.bak
sudo echo "*                -       nofile          1048576" >> /tmp/limits.conf.bak
sudo echo "*                -       msgqueue        819200" >> /tmp/limits.conf.bak
sudo echo "*                -       stack           8192" >> /tmp/limits.conf.bak
sudo echo "*                -       cpu             unlimited" >> /tmp/limits.conf.bak
sudo echo "*                -       nproc           12000" >> /tmp/limits.conf.bak
sudo echo "*                -       locks           unlimited" >> /tmp/limits.conf.bak

sudo ln -s /usr/bin/python3 /usr/bin/python

sudo cp /tmp/limits.conf.bak /etc/security/limits.conf
sudo rm /tmp/limits.conf.bak

sudo groupadd -g 10000 yugagroup
sudo gpasswd -M vojkan,milanp,miroslavv yugagroup
sudo mkdir -m 774 /yugasql
sudo mkdir -m 774 /yugasql/install
sudo mkdir -m 774 /yugasql/data
sudo wget https://downloads.yugabyte.com/releases/2.15.1.0/yugabyte-2.15.1.0-b175-linux-x86_64.tar.gz -P /yugasql/downloads
sudo tar xvfz /yugasql/downloads/yugabyte-2.15.1.0-b175-linux-x86_64.tar.gz -C /yugasql/install

sudo chown -R vojkan:yugagroup /yugasql

