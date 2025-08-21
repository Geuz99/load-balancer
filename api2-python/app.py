from flask import Flask, jsonify
from datetime import datetime
import os

# Crear la aplicación Flask
app = Flask(__name__)

# Configuración
app.config['JSON_SORT_KEYS'] = False

@app.route('/check', methods=['GET'])
def check_status():
    """
    Endpoint 1: Verificación de estado
    Retorna código 200 [OK]
    """
    return jsonify({
        'status': 'OK',
        'message': 'API #2 está funcionando correctamente',
        'timestamp': datetime.now().isoformat()
    }), 200

@app.route('/', methods=['GET'])
def get_api_info():
    """
    Endpoint 2: Retorna el objeto JSON específico para API #2
    """
    response_object = {
        "Instancia": "Instancia #2 - API #2",
        "Curso": "Seminario de Sistemas 1",
        "Estudiante": "Anderson Zuleta - 201800500"
    }
    
    return jsonify(response_object), 200

@app.errorhandler(404)
def not_found(error):
    """Manejo de rutas no encontradas"""
    return jsonify({
        'error': 'Endpoint no encontrado',
        'available_endpoints': [
            'GET /',
            'GET /check'
        ]
    }), 404

@app.errorhandler(500)
def internal_error(error):
    """Manejo de errores internos del servidor"""
    return jsonify({
        'error': 'Error interno del servidor'
    }), 500

if __name__ == '__main__':
    # Configuración del puerto
    port = int(os.environ.get('PORT', 3000))
    
    print(f"🚀 API #2 (Python) ejecutándose en http://localhost:{port}")
    print(f"📋 Endpoints disponibles:")
    print(f"   - GET http://localhost:{port}/check (verificación de estado)")
    print(f"   - GET http://localhost:{port}/ (objeto JSON)")
    
    # Ejecutar la aplicación
    app.run(
        host='0.0.0.0',
        port=port,
        debug=True
    )
