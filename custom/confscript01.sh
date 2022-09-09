#!/bin/sh
sudo echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo useradd -m -d /home/milanp milanp
sudo usermod -aG sudo milanp

sudo mkdir /home/milanp/.ssh
sudo > /home/milanp/.ssh/authorized_keys
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHsbBL8q0zCMk+fdW+iV14/ra9Z/yu7mraD/b4Cj6e9eNL0iXT8ql3Kw2+XhQMmeOILeqw3BnDzhNBQzbinhVYvwRdQPd1+7ZLqRcW4wUKRTKKRhd4HJzeJ4LkFlNSRI3BNR4nhvN2o6GXmMe4gahW7hsVINYgvIr8yWUh0dypQolXFsnZ9Q/v3X8/EQiD9KOar2QCZfXV8hjiwv9MVlRpU9WKZnFGnHRTGFQyMnAgJqqiXPRDzIhA654Vim1IYOjg7j4qvwRAgps93VIVDmYPEnRDyRdTJ14lYl6dh7qXVaaoeqsiPH8mfIo2TETy9CCX9qwIiXngh/09vbowjclbxak9pgKQdR67ysvC1ETq9IktpDJcidpUI8rHGfWAY7GsK2js0gZdzr9G/ZdPOZzxPz5qfUmr21SzZ9sfpVoFoDelTw+n16NXuHC256/qfaUvnLRNDM3ufibKjIOPjU7CHQ0WBpePWDZUOICxmslzRKQDxWHN7+ai/D8C4tPB9Vi6aMOHKeofPzZrXTJqiYuTYRy4bSEZIQWtva8SKOP2wLS+I6+pvqx6ga0NNadxWulKEiaz6NM+r6kKn0AqWRJBhi3goHoS4xFuatXE92xeOxTRR4gQvSZBCGj/oyCLkuBHQVJ9EHkGYdml9/Wwgqok5E8lsMfuJhSzGO+LLKv4nw== milan.piscevic@europoint.com" >> /home/milanp/.ssh/authorized_keys

sudo useradd -m -d /home/miroslavv miroslavv
sudo usermod -aG sudo miroslavv

sudo mkdir /home/miroslavv/.ssh
sudo > /home/miroslavv/.ssh/authorized_keys
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDs83O7yChiPorNrNqXHDt3SSijF/Irw+NPjFK+NnXIsbWxAhob+RwtOvTF+G5d6zm68jdyxxJcH259qWSqM1NFOW9sC5TdN6zIPeY9UIpq44xG5a7vdlLFAj+1BHGKuBiHDk+G65ELtymxB/bq1wr5w+XnHB0WTOwGcTTaooMOgpNmUoVy/lKyri0ukOcKa6mzdfZtv9cFBlnkD2bHJkd4+mURdJujDGy/Tog30F6MliJQ74+6RQd0gmrL2sQZ8ZVGVYCzcEu4zgvfMRRAr9DYWaVJzNqpGl44Gc56XjKN7B+0IHpPhVSKYQ/G/B6v4x+0kMHQ20sKAYVhoO0oDsJ0LJ9h4Oqt+yPzxrvNTIT9oObiY6Iwx/EbR02QW6u2Az8PPOsKOSiqCmqkoQtNpdHMBYjZNQ5w1gdfyHVxElRdYKHje7kgy85xxyfKxtrO/51PDLtHQMNuiR0oQFmCglG6toefzm80V2x6Maj/iaQAPnLXwa1hPSb3pAIORqdIpw8rqGQHH4a2ST6OnBP2eQWv2IxBN9QWv1h02tP47aBSGjeysrACkQxuItQrUt9KUMx7NzkjArwgBc1QGgRFx1mDK4/QMOXXi/1BRtujtYzAPnR2GL8rJJe2gesRxKwV1txUUkzp57asEC/Hk1ASKBF+QfNKjAnGvlvwmc4eTB4pNw== miroslav.vujicic@europoint.com" >> /home/miroslavv/.ssh/authorized_keys

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
sudo wget https://downloads.yugabyte.com/releases/2.15.1.0/yugabyte-2.15.1.0-b175-linux-x86_64.tar.gz -P /yugasql/downloads
sudo tar xvfz /yugasql/downloads/yugabyte-2.15.1.0-b175-linux-x86_64.tar.gz -C /yugasql/install

sudo chown -R vojkan:yugagroup /yugasql
