const express = require('express');
const cors = require('cors');
const fs = require('fs/promises');
const path = require('path');

const app = express();

const PORT = 3000;

const DATA_FILE = path.join(__dirname, 'data','courses.json');

app.use(cors());
app.use(express.json());

async function readCourses() {
    const content =
        await fs.readFile(
            DATA_FILE,
            'utf-8'
        );
    return JSON.parse(content);
}

async function writeCourses(courses) {
    await fs.writeFile(
        DATA_FILE,
        JSON.stringify(courses, null , 2),
        'utf-8'
    );
}