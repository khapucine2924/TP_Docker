# Rapport de Projet - Hugo Guerletin

## Description du Projet

Ce projet est une application de gestion de tâches développée avec Angular pour le frontend et Flask pour le backend. L'application permet aux utilisateurs de créer, lire, mettre à jour et supprimer des tâches. La base de données utilisée est MySQL, exécutée dans un conteneur Docker.

## Objectif du projet

L'utilisation de docker afin de pouvoir mettre en place l'application demandé avec différents services.

## Technologies

### **Flask**
Dans ce projet, nous utiliserons flask afin d'assurer le backend de notre application.

### **Angular/nodejs**
Nous utiliserons Angular et Nodejs afin de faire fonctionner le frontend

### **Nginx**
Pour des questions de sécurité, nous utiliserons un reverse proxy qui sera Nginx.  
Il est largement utilisé dans le monde de l'entreprise.  
Afin de le configurer, il faut configurer un ficher présent sous `.\nginx\nginx.conf`.  
Ainsi, l'utilisateur n'a besoin que de l'adresse IP de l'application et le nginx va faire les requêtes nécessaire au bonne endroit.

### **MySQL** et **PHPmyadmin**
Ces deux services correspondent à la base de donnée et à son gestionnaire via une interface web.

### **Stack ELK** (ELASTICSEARCH, LOGSTASH, KIBANA)
Afin de monitorer nos services et nos logs (notamment ceux des requêtes), il a été mis en place une stack ELK.

### Prometheus et cadvisor
Ces deux services permettent de surveiller l'état de nos containers.

## Prérequis

- Docker

## Utilisation

### Lancer l'application avec Docker

1. Assurez-vous que Docker est installé et en cours d'exécution.

2. Dans le répertoire racine du projet, lancez les services Docker :

    ```sh
    docker-compose up --build
    ```

3. Accédez à l'application via `http://localhost`.

### Accédez à la Stack ELK.

Pour accéder à Kibana et visualiser les logs, il vous suffit de vous rendre via `http://localhost:5601/app/discover`.


### Accéder à PHPmyadmin

Via `http://localhost:8081/`

### Prometheus

Via `http://localhost:9090/query`.  
Voici des requêtes utiles (la partie Graph est la mieux) : 
- Utilisation du CPU par conteneur
`rate(container_cpu_usage_seconds_total{image!=""}[1m])`
- Utilisation de la mémoire par conteneur
`container_memory_usage_bytes{image!=""}`

Vous en trouverez davantage sur Internet.



## API REST

Les routes de l'API sont définies dans le dossier `flaskr/`. Voici un résumé des routes disponibles :

| Méthode HTTP | URL de la ressource       | Description                             |
| ------------ | ------------------------- | --------------------------------------- |
| `GET`        | `/api/v1/tasks`           | Retourne la collection de toutes les tâches. |
| `GET`        | `/api/v1/tasks/<id>`      | Retourne une tâche spécifique.          |
| `POST`       | `/api/v1/tasks`           | Crée une nouvelle tâche.                |
| `PUT`        | `/api/v1/tasks/<id>`      | Modifie une tâche existante.            |
| `DELETE`     | `/api/v1/tasks/<id>`      | Supprime une tâche.                     |

## Licence
Le projet est libre de droit.