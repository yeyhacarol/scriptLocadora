#criando database no db
create database dbvideolocadora20221;

#visualizando os databases existentes
show databases;

#apagando database
drop database dbvideolocadora20221;

#permitindo o uso do database
use dbvideolocadora20221;

#criando tabela simples, sem relacionamento
create table tblSexo (
	id int unsigned not null auto_increment primary key,
    nome varchar(25) not null,
    sigla varchar(1) not null,
    unique index(id)
);

#exibindo tabelas existentes no database
show tables;

#criando tabela simples, sem relacionamento
create table tblGenero (
	id int unsigned not null auto_increment,
    nome varchar(45),
    primary key(id),
    unique index(id)
);

#ambos possuem o mesmo retorno. permite visualização da estrutura da tabela
desc tblSexo;
describe tblSexo;

#criando tabela simples 
create table tblStreaming(
	id int unsigned not null auto_increment primary key,
    nome varchar(45) not null,
    unique index(id)
);

#criando tabela simples
create table tblNcionalidade(
	id int unsigned not null auto_increment primary key
);

#renomeando nome da tabela
rename table tblNcionalidade to tblNacionalidade;

#modificando tabela, inserindo novo atributo
alter table tblNacionalidade
	add column nome varchar(45) not null,
	add unique index(id);
    
#removendo atributo da estrutura
alter table tblNacionalidade
	drop column nome;
    
#inserindo uma propriedade no atributo, mas não renomea atributo
alter table tblNacionalidade
	modify column nome varchar(45) not null;
    
alter table tblNacionalidade
	rename column nome to nomeNacionalidade;

#renomeando o atributo e alterando sua estrutura se necessário
alter table tblNacionalidade 
	change nome nomeNacionalidade varchar(35);
    
#tabela ator com chave estrangeira
create table tblAtor (
	id int unsigned not null auto_increment primary key,
    nome varchar(80) not null,
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    biografia text,
    idSexo int not null,
    constraint FK_Sexo_Ator #cria um nome representativo para a relação
    foreign key(idSexo)		#estabelece a chave estrangeira nessa tabela
    references tblSexo(id), #especifica qual a tabela de origem dessa fk
	unique index(id)
);



