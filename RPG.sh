#!/bin/bash

#echo "Nazdarek. Kdo ses?"
#read playername

#echo "
#Citis se jako:"
#select role in kocour pes; do
#break
#done

# Player setup
playername=${playername:-Jimmy}

# Game setup
pocetsouboju="0"
touch ./hi.score
rekordsec=$(awk -F: '{print $1}' ./hi.score | sort -nubr | head -1 )
rekordsouboju=$(awk -F: '{print $2}' ./hi.score | sort -nubr | head -1 )


# Beasts
kamen()
{
bojovnik=$(( $RANDOM % 2 ))
}

nuzky()
{
bojovnik=$(( $RANDOM % 10 ))
}

papir()
{
bojovnik=$(( $RANDOM % 4 ))
}

# Funkce
odpocet1()
{
total=2
while [ $total -gt 0 ]; do
	echo "$total"
	total=$(( $total - 1 ))
	sleep 1
done
}

konec()
{
konec=$(( $(date +%s) - $start))
echo "$akce $bojovnik"
echo -e "\nSes kaput:(\nZkus to znovu.\nVydrzel jsi v tomto podivnem svete $konec sekund a $pocetsouboju divnosetkani."
if [[ $konec -gt $rekordsec || $pocetsouboju -gt $rekordsouboju  ]]; then
    echo "K tomu stanovil novy rekord!"
    echo "Vsichni volejte slava!"
    echo $konec:$pocetsouboju >> ./hi.score
    exit
else
    echo "Rekord je $rekordsec sekund a $rekordsouboju setkani."
    echo $konec:$pocetsouboju >> ./hi.score
    exit
fi
}

boj0()
{
papir
echo -e "\nBoj s papirem.\nTen neni nikdy jednoduchy, protoze ma velmi ostre hrany."
read -t 5 -p "Co udelas?: " akce
if [[ $(( (${#akce} + $RANDOM) % 3 )) -le $bojovnik || $akce == "w" ]]; then
        echo "$akce $bojovnik Prezils"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi
}

boj1()
{
nuzky
echo -e "\nNuzky a jejich spicate hroty jsou postrach kazdeho tvora. Jdou ti primo po ocich!\n"
read -t 5 -p "Co udelas?: " akce
if [[ $(( (${#akce} + $RANDOM) % 5 )) -le $bojovnik || $akce == "w" ]]; then
        echo "$akce $bojovnik Prezils"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi
}

boj2()
{
nuzky
echo -e "\nNuzky co maji hroty spicate jako vrcholky Dolomit. Leti primo na tvuj xicht!\n"
read -t 5 -p "Co udelas?: " akce
if [[ $(( (${#akce} + $RANDOM) % 5 )) -le $bojovnik || $akce == "w" ]]; then
        echo "$akce $bojovnik Prezils"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi

}

boj3()
{
papir
echo -e "\nPapir a jeho ziletkove okraje ti jdou po krku!\n"
read -t 5 -p "Co udelas?: " akce
if [[ $(( (${#akce} + $RANDOM) % 4 )) -le $bojovnik || $akce == "w" ]]; then
        echo "$akce $bojovnik Prezils"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi

}

boj4()
{
kamen
echo -e "\nLetici kamen neni extra zajimavy. Ale jen tehdy, dokud neleti smerem primo doprostred tveho ciferniku.\n"
read -t 5 -p "Co s tim?: " akce
if [[ $(( (${#akce} + $RANDOM) % 2 )) -le $bojovnik || $akce == "w" ]]; then
        echo "$akce $bojovnik Prezils"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi
}

# Zaciname
start=$(date +%s)
clear
echo "---
$playername a jeho pribeh
---"
echo -e "Stojis v lese a pamatujes si jen jmeno \"$playername\", mozna jsi to ty...mozna ne.\n"

echo -e "Po az moc kratkem case na rozkoukani se an tebe vali kamen.\n"
read -p "Co udelas?: " akce
    akce=$(( (${#akce} + $RANDOM) % 2 ))
kamen
if [[ $akce == $bojovnik ]]; then
        echo -e "Prezils\n"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi

echo -e "\nJe to asi zly sen, protoze po kameni se na tebe zene stado slonu.\n"
read -p "Co udelas?: " akce
nuzky
    akce=$(( (${#akce} + $RANDOM) % 5 ))
if [[ $akce -le $bojovnik ]]; then
        echo "$akce $bojovnik Prezils"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi

echo -e "\nSes tady jen chvili a uz te zase neco ohrozuje. Tentokrat  ostra chilly omacka. Radeji s tim neco proved.\n"
read -p "Co udelas?: " akce
papir
    akce=$(( (${#akce} + $RANDOM) % 5 ))
if [[ $akce -le $bojovnik ]]; then
        echo "$akce $bojovnik Prezils"
        pocetsouboju=$(( $pocetsouboju + 1 ))
    else
        konec
fi

# nekonecny souboj zacina

hp=1
while [ $hp -gt 0 ]; do
	boj$((RANDOM % 5))
	sleep 0
done

# muzu smazat

