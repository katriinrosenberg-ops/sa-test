# Arvestustöö raport

Nimi: Katriin Rosenberg 
Variant: sa-test
Kuupäev: 09.10.2026

Kirjelda vähemalt **6 leitud probleemi**.

## Probleem 1
- Skript: scripts/disk_check.sh
- Mida skript näiliselt tegi: Kontrollis kettaruumi kasutust.
- Mis oli tegelikult vale: Vale parameeter df -p.
- Kuidas vea avastasin:Käivitasin skripti ja tekkis veateade.
- Millise käsuga kontrollisin: ./scripts/disk_check.sh
- Parandus:df -p võtmega df -P.
- Kuidas kontrollisin pärast parandust: Käivitasin skripti uuesti.
- Vajadusel exit code enne / pärast: enne 1 ja pärast 0

## Probleem 2
- Skript: scripts/disk_check.sh
- Mida skript näiliselt tegi: Kontrollis, kas ketta kasutusprotsent ületab määratud piiri.
- Mis oli tegelikult vale: Tulemusest ei eemaldatud % märki, mistõttu arvuline võrdlus ebaõnnestus teatega integer expression expected.
- Kuidas vea avastasin:Jälgisin skripti väljundit käivitamisel.
- Millise käsuga kontrollisin:./scripts/disk_check.sh
- Parandus:Kasutasin awk ja tr -d % käske puhas-arvulise protsendi kättesaamiseks.
- Kuidas kontrollisin pärast parandust: Käivitasin skripti uuesti ja veendusin, et võrdlus töötab ilma vigadeta.

## Probleem 3
- Skript: scripts/user_check.sh
- Mida skript näiliselt tegi: Kontrollis kasutaja olemasolu.
- Mis oli tegelikult vale: Otsis kasutajat grupifailist /etc/group.
- Kuidas vea avastasin:Vaatasin skripti koodi
- Millise käsuga kontrollisin: cat scripts/user_check.sh
- Parandus: Kasutasin süsteemset käsku id "$username".
- Kuidas kontrollisin pärast parandust: Testisin skripti root kasutajaga.

## Probleem 4
- Skript: scripts/user_check.sh
- Mida skript näiliselt tegi: Tuvastas olematu kasutaja.
- Mis oli tegelikult vale: skript väitis ka suvalise või olematu kasutajanime puhul, et ta on süsteemis olemas.
- Kuidas vea avastasin:Proovisin skripti täiesti suvalise nimega ja see ütles ikka, et kasutaja leiti.
- Millise käsuga kontrollisin: ./scripts/user_check.sh mingi_suvaline_nimi
- Parandus:Asendasin vigase tingimuse otse id "$username" kontrolliga.
- Kuidas kontrollisin pärast parandust:Testisin uuesti olematu nimega, ütles "Kasutajat ei leitud."

## Probleem 5
- Skript: scripts/system_info.sh
- Mida skript näiliselt tegi: Kuvas süsteemi andmeid.
- Mis oli tegelikult vale: Käskude tulemused olid vahetuses 
- Kuidas vea avastasin: Vaatasin väljundit ja andmed ei klappinud.
- Millise käsuga kontrollisin: ./scripts/system_info.sh
- Parandus: Panin käsud õigesse järjekorda ja asendasin õigetega.
- Kuidas kontrollisin pärast parandust: Käivitasin skripti uuesti ja andmed olid õiged.

## Probleem 6
- Skript: scripts/backup.sh
- Mida skript näiliselt tegi: Lõi pakkitud varukoopia.
- Mis oli tegelikult vale: Päris arhiivi asemel tegi skript lihtsalt tekstifaili failinimedest.
- Kuidas vea avastasin: Kontrollisin tekitatud faili tüüpi käsuga file.
- Millise käsuga kontrollisin: file backups/*.tar.gz
- Parandus:Panin skripti tegema tegelikku tar -czf pakkimist.
- Kuidas kontrollisin pärast parandust: Vaatasin käsuga tar -tzf, et arhiivi sisu on õige.

## Uus funktsionaalsus
- Mida lisasin: Lõin kripti scripts/sys_check.sh
- Kuidas käivitada: Käivitab korraga system_info.sh, disk_check.sh ja service_check.sh  ning salvestab logi faili logs/sys_check.log.
- Kuidas kontrollisin, et tulemus on õige: Käivitasin ./scripts/sys_check.sh ja vaatasin käsuga cat logs/sys_check.log, et logi tekkis.
