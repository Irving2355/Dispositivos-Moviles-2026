const express = require('express');
const cors = require('cors');
const fs = require('fs/promises');
const path = require('path');
const { error } = require('console');

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

function validateCourse(body){
    const name = String(body.name ?? '').trim();

    const description = String(body.description ?? '').trim();

    const teacher = String(body.teacher ?? '').trim();

    const semester = Number(body.semester);

    const errors = [];

    if(name.length < 3){
        errors.push('El nombre de tener 3 caracteres');
    }

    if(description.length < 10){
        errors.push('El nombre de tener 3 caracteres');
    }

    if(teacher.length < 3){
        errors.push('El nombre de tener 3 caracteres');
    }

    if(!Number.isInteger(semester) || 
    semester < 1 ||
    semester > 10){
        errors.push('Semestre invalido');
    }

    return{
        errors,
        data: {
            name,
            description,
            teacher,
            semester
        }
    };
}

app.get('/api/health', (req, res)=>{
    res.json({
        ok: true,
        message: 'Api funcionando'
    });
});

app.get('/api/courses', async(req, res)=>{
    try{
        const courses = await readCourses();
        res.json(courses);
    }catch (error){
        console.error(error);
        res.status(500).json({
            message: 'No fue posible leer'
        });
    }
});

app.get('/api/courses/:id', async(req, res)=>{
    try{
        const id = Number(req.params.id);
        const courses = await readCourses();
        const course = courses.find(
            item => item.id === id
        );

        if(!course){
            return res.status(404).json({
                message: 'No esta XD'
            });
        }

        res.json(course);
    }catch(error){
        console.error(error);
    }
});

app.post('/api/courses', async(req, res)=>{
    try {
        const validation = validateCourse(req.body);

        if(validation.errors.length > 0){
            return res.status(400).json({
                message: 'Datos incorrectos',
                errors: validation.errors
            });
        }

        const courses = await readCourses();

        const nextId = courses.reduce(
            (maximum, course)=>
                Math.max(maximum,
                    Number(course.id) || 0
                ),
                0
        ) + 1;

        const newCourse = {
            id: nextId,
            ...validation.data
        };

        courses.push(newCourse);
        await writeCourses(courses);
        res.status(201).json(newCourse);
    } catch (error) {
        console.error(error);
    }
});

app.put('/api/courses/:id', async(req, res)=>{
    try {
        const id = Number(req.params.id);
        const validation = validateCourse(req.body);

        if(validation.errors.length > 0){
            return res.status(400).json({
                message: 'Datos incorrectos',
                errors: validation.errors
            });
        }

        const courses = await readCourses();
        const index = courses.findIndex(
            course => course.id === id
        );

        if(index === -1){
            return res.status(404).json({
                message: 'Curso no encontrado'
            });
        } 

        const updateCourse = {
            id,
            ...validation.data
        };

        courses[index] = updateCourse;
        await writeCourses(courses);
        res.json(updateCourse);
    } catch (error) {
        console.error(error);
    }
});

app.delete('/api/courses/:id', async(req, res)=>{
    try {
        const id = Number(req.params.id);
        
        const courses = await readCourses();
        const index = courses.findIndex(
            course => course.id === id
        );

        if(index === -1){
            return res.status(404).json({
                message: 'Curso no encontrado'
            });
        } 

        courses.splice(index, 1);

        await writeCourses(courses);
        res.status(204).send();
    } catch (error) {
        console.error(error);
    }
});

app.listen(
    PORT,
    '0.0.0.0',
    ()=>{
        console.log(
            'Api ejecutandose correctamente'
        );
    }
);