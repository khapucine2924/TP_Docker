#!/bin/bash

# Démarrer Kibana en arrière-plan
/usr/local/bin/kibana-docker &

# Attendre que Kibana soit prêt
until curl -s http://localhost:5601/api/status | grep -q "\"state\":\"green\""; do
  echo "Waiting for Kibana to be disponible..."
  sleep 5
done

# Créer l'index pattern
curl -X POST "http://localhost:5601/api/saved_objects/index-pattern" \
  -H "kbn-xsrf: true" \
  -H "Content-Type: application/json" \
  -d '{
    "attributes": {
      "title": "nginx-logs-*",
      "timeFieldName": "@timestamp"
    }
  }'

# Garder le conteneur en fonctionnement
wait