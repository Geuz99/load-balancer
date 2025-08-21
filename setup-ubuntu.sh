#!/bin/bash

# Script de configuración inicial para Linux (Ubuntu)
echo "🛠️ Configurando entorno para APIs en Ubuntu..."
echo "==============================================="

# Función para verificar si un comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Actualizar repositorios
echo "🔄 Actualizando repositorios del sistema..."
sudo apt update

# Instalar curl (necesario para las pruebas)
if ! command_exists curl; then
    echo "📦 Instalando curl..."
    sudo apt install -y curl
else
    echo "✅ curl ya está instalado"
fi

# Instalar jq para formateo JSON (opcional pero útil)
if ! command_exists jq; then
    echo "📦 Instalando jq (formateador JSON)..."
    sudo apt install -y jq
else
    echo "✅ jq ya está instalado"
fi

# Instalar Node.js y npm
if ! command_exists node; then
    echo "📦 Instalando Node.js y npm..."
    sudo apt install -y nodejs npm
    
    # Verificar versión instalada
    echo "Node.js versión: $(node --version)"
    echo "npm versión: $(npm --version)"
else
    echo "✅ Node.js ya está instalado ($(node --version))"
fi

# Instalar Python3 y pip
if ! command_exists python3; then
    echo "📦 Instalando Python3, pip y venv..."
    sudo apt install -y python3 python3-pip python3-venv
    
    # Verificar versión instalada
    echo "Python versión: $(python3 --version)"
    echo "pip versión: $(pip3 --version)"
else
    echo "✅ Python3 ya está instalado ($(python3 --version))"
    
    # Asegurar que pip y venv están instalados
    if ! command_exists pip3; then
        echo "📦 Instalando pip3..."
        sudo apt install -y python3-pip
    fi
    
    if ! dpkg -l | grep -q python3-venv; then
        echo "📦 Instalando python3-venv..."
        sudo apt install -y python3-venv
    fi
fi

echo
echo "🔧 Configurando permisos de ejecución para los scripts..."

# Obtener el directorio del script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Dar permisos de ejecución a todos los scripts .sh
chmod +x "$SCRIPT_DIR"/*.sh

echo "✅ Permisos configurados para:"
ls -la "$SCRIPT_DIR"/*.sh | awk '{print "   " $1 " " $9}'

echo
echo "==============================================="
echo "✅ Configuración completada!"
echo
echo "🚀 Para ejecutar las APIs:"
echo "   ./run-api1.sh    # API JavaScript (puerto 3001)"
echo "   ./run-api2.sh    # API Python (puerto 3002)"
echo "   ./test-apis.sh   # Probar ambas APIs"
echo
echo "📝 Nota: Ejecuta cada API en terminales separadas"
