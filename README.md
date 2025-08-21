# HT1 - Seminario de Sistemas 1
## Proyecto: 2 APIs Web

Este proyecto implementa 2 APIs web desarrolladas en diferentes lenguajes de programación, cada una con 2 endpoints específicos.

### 📋 Estructura del Proyecto

```
HT1/
├── api1-javascript/          # API #1 desarrollada en JavaScript (Node.js + Express)
│   ├── package.json
│   └── server.js
├── api2-python/             # API #2 desarrollada en Python (Flask)
│   ├── requirements.txt
│   └── app.py
└── README.md
```

### 🚀 APIs Implementadas

#### API #1 - JavaScript (Node.js + Express)
- **Puerto**: 3001
- **Tecnologías**: Node.js, Express.js
- **Endpoints**:
  - `GET /check` - Verificación de estado (retorna 200 OK)
  - `GET /` - Retorna objeto JSON específico

#### API #2 - Python (Flask)
- **Puerto**: 3002
- **Tecnologías**: Python, Flask
- **Endpoints**:
  - `GET /check` - Verificación de estado (retorna 200 OK)
  - `GET /` - Retorna objeto JSON específico

### 📦 Instalación y Ejecución

#### 🪟 Windows (PowerShell)

**Ejecución rápida con scripts:**
```powershell
.\run-api1.ps1    # API JavaScript (puerto 3001)
.\run-api2.ps1    # API Python (puerto 3002)
.\test-apis.ps1   # Probar ambas APIs
```

**Instalación manual:**

**API #1 (JavaScript):**
1. Navegar al directorio: `cd api1-javascript`
2. Instalar dependencias: `npm install`
3. Ejecutar: `npm start`

**API #2 (Python):**
1. Navegar al directorio: `cd api2-python`
2. Crear entorno virtual: `python -m venv venv`
3. Activar entorno: `venv\Scripts\Activate.ps1`
4. Instalar dependencias: `pip install -r requirements.txt`
5. Ejecutar: `python app.py`

#### 🐧 Linux (Ubuntu/Bash)

**Configuración inicial (solo la primera vez):**
```bash
chmod +x *.sh
./setup-ubuntu.sh
```

**Ejecución rápida con scripts:**
```bash
./run-api1.sh     # API JavaScript (puerto 3001)
./run-api2.sh     # API Python (puerto 3002)
./test-apis.sh    # Probar ambas APIs
```

**Instalación manual:**

**Dependencias del sistema:**
```bash
sudo apt update
sudo apt install nodejs npm python3 python3-pip python3-venv curl jq
```

**API #1 (JavaScript):**
1. Navegar al directorio: `cd api1-javascript`
2. Instalar dependencias: `npm install`
3. Ejecutar: `npm start`

**API #2 (Python):**
1. Navegar al directorio: `cd api2-python`
2. Crear entorno virtual: `python3 -m venv venv`
3. Activar entorno: `source venv/bin/activate`
4. Instalar dependencias: `pip install -r requirements.txt`
5. Ejecutar: `python3 app.py`

**Ambas APIs estarán disponibles en:**
- API #1: `http://localhost:3001`
- API #2: `http://localhost:3002`

### 🧪 Pruebas de los Endpoints

#### API #1 (JavaScript) - Puerto 3001

**Endpoint de verificación:**
```bash
curl http://localhost:3001/check
```

**Endpoint principal:**
```bash
curl http://localhost:3001/
```

#### API #2 (Python) - Puerto 3002

**Endpoint de verificación:**
```bash
curl http://localhost:3002/check
```

**Endpoint principal:**
```bash
curl http://localhost:3002/
```

### 📝 Respuestas Esperadas

#### Endpoint `/check` (ambas APIs)
```json
{
  "status": "OK",
  "message": "API está funcionando correctamente",
  "timestamp": "2025-08-20T..."
}
```

#### Endpoint `/` 

**API #1:**
```json
{
  "Instancia": "Instancia #1 - API #1",
  "Curso": "Seminario de Sistemas 1",
  "Estudiante": "Estudiante - #Carnet"
}
```

**API #2:**
```json
{
  "Instancia": "Instancia #2 - API #2",
  "Curso": "Seminario de Sistemas 1",
  "Estudiante": "Estudiante - #Carnet"
}
```

### ✅ Requisitos Cumplidos

- ✅ 2 APIs web desarrolladas
- ✅ Cada API en un lenguaje diferente (JavaScript y Python)
- ✅ Endpoint `/check` en ambas APIs (retorna 200 OK)
- ✅ Endpoint `/` en ambas APIs (retorna JSON específico)
- ✅ Estructura JSON según especificaciones

### 🛠️ Tecnologías Utilizadas

- **API #1**: Node.js, Express.js
- **API #2**: Python, Flask
- **Formato de datos**: JSON
- **Protocolos**: HTTP/HTTPS
