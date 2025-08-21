#!/bin/bash

# Script para probar ambas APIs en Linux
echo "🧪 Probando APIs del proyecto HT1..."
echo "==============================================="

# Función para probar un endpoint
test_endpoint() {
    local url=$1
    local description=$2
    
    echo
    echo "🔍 Probando: $description"
    echo "URL: $url"
    
    # Verificar si curl está instalado
    if ! command -v curl &> /dev/null; then
        echo "❌ Error: curl no está instalado."
        echo "Instala curl ejecutando: sudo apt install curl"
        return 1
    fi
    
    # Realizar la petición con curl
    response=$(curl -s -w "\nHTTP_CODE:%{http_code}" "$url" 2>/dev/null)
    
    if [ $? -eq 0 ]; then
        # Separar el cuerpo de la respuesta del código HTTP
        http_code=$(echo "$response" | tail -n1 | sed 's/.*HTTP_CODE://')
        body=$(echo "$response" | sed '$d')
        
        if [ "$http_code" = "200" ]; then
            echo "✅ Respuesta exitosa (HTTP $http_code):"
            # Formatear JSON si jq está disponible
            if command -v jq &> /dev/null; then
                echo "$body" | jq .
            else
                echo "$body"
            fi
        else
            echo "⚠️ Respuesta con código HTTP: $http_code"
            echo "$body"
        fi
    else
        echo "❌ Error al conectar con $url"
        echo "Asegúrate de que la API esté ejecutándose."
    fi
}

echo
echo "🌐 Probando API #1 (JavaScript - Puerto 3001):"
test_endpoint "http://localhost:3001/check" "Endpoint de verificación (/check)"
test_endpoint "http://localhost:3001/" "Endpoint principal (/)"

echo
echo "🐍 Probando API #2 (Python - Puerto 3002):"
test_endpoint "http://localhost:3002/check" "Endpoint de verificación (/check)"
test_endpoint "http://localhost:3002/" "Endpoint principal (/)"

echo
echo "==============================================="
echo "✅ Pruebas completadas!"
echo
echo "📝 Notas:"
echo "- Si ves errores de conexión, asegúrate de que las APIs estén ejecutándose"
echo "- Ejecuta ./run-api1.sh en una terminal para la API de JavaScript"
echo "- Ejecuta ./run-api2.sh en otra terminal para la API de Python"
echo "- Para formatear JSON automáticamente, instala jq: sudo apt install jq"
