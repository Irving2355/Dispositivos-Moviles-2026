// API REST de solo lectura para la base de datos Sakila.
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

const app = express();
app.use(cors());
const pool = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME || 'sakila',
  waitForConnections: true,
  connectionLimit: 5,
});

// GET devuelve los primeros 20 registros existentes; NO modifica la BD.
app.get('/api/peliculas', async (_req, res) => {
  try {
    const [filas] = await pool.query(
      'SELECT film_id AS id, title AS titulo, release_year AS anio FROM film ORDER BY film_id LIMIT 20'
    );
    res.json(filas);
  } catch (error) {
    console.error('Error de MySQL:', error.message);
    res.status(500).json({ error: 'No se pudo consultar la base de datos' });
  }
});

const puerto = Number(process.env.PORT || 3000);
app.listen(puerto, '0.0.0.0', () => {
  console.log(`API escuchando en http://localhost:${puerto}/api/peliculas`);
});
