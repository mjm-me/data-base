- Una biblioteca tiene muchos libros
- Los libros están agrupados por temática
- Las personas pueden sacar máximo tres libros
- Los libros se prestan máximo por un mes
- La biblioteca tiene seis empleados de mañana y seis empleados de tarde
- La biblioteca tiene un director

## Biblioteca: Contiene la información sobre la biblioteca en sí.
    - BibliotecaID: Identificador único de la biblioteca.
    - Nombre: Nombre de la biblioteca.
    - Dirección: Dirección de la biblioteca.
    - Horario: Horario de funcionamiento de la biblioteca.

## Usuarios: Contiene la información de los usuarios registrados en la biblioteca.
    - UsuarioID: Identificador único del usuario.
    - Nombre: Nombre del usuario.
    - Teléfono: Teléfono del usuario.
    - Email: Correo electrónico del usuario.
    - FechaRegistro: Fecha en que el usuario se registró en la biblioteca.
  
## Libros: Contiene la información de los libros disponibles en la biblioteca.
    - LibroID: Identificador único del libro.
    - Titulo: Título del libro.
    - Autor: Autor del libro.
    - Genero: Género del libro.
    - AñoPublicacion: Año de publicación del libro.
    - Disponible: Indica si el libro está disponible para préstamo.

## Préstamos: Registra los préstamos realizados.
    - PrestamoID: Identificador único del préstamo.
    - UsuarioID: Identificador del usuario que realizó el préstamo.
    - LibroID: Identificador del libro prestado.
    - FechaPrestamo: Fecha en que se realizó el préstamo.
    - FechaDevolucion: Fecha en que el libro debe ser devuelto.

## Empleados: trabajadores de la biblioteca incluido el director
    - EmpleadoID: Identificador único del empleado.
    - Nombre: Nombre del empleado.
    - Cargo: Cargo del empleado (por ejemplo, "Bibliotecario" o "Director").
    - TurnoID: Identificador del turno en el que trabaja el empleado (puede ser NULL para el director).
    - EsDirector: Indica si el empleado es el director (TRUE o FALSE).

## Turnos: Contiene la información de los turnos en la biblioteca.
    - TurnoID: Identificador único del turno.
    - Descripción: Descripción "Mañana", "Tarde".
    - Horario: Horario del turno.


## Solución

### Entidades y atributos
biblioteca: id_biblioteca, nombre, dirección, horario
usuario: id_usuario, nombre, email, teléfono, fecha_registro
libro: id_libro, titulo, autor, genero, año_publicación, disponible
prestamos: id_préstamo, id_usuario, id_libro,fecha_préstamo, fecha_devolución
empleado: id_empleado, nombre, cargo, id_turno, es_director
turnos: id_turno, descripción, horario


### Relaciones

Una biblioteca tiene muchos libros
- entidades: biblioteca + libro
- relaciones: id_biblioteca, id_libro
- cardinalidad: 1:N
- opcionalidad: 1:1
- atributos: 

La biblioteca tiene seis empleados de mañana y seis empleados de tarde
- entidades: biblioteca + empleado
- relaciones: id_biblioteca, id_empleado
- cardinalidad: 1:N
- opcionalidad: 1:1
- atributos: id_turno, descripción, horario




## Ejemplo de Datos Normalizados
### Biblioteca tiene una única entrada con su información general y el DirectorID como referencia a la tabla de empleados.
Tabla Biblioteca: Contiene la información sobre la biblioteca en sí, con el director como atributo.
CREATE TABLE Biblioteca (
    BibliotecaID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Dirección VARCHAR(255),
    Horario VARCHAR(255),
    DirectorID INT,
    FOREIGN KEY (DirectorID) REFERENCES Empleados(EmpleadoID)
);

### Temáticas contiene diferentes temas como "Ciencia", "Literatura", "Historia", etc.
Tabla Temáticas: Contiene los diferentes temas en los que los libros están agrupados.
CREATE TABLE Temáticas (
    TemáticaID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

### Libros agrupa libros según las temáticas.
Tabla Libros: Contiene la información de los libros disponibles en la biblioteca, incluyendo la temática a la que pertenecen.
CREATE TABLE Libros (
    LibroID INT PRIMARY KEY,
    Título VARCHAR(255),
    Autor VARCHAR(255),
    Género VARCHAR(255),
    AñoPublicacion YEAR,
    Disponible BOOLEAN,
    TemáticaID INT,
    FOREIGN KEY (TemáticaID) REFERENCES Temáticas(TemáticaID)
);

### Usuarios registra los usuarios y su información de contacto.
Tabla Usuarios: Contiene la información de los usuarios registrados en la biblioteca.
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Teléfono VARCHAR(255),
    Email VARCHAR(255),
    FechaRegistro DATE
);

### Préstamos controla los libros prestados, asegurando las restricciones de cantidad y tiempo.
Tabla Préstamos: Registra los préstamos realizados, limitando a un máximo de tres libros por usuario y con una duración máxima de un mes.
CREATE TABLE Préstamos (
    PrestamoID INT PRIMARY KEY,
    UsuarioID INT,
    LibroID INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID),
    CHECK (FechaDevolucion <= DATE_ADD(FechaPrestamo, INTERVAL 1 MONTH)),
    CHECK ((SELECT COUNT(*) FROM Préstamos WHERE UsuarioID = NEW.UsuarioID AND FechaDevolucion IS NULL) <= 3)
);


### Empleados incluye todos los empleados, identificando si son directores o no mediante el atributo Cargo.
Tabla Empleados: Contiene la información de los empleados de la biblioteca, incluyendo el director.
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Cargo VARCHAR(255),
    TurnoID INT,
    FOREIGN KEY (TurnoID) REFERENCES Turnos(TurnoID)
);

### Turnos gestiona la asignación de turnos de trabajo.
Tabla Turnos: Contiene la información de los turnos en la biblioteca.
CREATE TABLE Turnos (
    TurnoID INT PRIMARY KEY,
    Descripción VARCHAR(255),
    Horario VARCHAR(255)
);
