# Script para ejecutar API #1 (JavaScript)
Write-Host "🚀 Iniciando API #1 (JavaScript)..." -ForegroundColor Green

# Verificar si Node.js está instalado
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Error: Node.js no está instalado." -ForegroundColor Red
    Write-Host "Por favor, instala Node.js desde: https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

# Cambiar al directorio de la API
Set-Location "$PSScriptRoot\api1-javascript"

# Verificar si package.json existe
if (-not (Test-Path "package.json")) {
    Write-Host "❌ Error: No se encontró package.json" -ForegroundColor Red
    exit 1
}

# Instalar dependencias si no existe node_modules
if (-not (Test-Path "node_modules")) {
    Write-Host "📦 Instalando dependencias..." -ForegroundColor Yellow
    npm install
}

# Ejecutar la API
Write-Host "🌐 API #1 iniciándose en puerto 3001..." -ForegroundColor Cyan
npm start
