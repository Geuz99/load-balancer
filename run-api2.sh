#!/bin/bash

# Script para ejecutar API #2 (Python) en Linux
echo "🚀 Iniciando API #2 (Python)..."

# Verificar si Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python3 no está instalado."
    echo "Instala Python3 ejecutando:"
    echo "  sudo apt update"
    echo "  sudo apt install python3 python3-pip python3-venv"
    exit 1
fi

# Obtener el directorio del script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
API_DIR="$SCRIPT_DIR/api2-python"

# Cambiar al directorio de la API
cd "$API_DIR" || {
    echo "❌ Error: No se pudo acceder al directorio $API_DIR"
    exit 1
}

# Verificar si requirements.txt existe
if [ ! -f "requirements.txt" ]; then
    echo "❌ Error: No se encontró requirements.txt"
    exit 1
fi

# Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "📦 Creando entorno virtual..."
    python3 -m venv venv
    if [ $? -ne 0 ]; then
        echo "❌ Error al crear el entorno virtual"
        exit 1
    fi
fi

# Activar entorno virtual
echo "🔧 Activando entorno virtual..."
source venv/bin/activate

# Actualizar pip
echo "🔄 Actualizando pip..."
pip install --upgrade pip

# Instalar dependencias
echo "📦 Instalando dependencias..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "❌ Error al instalar dependencias"
    deactivate
    exit 1
fi

# Ejecutar la API
echo "🌐 API #2 iniciándose en puerto 3002..."
echo "Presiona Ctrl+C para detener la API"
python3 app.py
