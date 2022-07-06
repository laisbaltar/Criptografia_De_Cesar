#!/bin/bash

letra="";
alfabeto=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z");
criptografia=();
i=0;
j=0;
c=0;
menu=0;

echo "==============================="
echo "     CRIPTOGRAFIA DE CÉSAR     "
echo "  DIGITE UMA LETRA DE CADA VEZ "
echo "==============================="
echo " "
echo "================================"
echo "           M E N U              "
echo "================================"
echo "1. DIGITE 1 PARA CRIPTOGRAFAR"
echo "2. DIGITE 2 PARA DESCRIPTOGRAFAR"
echo "3. DIGITE QUALQUER LETRA  PARA SAIR"
read menu

if [ $menu -eq 1 ]
then
	read -p "Digite a chave da criptografia: " c
	echo "DIGITE '/' PARA SAIR"

	while [[ "$letra" != "/" ]]
	do
		read -p "Digite uma letra: " letra
		for (( i=0;i<26;i++ ))
		do
			if [[ "$letra" = "${alfabeto[$i]}" ]]
			then
				chave=$((($i + $c)%26))
				criptografia[$j]=${alfabeto[$chave]}
				j=$(($j + 1))
			fi
		done
	done
	clear
	echo "Criptografando, aguarde..."
	sleep 2
	echo "Sua mensagem secreta é' ${criptografia[@]} ' guarde com CUIDADO!"

elif [ $menu -eq 2 ]
then
	read -p "Digite a chave da criptografia: " c
	echo "DIGITE '/' PARA SAIR"
	while [[ "$letra" != "/" ]]
	do
		read -p "Digite uma letra: " letra
		for (( i=0;i<26;i++ ))
      		do
			if [[ "$letra" = "${alfabeto[$i]}" ]] 
			then
				chave=$((($i - $c)%26))
				criptografia[$j]=${alfabeto[$chave]}
				j=$(($j + 1))
			fi
		done
	done
	clear
	echo "Descriptografando, aguarde..."
	sleep 2
	echo "Sua mensagem secreta é' ${criptografia[@]} ' guarde com CUIDADO!"

else
	echo "Você saiu do programa, até logo!"
fi


