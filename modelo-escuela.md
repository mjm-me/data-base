# Relación Entidades Cantidad Atributos

## Entidades:          Atributos:

Alumno              - id_alumno
                    - nombre
                    - apellidos
                    - fecha_nacimiento
                    - dirección
                    - teléfono
                    - email

Asignatura          - id_asignatura
                    - nombre
                    - curso
                    - horas_semanales

Profesor            - id_profesor
                    - nombre
                    - apellidos
                    - fecha_nacimiento
                    - dirección
                    - teléfono
                    - email

Departamento        - id_departamento
                    - nombre
                    - teléfono
                    - email

Grupo               - id_grupo      
                    - curso
                    - letra         

Aula                - id_aula
                    - capacidad
                    - ubicación                   


## Relación
Alumno se matricula asignatura/s -----> 1 - n (mínimo 1, nunca null)
se matricula {
    - entidades: alumno + asignatura
    - relaciones: id_alumno, id_asignatura
    - cardinalidad: M:N
    - opcionalidad: 1:1 (un alumno siempre tiene que apuntarse a )
    - atributos de la relación: fecha_matriculación, calificación
}


Asignatura asigna un grupo -------> 1 a 1
se matricula {
    - entidades: alumno + grupo (matemáicas-1C)
    - relaciones: id_alumno, id_grupo
    - cardinalidad: M:N
    - opcionalidad: 1:1
    - atributos de la relación: fecha_matriculación, calificación
}

Profesor imparte Grupos (misma asignatura o diferentes) ----> 1 a n
imparte {
    - entidades: profesor + grupo
    - relaciones: id_profesor, id_grupo
    - cardinalidad: M:N
    - opcionalidad: 1:1
    - atributos de la relación:
}

Una asignatura se divide en grupos, que son específicos de una asignatura
se_divide_en {
    - entidades: asignatura + grupo
    - relaciones: id_asignatura, id_grupo
    - cardinalidad: 1:N
    - opcionalidad: 1:1
    - atributos de la relación:
} 

Las clases de cada grupo de una asignatura se imparten en días, horas y aulas determinadas
se_imparte_en {
    - entidades: grupo + aula
    - relaciones: id_grupo, id_aula
    - cardinalidad: M:N
    - opcionalidad: 1:1
    - atributos de la relación: días, hora_inicio, hora_fin
} 


Todo profesor pertenece a un departamento
pertenece {
    - entidades: profesor + departamento
    - relaciones: id_profesor, id_departamento
    - cardinalidad: N:1
    - opcionalidad: 1:1
    - atributos de la relación: es_director (como esto da muchas veces nulo, es mejor dejarlo en una entidad positiva "dirige", mirar abajo)
}

Todo departamento debe tener un director, que es un profesor (guardo cuándo eres director, no uso 400 veces el caso en el que no eres director)
dirige {
    - entidades: profesor + departamento
    - relaciones: id_profesor, id_departamento
    - cardinalidad: 1:1
    - opcionalidad: 1:1
    - atributos de la relación: des, hasta
}