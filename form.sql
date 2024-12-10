USE crud;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    cedula VARCHAR(30) NOT NULL,
    correo VARCHAR(200) NOT NULL
);

ALTER TABLE usuario MODIFY nombre VARCHAR(150);
ALTER TABLE usuario MODIFY ciudad VARCHAR(150);
ALTER TABLE usuario MODIFY cedula VARCHAR(30);
ALTER TABLE usuario MODIFY correo VARCHAR(250);

DELETE FROM usuario ;

ALTER TABLE usuario ADD CONSTRAINT cedula_uk UNIQUE KEY (cedula);
ALTER TABLE usuario ADD CONSTRAINT correo_uk UNIQUE KEY (correo);

ALTER TABLE usuario MODIFY COLUMN cedula VARCHAR(225) NOT NULL;
ALTER TABLE usuario MODIFY COLUMN correo VARCHAR(225)  NOT NULL;

CREATE TABLE registro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(225) NOT NULL,
    contraseña INT NOT NULL
);

ALTER TABLE registro MODIFY contraseña VARCHAR(225);
ALTER TABLE registro RENAME COLUMN registro TO usuario ;
ALTER TABLE registro DROP COLUMN nombre;
RENAME TABLE registro to login;
RENAME TABLE usuario  TO formulario;

ALTER TABLE login ADD CONSTRAINT usuario_uk UNIQUE KEY (usuario);
ALTER TABLE login ADD CONSTRAINT contraseña_uk UNIQUE KEY (contraseña);
DELETE FROM formulario WHERE ID = 42;
ALTER TABLE formulario MODIFY COLUMN cedula INT NOT NULL;
ALTER TABLE formulario MODIFY COLUMN cedula INT NOT NULL;

CREATE TABLE registro (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL
);

ALTER TABLE registro ADD COLUMN usuario_id VARCHAR(225);
ALTER TABLE registro ADD COLUMN contraseña_id VARCHAR(225);
ALTER TABLE registro ADD COLUMN correo_id VARCHAR(225);
ALTER TABLE registro ADD COLUMN cedula_id INT;


ALTER TABLE registro RENAME COLUMN contraseña_id TO contraseña;

ALTER TABLE login ADD COLUMN rol VARCHAR(225);

ALTER TABLE login MODIFY COLUMN rol VARCHAR(225) NOT NULL;
ALTER TABLE login MODIFY COLUMN usuario VARCHAR(225) NOT NULL;
ALTER TABLE login MODIFY COLUMN contraseña VARCHAR(225) NOT NULL;

ALTER TABLE formulario MODIFY COLUMN cedula INT NOT NULL;


ALTER TABLE registro 
ADD CONSTRAINT formulario_registro 
FOREIGN KEY (cedula_id) 
REFERENCES formulario(cedula);

ALTER TABLE registro 
ADD CONSTRAINT login_registro 
FOREIGN KEY (contraseña_id) 
REFERENCES formulario(cedula);

ALTER TABLE registro RENAME COLUMN usuario_id TO usuario ;
ALTER TABLE registro RENAME COLUMN usuario_id TO usuario ;

ALTER TABLE login RENAME COLUMN usuario TO usuario_id ;
ALTER TABLE login RENAME COLUMN contraseña TO contraseña_id;
ALTER TABLE login RENAME COLUMN contraseña TO contraseña_id;
ALTER TABLE registro RENAME COLUMN contraseña_id TO contraseña;


ALTER TABLE registro
ADD CONSTRAINT unique_usuario UNIQUE (usuario);


ALTER TABLE login
ADD CONSTRAINT registro_login 
FOREIGN KEY (usuario_id) 
REFERENCES registro(usuario);



ALTER TABLE formulario RENAME COLUMN cedula TO cedula_id;

ALTER TABLE formulario  RENAME COLUMN cedula_id TO cedula;


ALTER TABLE login
DROP FOREIGN KEY login_ibfk_2 ;













