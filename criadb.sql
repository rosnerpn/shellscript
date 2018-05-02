create database prova_script;
use prova_script;

use prova_script;

create table prova (id int primary key AUTO_INCREMENT,
	nome varchar(100),
	email varchar(50),
	telefone varchar(14),
	datacadastro TIMESTAMP default CURRENT_TIMESTAMP());