drop database if exists amigosenemigos;
create database amigosenemigos;
use amigosenemigos;


CREATE TABLE users (
    user_id INT primary key,
    user_alias VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100),
    phone CHAR(12) UNIQUE,
    friend INT DEFAULT 0,
    enemy INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    updated_at TIMESTAMP NOT NULL DEFAULT (NOW())
);

-- SELECT BIN_TO_UUID(user_id) AS user_id, user_alias FROM users;

CREATE TABLE users_relations (
  source_user_id INT NOT NULL,
  target_user_id INT NOT NULL,
  relation_type ENUM('friend', 'enemy'),
  created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
  updated_at TIMESTAMP NOT NULL DEFAULT (NOW()),
  PRIMARY KEY (source_user_id, target_user_id),
  FOREIGN KEY (source_user_id) REFERENCES users(user_id),
  FOREIGN KEY (target_user_id) REFERENCES users(user_id),
  CONSTRAINT check_other_id CHECK (source_user_id != target_user_id)
);

-- Crear el trigger para actualizar el conteo de amigos y enemigos
DELIMITER //

CREATE TRIGGER update_friend_enemy_counts
AFTER INSERT ON users_relations
FOR EACH ROW
BEGIN
  IF NEW.relation_type = 'friend' THEN
    UPDATE users
    SET friend = friend + 1
    WHERE user_id = NEW.source_user_id;

    UPDATE users
    SET friend = friend + 1
    WHERE user_id = NEW.target_user_id;
  ELSEIF NEW.relation_type = 'enemy' THEN
    UPDATE users
    SET enemy = enemy + 1
    WHERE user_id = NEW.source_user_id;

    UPDATE users
    SET enemy = enemy + 1
    WHERE user_id = NEW.target_user_id;
  END IF;
END//

DELIMITER ;

INSERT INTO users (user_id, user_alias, email, first_name, surname, phone, friend, enemy, created_at, updated_at) VALUES
(1, 'juanillo', 'jupe@example.com', 'Juan', 'Pérez', '123456789012', 5, 2, NOW(), NOW()),
(2, 'roseta', 'roba@example.com', 'Rosa', 'Barado', '098765432109', 8, 1, NOW(), NOW()),
(3, 'smithy', 'aliciasmith@example.com', 'Alicia', 'Smith', '111222333444', 3, 0, NOW(), NOW()),
(4, 'racima25', 'raci@example.com', 'Raúl', 'Cimas', '555666777888', 1, 4, NOW(), NOW()),
(5, 'brujilla', 'brujilla@example.com', 'Natalia', 'Dicenta', '999888777666', 2, 5, NOW(), NOW()),
(6, 'palcubo', 'palcubo@example.com', 'Pedro', 'Páramo', '333444555666', 6, 3, NOW(), NOW()),
(7, 'flipao', 'ericlapton@example.com', 'Eric', 'Clapton', '777888999000', 7, 2, NOW(), NOW()),
(8, 'karmele', 'rosarosae@example.com', 'Carmen', 'De la Rosa', '000111222333', 4, 1, NOW(), NOW());

INSERT INTO users_relations (source_user_id, target_user_id, relation_type, created_at, updated_at) VALUES
(1, 2, 'friend', NOW(), NOW()),
(2, 3, 'enemy', NOW(), NOW()),
(3, 4, 'friend', NOW(), NOW()),
(4, 5, 'friend', NOW(), NOW()),
(5, 6, 'friend', NOW(), NOW()),
(6, 7, 'friend', NOW(), NOW()),
(7, 8, 'friend', NOW(), NOW()),
(8, 1, 'enemy', NOW(), NOW());

SHOW tables;    