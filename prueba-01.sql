-- show databases;
drop database if exists demo2;
create database demo2;
use demo2;
create table animals(
id char(18) primary key default (uuid()),
name varchar(255) NOT NULL DEFAULT '' unique,
englishName varchar(255) NOT NULL DEFAULT '',
sciName varchar(255) NOT NULL DEFAULT '',
diet varchar(255) NOT NULL DEFAULT '',
lifestyle varchar(255) NOT NULL DEFAULT '',
location varchar(255) NOT NULL DEFAULT '',
slogan varchar(255) NOT NULL DEFAULT '',
group varchar(255) NOT NULL DEFAULT '',
image varchar(255) NOT NULL DEFAULT '',
created_at TIMESTAMP DEFAULT (NOW()),
updated_at TIMESTAMP DEFAULT (NOW()),
)
