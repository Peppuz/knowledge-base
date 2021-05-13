# Install
apt update;
apt install apache2 curl iptables-persistent

# Firewall UFW 
ufw app list;
ufw allow 'WWW'
ufw status

# Or CLI commands for IPTABLES
/sbin/iptables -I INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 433 -m state --state NEW,ESTABLISHED -j ACCEPT

# or Manual add IPTABLES
vim /etc/sysconfig/iptables
# Add these to the File
-A INPUT -m state --state NEW,ESTABLISHED -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW,ESTABLISHED -p tcp --dport 443 -j ACCEPT

# restart the bitches
/etc/init.d/iptables restart
systemctl restart apache2


# HTTPS Certificate
apt install snapd
snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot 
