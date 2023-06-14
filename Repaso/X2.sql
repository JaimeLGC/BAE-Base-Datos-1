-- Creación de vistas:curso
--     Se deben de crear al menos 3 vistas con la combinación de 3 o más tablas cada una. (2 puntos)

-- Vista 1
CREATE VIEW departamento_profesor AS
SELECT p.id, p.nombre, p.apellido, d.id as asignatura_id
FROM profesor as p left join profedepartamento as pd on pd.profe = p.id left join departamento as d on 
pd.departamento = d.id;

- - - Output - - -
mysql> select * from departamento_profesor;
+--------+-----------+-----------+---------------+
| id     | nombre    | apellido  | asignatura_id |
+--------+-----------+-----------+---------------+
| Profe1 | Guillermo | Sicilia   | FOL           |
| Profe2 | Pedro     | Martinez  | GEO           |
| Profe3 | Maria     | Cabrera   | FIL           |
| Profe4 | Grace     | Caraballo | NULL          |
+--------+-----------+-----------+---------------+
4 rows in set (0,00 sec)

--Vista 2
CREATE VIEW Profesor_tutor_grado_aula AS
SELECT p.id, p.nombre, p.apellido, t.aula, c.grado 
FROM profesor as p left join tutor as t on p.id = t.profe left join curso as c on t.curso = c.id;

- - - Ouput - - -
mysql> select * from Profesor_tutor_grado_aula;
+--------+-----------+-----------+----------+-------+
| id     | nombre    | apellido  | aula     | grado |
+--------+-----------+-----------+----------+-------+
| Profe1 | Guillermo | Sicilia   | Aula 101 | 1BACH |
| Profe2 | Pedro     | Martinez  | Aula 103 | 1DAM  |
| Profe3 | Maria     | Cabrera   | Aula 202 | grado |
| Profe4 | Grace     | Caraballo | NULL     | NULL  |
+--------+-----------+-----------+----------+-------+
4 rows in set (0,00 sec)

-- Vista 3
CREATE VIEW profesor_ficha_departamento AS
SELECT p.id, p.nombre, p.apellido, f.hora, jd.departamento
FROM profesor as p left join fichar as f on f.id_profe = p.id left join jefedepartamento as jd on jd.profe = p.id;

- - - Ouput - - -
mysql> select * from profesor_ficha_departamento;
+--------+-----------+-----------+----------+--------------+
| id     | nombre    | apellido  | hora     | departamento |
+--------+-----------+-----------+----------+--------------+
| Profe1 | Guillermo | Sicilia   | 08:32:50 | FOL          |
| Profe1 | Guillermo | Sicilia   | 11:34:40 | FOL          |
| Profe2 | Pedro     | Martinez  | 08:00:50 | NULL         |
| Profe3 | Maria     | Cabrera   | 08:34:03 | FIL          |
| Profe3 | Maria     | Cabrera   | 12:45:50 | FIL          |
| Profe4 | Grace     | Caraballo | NULL     | NULL         |
+--------+-----------+-----------+----------+--------------+
6 rows in set (0,00 sec)


-- Creación de indices:
--     Se deben de crear al menos dos indices de cada uno de los siguientes tipos:
--         INDEX (1 punto)

alter table profesor add index idx_profe (id, nombre, apellido);
Query OK, 0 rows affected, 1 warning (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 1
+----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name     | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| profesor |          0 | PRIMARY      |            1 | id           | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | id_sustituto |            1 | id_sustituto | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | username     |            1 | username     | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | id           |            1 | id           | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | id           |            2 | nombre       | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | id           |            3 | apellido     | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | idx_profe    |            1 | id           | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | idx_profe    |            2 | nombre       | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | idx_profe    |            3 | apellido     | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
9 rows in set (0,03 sec)

--         UNIQUE (1 punto)
alter table departamento add unique idx_id_departamento (id);

mysql> show index from departamento;
+--------------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table        | Non_unique | Key_name            | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| departamento |          0 | PRIMARY             |            1 | id          | A         |          22 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| departamento |          0 | idx_id_departamento |            1 | id          | A         |          22 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,01 sec)

--         PRIMARY o FULLTEXT(1 punto)
alter table users add FULLTEXT idx_curso (password);

mysql> show index from users;
+-------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name  | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| users |          0 | PRIMARY   |            1 | username    | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| users |          1 | idx_curso |            1 | password    | NULL      |           4 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
+-------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,01 sec)

-- Crea 2 tablas e incluye triggers para su carga de forma automatizada. (2 puntos)
-- Trigger 1
Create table historico_users(
	username VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
   	email VARCHAR(100) NOT NULL,
	enabled TINYINT(1) NOT NULL DEFAULT 0,
    roles VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
);

DELIMITER //
DROP TRIGGER IF EXISTS historico_users//
CREATE TRIGGER historico_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO historico_users (username, password, email, enabled, roles) VALUES (NEW.username, NEW.password, NEW.email, NEW.enabled, NEW.roles);
END//

-- Realizamos inserts para probar que el trigger funciona
INSERT INTO `users` (`username`, `password`, `email`,`enabled`,`roles`) VALUES ('prueba1', '$2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm', 'macab@gmail.com', DEFAULT, 'profe');
INSERT INTO `users` (`username`, `password`, `email`,`enabled`,`roles`) VALUES ('prueba2', '$kjfwghvyubevu601B60hm', 'hola@gmail.com', DEFAULT, 'profe');

-- Comprobamos que se guardan los datos en la nueva tabla
mysql> select * from historico_users//
+----------+--------------------------------------------------------------+-----------------+---------+-------+
| username | password                                                     | email           | enabled | roles |
+----------+--------------------------------------------------------------+-----------------+---------+-------+
| prueba1  | $2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm | macab@gmail.com |       0 | profe |
| prueba2  | $kjfwghvyubevu601B60hm                                       | hola@gmail.com  |       0 | profe |
+----------+--------------------------------------------------------------+-----------------+---------+-------+
2 rows in set (0,01 sec)

-- Trigger 2
CREATE TABLE historico_profesor(
	id VARCHAR(10) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    h_perm INT NOT NULL DEFAULT 24,
    h_lect INT NOT NULL DEFAULT 18,
	sustituto BOOLEAN NOT NULL DEFAULT false,
	id_sustituto VARCHAR(10),
	username VARCHAR(20) NOT NULL,
    foto VARCHAR(255),
	FOREIGN KEY (id_sustituto) REFERENCES profesor(id) ON UPDATE CASCADE,
	FOREIGN KEY (username) REFERENCES users(username) ON UPDATE CASCADE,
	PRIMARY KEY (id)
);

DELIMITER //
DROP TRIGGER IF EXISTS historico_profesor//
CREATE TRIGGER historico_profesor AFTER INSERT ON profesor
FOR EACH ROW
BEGIN
INSERT INTO historico_profesor (id, nombre, apellido, email, telefono, h_perm, h_lect, sustituto, id_sustituto, username, foto)
VALUES (NEW.id, NEW.nombre, NEW.apellido, NEW.email, NEW.telefono, NEW.h_perm, NEW.h_lect, NEW.sustituto, NEW.id_sustituto, NEW.username, NEW.foto);
END//

-- Realizamos inserts para probar que el trigger funciona
INSERT INTO `profesor` (`id`, `nombre`, `apellido`, `email`, `telefono`, `h_perm`, `h_lect`, `sustituto`, `id_sustituto`, `username`, `foto`) VALUES
('Profe85', 'Saúl', 'Pérez', 'saul@gmail.com', NULL, 24, 18, DEFAULT, null, 'admin', '');
INSERT INTO `profesor` (`id`, `nombre`, `apellido`, `email`, `telefono`, `h_perm`, `h_lect`, `sustituto`, `id_sustituto`, `username`, `foto`) VALUES
('Profe96', 'Marta', 'Pacheco', 'marta@gmail.com', NULL, 24, 18, DEFAULT, null, 'admin', '');

-- Comprobamos que se guardan los datos en la nueva tabla
mysql> select * from historico_profesor//
+---------+--------+----------+-----------------+----------+--------+--------+-----------+--------------+----------+------+
| id      | nombre | apellido | email           | telefono | h_perm | h_lect | sustituto | id_sustituto | username | foto |
+---------+--------+----------+-----------------+----------+--------+--------+-----------+--------------+----------+------+
| Profe85 | Saúl   | Pérez    | saul@gmail.com  | NULL     |     24 |     18 |         0 | NULL         | admin    |      |
| Profe96 | Marta  | Pacheco  | marta@gmail.com | NULL     |     24 |     18 |         0 | NULL         | admin    |      |
+---------+--------+----------+-----------------+----------+--------+--------+-----------+--------------+----------+------+
2 rows in set (0,00 sec)

-- Crea al menos dos procedimientos sobre las tablas que tengan índices de tipo PRIMARY. (3 puntos). 
-- Todos los campos deben de ser aleatorios.
DELIMITER //
DROP PROCEDURE IF EXISTS insert_tutor//
CREATE PROCEDURE insert_tutor(IN num_inserts INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE new_profe VARCHAR(10);
    DECLARE new_curso VARCHAR(10);
    DECLARE new_aula VARCHAR(10);
    DECLARE new_id INT;

    WHILE i < num_inserts DO
        SET new_id = (SELECT MAX(id) from tutor) + 1;
        SET new_profe = CONCAT("Profesor", i);
        SET new_curso = CONCAT(FLOOR(RAND() * 4), CHAR(FLOOR(RAND() * 26) + 65));
        SET new_aula = CONCAT("Aula", (i * 100) + i);
        
        INSERT INTO tutor (id, profe, curso, aula) VALUES (new_id, new_profe, new_curso, new_aula);
    SET i = i + 1;
    END WHILE;
END//

DELIMITER ;
CALL insert_tutor(5);


