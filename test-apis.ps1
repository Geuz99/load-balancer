# Script para probar ambas APIs
Write-Host "🧪 Probando APIs del proyecto HT1..." -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan

# Función para probar un endpoint
function Test-Endpoint {
    param(
        [string]$url,
        [string]$description
    )
    
    Write-Host "`n🔍 Probando: $description" -ForegroundColor Yellow
    Write-Host "URL: $url" -ForegroundColor Gray
    
    try {
        $response = Invoke-RestMethod -Uri $url -Method Get -TimeoutSec 10
        Write-Host "✅ Respuesta exitosa:" -ForegroundColor Green
        $response | ConvertTo-Json -Depth 3 | Write-Host
    }
    catch {
        Write-Host "❌ Error al conectar con $url" -ForegroundColor Red
        Write-Host "Asegúrate de que la API esté ejecutándose." -ForegroundColor Yellow
    }
}

Write-Host "`n🌐 Probando API #1 (JavaScript - Puerto 3001):" -ForegroundColor Magenta
Test-Endpoint "http://localhost:3001/check" "Endpoint de verificación (/check)"
Test-Endpoint "http://localhost:3001/" "Endpoint principal (/)"

Write-Host "`n🐍 Probando API #2 (Python - Puerto 3002):" -ForegroundColor Magenta
Test-Endpoint "http://localhost:3002/check" "Endpoint de verificación (/check)"
Test-Endpoint "http://localhost:3002/" "Endpoint principal (/)"

Write-Host "`n===============================================" -ForegroundColor Cyan
Write-Host "✅ Pruebas completadas!" -ForegroundColor Green
Write-Host "`n📝 Notas:" -ForegroundColor Yellow
Write-Host "- Si ves errores de conexión, asegúrate de que las APIs estén ejecutándose" -ForegroundColor Gray
Write-Host "- Ejecuta run-api1.ps1 en una terminal para la API de JavaScript" -ForegroundColor Gray
Write-Host "- Ejecuta run-api2.ps1 en otra terminal para la API de Python" -ForegroundColor Gray
