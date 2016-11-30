#!/bin/bash

# Nouveau timer

source .variables.sh
source .parts/timer/timer.sh

while :
do
  clear

  echo "Nouveau timer"
  echo ""

  read -p "Nom du timer : " TIMER_NAME
  echo ""

  read -p "Durée de départ (en minutes) : " TIMER_TIME
  echo ""

  if ! [[ $TIMER_TIME =~ $REGEX_NUMBER ]] ; then
    echo "Vous devez entrer un chiffre!"
    read
  else
    echo "Les informations sont-elles correctes?"
    read -p "Votre choix [O,N] : " CHOICE

    case $CHOICE in
      [oO])
        echo "Création du timer..."
        
        Timer 'timer1' $TIMER_NAME $TIMER_TIME

        echo "Création terminé!"

        echo ""
        echo "Votre timer : "

        $timer1_show

        echo ""

        read -p "Voulez-vous démarrer le timer? [0,N] : " CHOICE

        if [ $CHOICE = "o" ] || [ $CHOICE = "O" ]; then
          # timer start
          echo "Timer démarré"
        fi

        read
        exit
        ;;
      *)
        if [ $CHOICE = "n" ] || [ $CHOICE = "N" ]; then
          read -p "Voulez-vous recommencer? [0,N] : " CHOICE
        else
          read -p "Entrée invalide. Voulez-vous-recommencer? [0,N] : " CHOICE
        fi

        if [ $CHOICE != "o" ] && [ $CHOICE != "O" ];then
          exit
        fi
        ;;
    esac
  fi
done
