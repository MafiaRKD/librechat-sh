#!/bin/bash

set -e

# === Užívateľské nastavenia ===
OPENAI_API_KEY="sk-...sem-vloz-svoj-token..."
ADMIN_USERNAME="marek"
ADMIN_PASSWORD="silne-heslo"

# === Inštalácia docker a docker-compose ===
echo "🔍 Kontrola Dockeru..."
if ! command -v docker &> /dev/null; then
    echo "🐳 Docker sa inštaluje..."
    apt update && apt install -y docker.io
    systemctl enable docker
    systemctl start docker
fi

echo "🔍 Kontrola docker-compose..."
if ! command -v docker-compose &> /dev/null; then
    echo "🧩 Inštalujem docker-compose..."
    apt install -y docker-compose
fi

# === Klonovanie LibreChat ===
echo "📦 Klonujem LibreChat..."
cd /opt
git clone https://github.com/danny-avila/LibreChat.git
cd LibreChat

# === Vytvorenie .env ===
echo "🛠️  Vytváram .env súbor..."
cat > .env <<EOF
# OpenAI nastavenia
OPENAI_API_KEY=${OPENAI_API_KEY}
OPENAI_API_MODEL=gpt-4
DEFAULT_CHAT_GPT_MODEL=gpt-4

# Prístup
ALLOW_REGISTRATION=false
DEFAULT_ADMIN_USERNAME=${ADMIN_USERNAME}
DEFAULT_ADMIN_PASSWORD=${ADMIN_PASSWORD}
EOF

# === Spustenie ===
echo "🚀 Spúšťam LibreChat kontajnery..."
docker-compose -f docker/docker-compose.yml up -d

echo "✅ LibreChat je spustený na porte 3080"
echo "🌐 Prístup: http://<IP_tvojej_LXC>:3080"
echo "👤 Admin: ${ADMIN_USERNAME}"
echo "🔒 Heslo: ${ADMIN_PASSWORD}"
