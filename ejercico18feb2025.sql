drop database if exists demo;

create database demo;

use demo;
SHOW tables;

drop table if exists users;
drop table if exists notas;

create table if not exists users (
user_id binary(16) default (uuid_to_bin(uuid())) primary key,
user_alias varchar(100) not null unique,
email varchar(150) not null unique,
first_name varchar(100) not null,
surname varchar(100),
phone char(12) unique,
created_at timestamp not null default (now()),
modified_at timestamp not null default (now())
);

create table if not exists notas (
note_id binary(16) default (uuid_to_bin(uuid())) primary key,
title varchar(255) not null,
is_important boolean default false,
content text,
autor_id binary(100) not null references users(user_id),
created_at timestamp not null default (now()),
updated_at timestamp not null default (now())
-- primary key (note_id),
-- foreign key (author_id) references users(user_id)
);

create table if not exists user_relation (
first_user_id binary(100) not null references users(user_id),
second_user_id binary(100) not null references users(user_id),
relation_type boolean default false

autor_id binary(100) not null references users(user_id),
created_at timestamp not null default (now()),
updated_at timestamp not null default (now())
-- primary key (note_id),
-- foreign key (author_id) references users(user_id)
);

desc users;
desc notas;






