# Makefile para gestionar las APIs en Linux
.PHONY: help setup install-api1 install-api2 run-api1 run-api2 test clean

# Colores para output
GREEN=\033[0;32m
YELLOW=\033[1;33m
RED=\033[0;31m
NC=\033[0m # No Color

help: ## Mostrar ayuda
	@echo "$(GREEN)🛠️  Comandos disponibles para las APIs:$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""

setup: ## Configurar entorno Ubuntu completo
	@echo "$(GREEN)🔧 Configurando entorno...$(NC)"
	@chmod +x *.sh
	@./setup-ubuntu.sh

install-api1: ## Instalar dependencias de API #1 (JavaScript)
	@echo "$(GREEN)📦 Instalando dependencias de API #1...$(NC)"
	@cd api1-javascript && npm install

install-api2: ## Instalar dependencias de API #2 (Python)
	@echo "$(GREEN)📦 Instalando dependencias de API #2...$(NC)"
	@cd api2-python && python3 -m venv venv
	@cd api2-python && source venv/bin/activate && pip install -r requirements.txt

install: install-api1 install-api2 ## Instalar dependencias de ambas APIs

run-api1: ## Ejecutar API #1 (JavaScript) en puerto 3001
	@echo "$(GREEN)🚀 Ejecutando API #1...$(NC)"
	@./run-api1.sh

run-api2: ## Ejecutar API #2 (Python) en puerto 3002
	@echo "$(GREEN)🚀 Ejecutando API #2...$(NC)"
	@./run-api2.sh

test: ## Probar ambas APIs
	@echo "$(GREEN)🧪 Probando APIs...$(NC)"
	@./test-apis.sh

clean: ## Limpiar archivos temporales y dependencias
	@echo "$(YELLOW)🧹 Limpiando archivos temporales...$(NC)"
	@rm -rf api1-javascript/node_modules
	@rm -rf api2-python/venv
	@rm -rf api2-python/__pycache__
	@echo "$(GREEN)✅ Limpieza completada$(NC)"

dev: ## Modo desarrollo - Ejecutar ambas APIs en background
	@echo "$(GREEN)🚀 Iniciando ambas APIs en modo desarrollo...$(NC)"
	@echo "$(YELLOW)API #1 en puerto 3001, API #2 en puerto 3002$(NC)"
	@cd api1-javascript && npm install && npm start & \
	cd api2-python && python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt && python3 app.py &
	@echo "$(GREEN)✅ APIs iniciadas. Usa Ctrl+C para detener$(NC)"

status: ## Verificar estado de las APIs
	@echo "$(GREEN)📊 Verificando estado de las APIs...$(NC)"
	@curl -s http://localhost:3001/check > /dev/null && echo "$(GREEN)✅ API #1 (puerto 3001) está activa$(NC)" || echo "$(RED)❌ API #1 (puerto 3001) no responde$(NC)"
	@curl -s http://localhost:3002/check > /dev/null && echo "$(GREEN)✅ API #2 (puerto 3002) está activa$(NC)" || echo "$(RED)❌ API #2 (puerto 3002) no responde$(NC)"

# Targets por defecto
.DEFAULT_GOAL := help
