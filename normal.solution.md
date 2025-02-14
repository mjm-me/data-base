# Normalización

Alumno ID
Nombre
Aula
Piso
Asignatura 1
Profesor 1
Asignatura 2
Profesor 2
Asignatura31
Profesor 3

## Tabla plana


| Alumno ID | Nombre | Aula | Asignatura 1 | Asignatura 2 | Asignatura 3 |
| --------- | ------ | ---- | ------------ | ------------ | ------------ | 
| 1         | Pepe   | 101  | Matemáticas  | Física       | Química      |
| 2         | María  | 101  | Matemáticas  | Física       | Química      |
| 3         | Pedro  | 102  | Biología     | Química      | Física       |
| 4         | Luisa  | 102  | Biología     | Química      | Física       |


## 1er nivel normalización Tener clave primaria y los datos atómicos

| Alumno ID | Nombre | Aula | Asignatura | Hora/orden |
| --------- | ------ | ---- | ------------ | ------------ | 
| 1         | Pepe   | 101  | Matemáticas  | 8:00         | 
| 1         | Pepe   | 101  | Física       | 12:00        | 
| 1         | Pepe   | 101  | Química      | 13:00        | 
| 2         | María  | 101  | -----------  | ----------   | 
| 3         | Pedro  | 102  | -----------  | ----------   | 
| 4         | Luisa  | 102  | -----------  | ----------   |

El objetivo es crecer en vertical, no horizontal
si Pepe se apunta a otra asignatura solo lo añado
| Alumno ID | Nombre | Aula | Asignatura | Hora/orden |
| --------- | ------ | ---- | ------------ | ------------ | 
| 1         | Pepe   | 101  | Matemáticas  | 8:00         | 
| 1         | Pepe   | 101  | Física       | 12:00        | 
| 1         | Pepe   | 101  | Química      | 13:00        | 
| 1         | Pepe   | 101  | Química      | 13:00        | 
| 1         | Pepe   | 102  | Gimnasia     | 09:00        |
| 2         | María  | 101  | -----------  | ----------   | 
| 3         | Pedro  | 102  | -----------  | ----------   | 
| 4         | Luisa  | 102  | -----------  | ----------   |


## 2nd nivel se deben 
| Alumno ID | Nombre | 
| --------- | ------ | 
| 1         | Pepe   | 
| 2         | María  |
| 3         | Pedro  |
| 4         | Luisa  |

| Alumno ID | Asignatura | Hora/orden |
| --------- | ---------- | ------------ | 
| 1         | Matemáticas  | 8:00         | 
| 1         | Pepe   | 101  | Física       | 12:00        | 
| 1         | Pepe   | 101  | Química      | 13:00        | 
| 1         | Pepe   | 101  | Química      | 13:00        | 
| 1         | Pepe   | 102  | Gimnasia     | 09:00        |
| 2         | María  | 101  | -----------  | ----------   | 
| 3         | Pedro  | 102  | -----------  | ----------   | 
| 4         | Luisa  | 102  | -----------  | ----------   |

## 3 Forma normal




let zz1= = 23
let zz2= = 54
let zz3= = 15

let zz = [23, 54, 15]