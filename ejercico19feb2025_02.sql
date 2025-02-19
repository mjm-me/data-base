drop database if exists demo2;
create database demo2;

use demo2;

create table if not exists users (
user_id binary(16) default (uuid_to_bin(uuid())) primary key,
user_alias varchar(100) not null unique,
email varchar(150) not null unique,
first_name varchar(100) not null,
surname varchar(100),
phone char(12) unique,
);

INSERT INTO users
  (user_alias, email, first_name, surname, phone)
  VALUES
  ('@pepe', 'pepe@sample.com', 'Pepe', 'Pérez', '123456789'),
  ('@juan', 'juan@sample.com', 'Juan', 'Gómez', '987654321');
   
 SHOW tables;
  