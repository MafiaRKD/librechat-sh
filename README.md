# librechat-sh
sh for automatic installation of librechat docker container

stiahnut sh skript a upravit podla seba

openai api token

zakazana registracia

nutnost nastavit v skripte user name a password
      
    wget https://raw.githubusercontent.com/MafiaRKD/librechat-sh/main/install_librechat.sh
  
uprav v sh:

OPENAI_API_KEY="sk-..." – svoj token

ADMIN_USERNAME a ADMIN_PASSWORD

uloz sh
 
    chmod +x install_librechat.sh
    ./install_librechat.sh

Po inštalácii:

Prístup len pre teba ako admina

Nikto iný sa nebude môcť registrovať

Môžeš pridávať používateľov len ty z admin rozhrania

Web dostupný na http://<LXC-IP>:3080
