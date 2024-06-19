create database PWEB_Java;
use PWEB_Java;

create table users (
	idUsuario int not null auto_increment,
	nome varchar(100) not null,
	email varchar(80) not null,
	senha varchar(255) not null,
	removido int default 0,
	primary key (idUsuario)
);

create table filmes (
	idFilme int not null auto_increment,
	titulo varchar(255) not null,
    descricao text,
	diretor varchar(80) not null,
	genero varchar(80) not null,
    imagem varchar(255),
	nota double(2,1) not null default 0,
	removido int default 0,
	PRIMARY KEY (idFilme)
);

CREATE TABLE admin (
    idAdmin INT NOT NULL AUTO_INCREMENT,
    idUsuario INT,
    PRIMARY KEY (idAdmin),
    FOREIGN KEY (idUsuario) REFERENCES users(idUsuario)
);

CREATE TABLE notas (
    idNota INT NOT NULL AUTO_INCREMENT,
    idFilme INT,
    idUsuario INT,
    nota DOUBLE(2,1) NOT NULL,
    PRIMARY KEY (idNota),
    FOREIGN KEY (idFilme) REFERENCES filmes(idFilme),
    FOREIGN KEY (idUsuario) REFERENCES users(idUsuario)
);

# ADICIONA UM USUARIO ADMIN PADRÃO
INSERT INTO users (nome, email, senha) VALUES ('administrador', 'adm@email.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');
INSERT INTO admin (idUsuario) VALUES (1);

DELIMITER //

CREATE TRIGGER update_film_rating
AFTER INSERT ON notas
FOR EACH ROW
BEGIN
    UPDATE filmes f
    JOIN (
        SELECT idFilme, AVG(nota) as avg_nota
        FROM notas
        GROUP BY idFilme
    ) n ON f.idFilme = n.idFilme
    SET f.nota = n.avg_nota
    WHERE f.idFilme = NEW.idFilme;
END //

CREATE TRIGGER update_film_rating_after_update
AFTER UPDATE ON notas
FOR EACH ROW
BEGIN
    UPDATE filmes f
    JOIN (
        SELECT idFilme, AVG(nota) as avg_nota
        FROM notas
        GROUP BY idFilme
    ) n ON f.idFilme = n.idFilme
    SET f.nota = n.avg_nota
    WHERE f.idFilme = NEW.idFilme;
END //

CREATE TRIGGER update_film_rating_after_delete
AFTER DELETE ON notas
FOR EACH ROW
BEGIN
    UPDATE filmes f
    JOIN (
        SELECT idFilme, AVG(nota) as avg_nota
        FROM notas
        GROUP BY idFilme
    ) n ON f.idFilme = n.idFilme
    SET f.nota = n.avg_nota
    WHERE f.idFilme = OLD.idFilme;
END //

DELIMITER ;



-- PARA EXCLUIR AS TABELAS APENAS
# drop table admin;
#
# drop table notas;
#
# drop table filmes;
#
# drop table users;