# Horloge
 Nous souhaitons réaliser un système qui permette suivant les besoins de donner l'heure   (Format heures:minutes:secondes) ou de servir de minuteur.
## Description du Projet

Ce projet consiste à développer une horloge numérique capable de fournir l'heure actuelle au format heures:minutes:secondes et de fonctionner comme un minuteur. L'horloge sera réalisée en utilisant le langage de description matériel VHDL et sera implémentée sur une carte FPGA.

## Fonctionnalités

- Affichage de l'heure actuelle
- Fonction minuteur avec réglage du temps
- Réinitialisation de l'horloge et du minuteur
- Interface utilisateur simple pour la configuration

## Structure du Projet

Le projet est structuré en plusieurs modules VHDL, chacun responsable d'une partie spécifique du système :

1. **Module Horloge** : Gère l'affichage de l'heure actuelle.
2. **Module Minuteur** : Gère le compte à rebours et l'affichage du minuteur.
3. **Module Interface Utilisateur** : Permet la configuration de l'heure et du minuteur.
4. **Module Affichage** : Contrôle l'affichage des informations sur un écran.

## Prérequis

- Connaissance de base en VHDL
- Carte FPGA compatible
- Logiciel de synthèse et de simulation VHDL (par exemple, Xilinx Vivado)

## Installation

1. Clonez le dépôt du projet :
    ```bash
    git clone https://github.com/votre-utilisateur/horloge-vhdl.git
    ```
2. Ouvrez le projet dans votre logiciel de synthèse VHDL.
3. Compilez et synthétisez le projet.
4. Téléchargez le bitstream sur votre carte FPGA.

## Utilisation

1. Allumez la carte FPGA.
2. Configurez l'heure actuelle via l'interface utilisateur.
3. Utilisez les boutons pour démarrer, arrêter et réinitialiser le minuteur.

## Auteurs

- **DBIBIH OUSSAMA** - Développeur principal

## Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.