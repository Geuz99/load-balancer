# Script para ejecutar API #2 (Python)
Write-Host "🚀 Iniciando API #2 (Python)..." -ForegroundColor Green

# Verificar si Python está instalado
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Error: Python no está instalado." -ForegroundColor Red
    Write-Host "Por favor, instala Python desde: https://python.org/" -ForegroundColor Yellow
    exit 1
}

# Cambiar al directorio de la API
Set-Location "$PSScriptRoot\api2-python"

# Verificar si requirements.txt existe
if (-not (Test-Path "requirements.txt")) {
    Write-Host "❌ Error: No se encontró requirements.txt" -ForegroundColor Red
    exit 1
}

# Crear entorno virtual si no existe
if (-not (Test-Path "venv")) {
    Write-Host "📦 Creando entorno virtual..." -ForegroundColor Yellow
    python -m venv venv
}

# Activar entorno virtual
Write-Host "🔧 Activando entorno virtual..." -ForegroundColor Yellow
& "venv\Scripts\Activate.ps1"

# Instalar dependencias
Write-Host "📦 Instalando dependencias..." -ForegroundColor Yellow
pip install -r requirements.txt

# Ejecutar la API
Write-Host "🌐 API #2 iniciándose en puerto 3002..." -ForegroundColor Cyan
python app.py
