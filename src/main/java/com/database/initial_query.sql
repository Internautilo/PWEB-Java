# CREATE DATABASE PWEB_Java;
# USE PWEB_Java;

CREATE TABLE users (
                       idUsuario INT NOT NULL AUTO_INCREMENT,
                       nome VARCHAR(100) NOT NULL,
                       email VARCHAR(80) NOT NULL,
                       senha VARCHAR(255) NOT NULL,
                       removido INT DEFAULT 0,
                       PRIMARY KEY (idUsuario)
);

CREATE TABLE filmes (
                        idFilme INT NOT NULL AUTO_INCREMENT,
                        titulo VARCHAR(255) NOT NULL,
                        descricao TEXT,
                        diretor VARCHAR(80) NOT NULL,
                        genero VARCHAR(80) NOT NULL,
                        imagem VARCHAR(255),
                        nota DOUBLE NOT NULL DEFAULT 0,
                        removido INT DEFAULT 0,
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
                       nota DOUBLE NOT NULL,
                       PRIMARY KEY (idNota),
                       FOREIGN KEY (idFilme) REFERENCES filmes(idFilme),
                       FOREIGN KEY (idUsuario) REFERENCES users(idUsuario)
);

-- ADICIONA UM USUARIO ADMIN PADRÃO

DELIMITER //

CREATE TRIGGER atualizar_nota_filme
    AFTER INSERT ON notas
    FOR EACH ROW
BEGIN
    DECLARE nova_nota DOUBLE;

    -- Calcular a nova nota média do filme
    SELECT AVG(nota) INTO nova_nota
    FROM notas
    WHERE idFilme = NEW.idFilme;

    -- Atualizar a coluna nota na tabela filmes
    UPDATE filmes
    SET nota = nova_nota
    WHERE idFilme = NEW.idFilme;
END;

//

DELIMITER ;

DELIMITER //

CREATE TRIGGER atualizar_nota_filme_apos_update
    AFTER UPDATE ON notas
    FOR EACH ROW
BEGIN
    DECLARE nova_nota DOUBLE;

    -- Calcular a nova nota média do filme
    SELECT AVG(nota) INTO nova_nota
    FROM notas
    WHERE idFilme = NEW.idFilme;

    -- Atualizar a coluna nota na tabela filmes
    UPDATE filmes
    SET nota = nova_nota
    WHERE idFilme = NEW.idFilme;
END;

//

DELIMITER ;


INSERT INTO users (nome, email, senha) VALUES ('administrador', 'adm@email.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');
INSERT INTO admin (idUsuario) VALUES (1);
INSERT INTO filmes (titulo, descricao, diretor, genero, imagem, nota, removido) VALUES ('titulo', 'descricao', 'diretor', 'genero', 'imagem', 0, 0);
# INSERT INTO notas (notas.idFilme, notas.idUsuario, nota) VALUES (1, 1, 5.0);

-- PARA EXCLUIR AS TABELAS APENAS
# DROP TABLE admin;
#
# DROP TABLE notas;
#
# DROP TABLE filmes;
#
# DROP TABLE users;
