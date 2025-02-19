drop database if exists amigosenemigos;
create database amigosenemigos;
use amigosenemigos;

CREATE TABLE users
(      
    user_id binary(16) default (uuid_to_bin(uuid())) primary key,
    user_alias VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100),
    phone CHAR(12) UNIQUE,
    friends INT DEFAULT 0,
    enemies INT DEFAULT 0
);

delimiter //
CREATE TRIGGER upd_check BEFORE UPDATE ON account
       FOR EACH ROW
       BEGIN
           IF NEW.amount < 0 THEN
               SET NEW.amount = 0;
           ELSEIF NEW.amount > 100 THEN
               SET NEW.amount = 100;
           END IF;
       END;//
delimiter ;

CREATE TABLE user_relations
(    
    source_user_id BINARY(16) NOT NULL,
    target_user_id BINARY(16) NOT NULL,
    relation_type ENUM('friends', 'enemies'),
    PRIMARY KEY (source_user_id, target_user_id),
    FOREIGN KEY(source_user_id) REFERENCES users(user_id),
    FOREIGN KEY(target_user_id) REFERENCES users(user_id),
    CONSTRAINT check_other_id CHECK (source_user_id != target_user_id)
    );

SHOW tables;    