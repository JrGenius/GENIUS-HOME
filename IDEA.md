Voici un **prompt de niveau architecte produit** que vous pourrez utiliser avec ChatGPT, Claude Code ou Cursor AI afin de générer le projet complet. Il est rédigé comme un cahier des charges de développement et laisse suffisamment de liberté à l'IA pour produire une architecture propre et évolutive.

---

# PROMPT GLOBAL — GENIUS HOME™ V1

## Contexte

Tu es un Software Architect Senior, UX Designer, Flutter Expert, AI Product Designer et Product Manager.

Tu participes au département **Recherche & Développement de GENIUS GROUPS SAS**, entreprise spécialisée dans les technologies Smart Home, FinTech et Intelligence Artificielle pour l'Afrique.

Ta mission est de concevoir **GENIUS HOME™**, une Progressive Web App (PWA) développée avec **Flutter**.

L'application doit être pensée **Mobile First**, mais fonctionner parfaitement sur le Web.

L'objectif est qu'à l'avenir nous puissions générer les applications Android et iOS directement depuis Flutter **sans réécriture du code**.

Le projet doit respecter les bonnes pratiques Flutter et être facilement maintenable.

---

# Vision Produit

GENIUS HOME™ est un assistant domestique intelligent.

Il aide les ménages africains à suivre leur consommation énergétique.

Version 1 :

* consommation électrique
* consommation du gaz butane

Aucun capteur.

Aucun objet connecté.

L'utilisateur renseigne simplement certaines informations.

L'intelligence artificielle apprend progressivement les habitudes de consommation afin de prévoir les prochaines recharges.

Le projet devra cependant être conçu pour accueillir ultérieurement :

* Genius PowerPlug
* capteurs IoT
* balances connectées
* prises intelligentes
* Home Assistant
* MQTT
* Matter
* Zigbee
* Thread
* Bluetooth
* WiFi

L'architecture doit donc être **IoT Ready**.

---

# Stack Technique

Utiliser exclusivement :

Flutter (stable)

Flutter Web (PWA)

Material 3

Responsive Design

GoRouter

Riverpod

Freezed

Json Serializable

Drift (SQLite)

SharedPreferences

Flutter Local Notifications

Firebase Messaging (préparer uniquement l'architecture)

Dynamic Color

Google Fonts

fl_chart

intl

uuid

connectivity_plus

package_info_plus

device_info_plus

animations

---

# Architecture

Architecture Clean

Feature First

DDD simplifié

MVVM

Repository Pattern

Services

Dependency Injection

Chaque module indépendant.

---

# Structure

```text
lib/

core/

shared/

features/

dashboard/

electricity/

gas/

house/

rooms/

devices/

analytics/

notifications/

predictions/

settings/

widgets/

theme/

models/

repositories/

services/
```

---

# Design

Créer une interface premium.

Inspirée de :

Apple Home

Google Home

Home Assistant

Tesla App

Notion

Minimaliste.

Très peu de couleurs.

Beaucoup d'espaces.

Grandes cartes.

Animations fluides.

Coins arrondis.

Icônes modernes.

Mode sombre natif.

Responsive.

---

# Couleurs

Bleu Genius

Blanc

Noir

Vert (économie)

Orange (attention)

Rouge (critique)

---

# Première configuration

Lors du premier lancement

Créer un assistant de configuration.

Étapes :

Bienvenue

Nom de la maison

Photo (optionnel)

Nombre de personnes

Nombre de pièces

Adresse (optionnelle)

Fuseau horaire

Type de compteur électrique

Type de bouteille de gaz

Fin

---

# Gestion de la maison

Une maison possède :

nom

photo

nombre de pièces

nombre d'habitants

adresse

coordonnées GPS (optionnel)

surface

---

# Gestion des pièces

L'utilisateur peut créer autant de pièces.

Exemple

Salon

Cuisine

Chambre 1

Chambre 2

Salle de bain

Garage

Bureau

Terrasse

Jardin

Chaque pièce possède

nom

surface

photo

description

---

# Gestion des équipements

Chaque pièce peut contenir plusieurs appareils.

Créer une bibliothèque complète.

Catégories :

Éclairage

Ventilation

Cuisine

Multimédia

Informatique

Internet

Sécurité

Climatisation

Pompage

Électroménager

Recharge

Gaming

Autres

---

Créer une base de données d'équipements comprenant notamment :

Télévision

Smart TV

Réfrigérateur

Congélateur

Climatiseur

Ventilateur

Fer à repasser

Four

Micro-ondes

Plaque électrique

Gazinière

Bouilloire

Machine à café

Lave-linge

Sèche-linge

Routeur WiFi

Switch réseau

NAS

Caméra IP

PlayStation

Xbox

Ordinateur fixe

PC portable

Imprimante

Chargeur téléphone

Chargeur voiture électrique

Pompe à eau

Surpresseur

Éclairage LED

Ampoule

Ruban LED

Décodeur TV

Box Internet

Enceinte connectée

etc.

Chaque appareil possède :

nom

marque

modèle

photo

catégorie

puissance nominale (Watts)

consommation moyenne

durée moyenne d'utilisation

mode veille

coût estimé

---

# Consommation électrique

Créer un moteur capable de :

enregistrer les relevés

calculer

consommation journalière

hebdomadaire

mensuelle

horaire

prévision

autonomie restante

date estimée de coupure

courbes

statistiques

---

# Consommation du gaz

L'utilisateur indique

date du changement

type de bouteille

prix

Puis régulièrement

"Utilisez-vous toujours cette bouteille ?"

Le moteur estime

pourcentage restant

nombre de jours

date estimée du remplacement

---

# Intelligence artificielle

Ne pas utiliser de modèle lourd.

Créer un moteur prédictif local basé sur

moyenne mobile

régression linéaire

tendance

saisonnalité

scores de confiance

Le code devra être suffisamment modulaire pour remplacer facilement ce moteur par TensorFlow Lite dans une version future.

---

# Dashboard

Le tableau de bord doit afficher

Bonjour Jérémie

Maison

Température (future)

Électricité

Gaz

Nombre d'appareils

Consommation moyenne

Prévision

Notifications

Conseils IA

Graphiques

Historique

---

# Notifications

Créer un moteur intelligent.

Exemples

Votre compteur devrait être vide dans 3 jours.

Votre consommation est supérieure de 18%.

Votre climatiseur consomme beaucoup.

Votre gaz devrait être remplacé cette semaine.

Vous économisez ce mois-ci.

Notifications locales.

Architecture compatible Firebase Cloud Messaging.

---

# Smart Home Ready

Créer dès maintenant les interfaces

DeviceProvider

IoTProvider

SensorProvider

PredictionProvider

Même si elles ne font encore rien.

L'objectif est de pouvoir connecter plus tard

PowerPlug

Balance gaz

Capteur température

Détecteur présence

Compteur intelligent

Home Assistant

MQTT

Matter

sans modifier l'architecture.

---

# Performances

Optimiser

60 FPS

Offline First

Cache local

Lazy Loading

Animations fluides

Très faible consommation mémoire

---

# Qualité

Générer

code propre

documentation

commentaires utiles

tests unitaires

architecture extensible

widgets réutilisables

thème centralisé

navigation propre

aucune duplication

---

# Objectif final

Le résultat attendu est une application Flutter PWA premium, moderne, élégante et évolutive, qui constitue la première brique de l'écosystème **GENIUS HOME™**. Elle doit être suffisamment robuste pour évoluer sans refonte vers Android, iOS, Desktop et des intégrations IoT, tout en restant simple à utiliser pour les ménages africains. L'expérience utilisateur doit donner le sentiment d'avoir un **assistant énergétique personnel**, capable d'apprendre les habitudes de la maison, d'anticiper les besoins et, à terme, de devenir le centre de pilotage de toute la maison intelligente.
