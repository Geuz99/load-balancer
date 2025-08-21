const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para parsear JSON
app.use(express.json());

// Endpoint 1: "/check" - Verificación de estado
app.get('/check', (req, res) => {
    res.status(200).json({
        status: 'OK',
        message: 'API #1 está funcionando correctamente',
        timestamp: new Date().toISOString()
    });
});

// Endpoint 2: "/" - Retorna el objeto JSON específico para API #1
app.get('/', (req, res) => {
    const responseObject = {
        "Instancia": "Instancia #1 - API #1",
        "Curso": "Seminario de Sistemas 1",
        "Estudiante": "Anderson Zuleta - 201800500"
    };
    
    res.status(200).json(responseObject);
});

// Middleware para rutas no encontradas
app.use('*', (req, res) => {
    res.status(404).json({
        error: 'Endpoint no encontrado',
        availableEndpoints: [
            'GET /',
            'GET /check'
        ]
    });
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`🚀 API #1 (JavaScript) ejecutándose en http://localhost:${PORT}`);
    console.log(`📋 Endpoints disponibles:`);
    console.log(`   - GET http://localhost:${PORT}/check (verificación de estado)`);
    console.log(`   - GET http://localhost:${PORT}/ (objeto JSON)`);
});

module.exports = app;
