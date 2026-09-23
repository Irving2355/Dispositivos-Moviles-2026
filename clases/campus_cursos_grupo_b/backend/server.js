const express = require('express');
const cors = require('cors');
const fs = require('fs/promises');
const path = require('path');

const app = express();

const PORT = 3000;

const DATA_FILE =
    path.join(__dirname, 'data', 'courses.json');


app.use(cors());

app.use(express.json());

async function readCourses() {

  const content =
      await fs.readFile(
        DATA_FILE,
        'utf8'
      );

  return JSON.parse(content);
}

async function writeCourses(courses) {

  await fs.writeFile(
    DATA_FILE,
    JSON.stringify(courses, null, 2),
    'utf8'
  );
}

function validateCourse(body) {

  const name =
      String(body.name ?? '').trim();

  const description =
      String(body.description ?? '').trim();

  const teacher =
      String(body.teacher ?? '').trim();

  const semester =
      Number(body.semester);


  const errors = [];


  if (name.length < 3) {

    errors.push(
      'El nombre debe tener al menos 3 caracteres.'
    );

  }


  if (description.length < 5) {

    errors.push(
      'La descripción debe tener al menos 5 caracteres.'
    );

  }


  if (teacher.length < 3) {

    errors.push(
      'El profesor es obligatorio.'
    );

  }


  if (
    !Number.isInteger(semester) ||
    semester < 1 ||
    semester > 12
  ) {

    errors.push(
      'El semestre debe ser un número entre 1 y 12.'
    );

  }


  return {
    errors,
    data: {
      name,
      description,
      teacher,
      semester
    }
  };
}

app.get('/api/health', (req, res) => {

  res.json({
    ok: true,
    message: 'Campus Cursos API funcionando'
  });

});

app.get('/api/courses', async (req, res) => {

  try {

    const courses =
        await readCourses();

    res.json(courses);

  } catch (error) {

    console.error(error);

    res.status(500).json({
      message:
          'No fue posible leer los cursos.'
    });

  }

});

app.get('/api/courses/:id', async (req, res) => {

  try {

    const id =
        Number(req.params.id);

    const courses =
        await readCourses();

    const course =
        courses.find(
          item => item.id === id
        );


    if (!course) {

      return res.status(404).json({
        message:
            'Curso no encontrado.'
      });

    }


    res.json(course);

  } catch (error) {

    console.error(error);

    res.status(500).json({
      message:
          'No fue posible obtener el curso.'
    });

  }

});

app.post('/api/courses', async (req, res) => {

  try {

    const validation =
        validateCourse(req.body);


    if (validation.errors.length > 0) {

      return res.status(400).json({
        message:
            'Datos incorrectos.',
        errors:
            validation.errors
      });

    }


    const courses =
        await readCourses();


    const nextId =
        courses.reduce(
          (maximum, course) =>
              Math.max(
                maximum,
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

    res.status(500).json({
      message:
          'No fue posible crear el curso.'
    });

  }

});

app.put('/api/courses/:id', async (req, res) => {

  try {

    const id =
        Number(req.params.id);

    const validation =
        validateCourse(req.body);


    if (validation.errors.length > 0) {

      return res.status(400).json({
        message:
            'Datos incorrectos.',
        errors:
            validation.errors
      });

    }


    const courses =
        await readCourses();


    const index =
        courses.findIndex(
          course => course.id === id
        );


    if (index === -1) {

      return res.status(404).json({
        message:
            'Curso no encontrado.'
      });

    }


    const updatedCourse = {
      id,
      ...validation.data
    };


    courses[index] =
        updatedCourse;


    await writeCourses(courses);


    res.json(updatedCourse);

  } catch (error) {

    console.error(error);

    res.status(500).json({
      message:
          'No fue posible actualizar el curso.'
    });

  }

});

app.delete('/api/courses/:id', async (req, res) => {

  try {

    const id =
        Number(req.params.id);

    const courses =
        await readCourses();


    const index =
        courses.findIndex(
          course => course.id === id
        );


    if (index === -1) {

      return res.status(404).json({
        message:
            'Curso no encontrado.'
      });

    }


    courses.splice(index, 1);


    await writeCourses(courses);


    res.status(204).send();

  } catch (error) {

    console.error(error);

    res.status(500).json({
      message:
          'No fue posible eliminar el curso.'
    });

  }

});

app.listen(
  PORT,
  '0.0.0.0',
  () => {

    console.log(
      `Campus Cursos API ejecutándose en puerto ${PORT}`
    );

  }
);