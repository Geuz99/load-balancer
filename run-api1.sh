#!/bin/bash

# Script para ejecutar API #1 (JavaScript) en Linux
echo "🚀 Iniciando API #1 (JavaScript)..."

# Verificar si Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Error: Node.js no está instalado."
    echo "Instala Node.js ejecutando:"
    echo "  sudo apt update"
    echo "  sudo apt install nodejs npm"
    echo "O descarga desde: https://nodejs.org/"
    exit 1
fi

# Obtener el directorio del script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
API_DIR="$SCRIPT_DIR/api1-javascript"

# Cambiar al directorio de la API
cd "$API_DIR" || {
    echo "❌ Error: No se pudo acceder al directorio $API_DIR"
    exit 1
}

# Verificar si package.json existe
if [ ! -f "package.json" ]; then
    echo "❌ Error: No se encontró package.json"
    exit 1
fi

# Instalar dependencias si no existe node_modules
if [ ! -d "node_modules" ]; then
    echo "📦 Instalando dependencias..."
    npm install
    if [ $? -ne 0 ]; then
        echo "❌ Error al instalar dependencias"
        exit 1
    fi
fi

# Ejecutar la API
echo "🌐 API #1 iniciándose en puerto 3001..."
echo "Presiona Ctrl+C para detener la API"
npm start
