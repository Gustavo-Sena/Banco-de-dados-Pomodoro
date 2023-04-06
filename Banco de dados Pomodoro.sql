CREATE DATABASE pomodoro;
USE pomodoro;

CREATE TABLE Usuario
	(idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Sobrenome VARCHAR(45),
    Numero VARCHAR(11),
	nm_documento VARCHAR(45),
    Documento VARCHAR(4),
    CONSTRAINT chkDoc CHECK (Documento = 'CPF' OR Documento = 'CNPJ'));
    
SELECT * FROM Usuario;

CREATE TABLE Endereco
	(idEndereço INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(45),
    CEP VARCHAR(9),
    Bairro VARCHAR(45),
    Número VARCHAR(5),
    fkUsuario INT, FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario));
    
SELECT * FROM Endereco;
    
CREATE TABLE Trajeto
	(idTrajeto INT PRIMARY KEY AUTO_INCREMENT,
    DistanciaKm INT,
    rua VARCHAR(45),
    CEP VARCHAR(9),
    Bairro VARCHAR(45),
    Número VARCHAR(5), 
    fkCaminhao INT, FOREIGN KEY (fkCaminhao) REFERENCES Caminhao(idCaminhao));
    
SELECT * FROM Trajeto;
    
CREATE TABLE Tomate
	(idTomate INT PRIMARY KEY AUTO_INCREMENT,
    ValorKg DOUBLE,
    fkUsuario INT, FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
    fkTrajeto INT, FOREIGN KEY (fkTrajeto) REFERENCES Trajeto(idTrajeto));
    
SELECT * FROM Tomate;
    
CREATE TABLE Motorista
	(idMotorista INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Sobrenome VARCHAR(45),
    CNH VARCHAR(10),
    CPF VARCHAR(11),
    Email VARCHAR(45));
    
SELECT * FROM Motorista;
    
CREATE TABLE Caminhao
	(idCaminhao INT PRIMARY KEY AUTO_INCREMENT,
    Marca VARCHAR(45),
    Modelo VARCHAR(45),
    Placa VARCHAR(7),
    DocumentoCaminhao VARCHAR(11),
	fkMotorista INT, FOREIGN KEY (fkMotorista) REFERENCES Motorista(idMotorista));
    
SELECT * FROM Caminhao;
    
CREATE TABLE Sensor
	(idSensor INT PRIMARY KEY AUTO_INCREMENT,
    Funcionamento VARCHAR(13),
    CONSTRAINT chkFuncionamento CHECK (Funcionamento = 'Sim' OR Funcionamento = 'Não' OR Funcionamento = 'Em manutenção'),
    fkCaminhao INT, FOREIGN KEY (fkCaminhao) REFERENCES Caminhao(idCaminhao));
    
 SELECT * FROM Sensor;   
    
CREATE TABLE SensorDado
	(idDado INT PRIMARY KEY AUTO_INCREMENT,
    Temperatura VARCHAR(5),
    Umidade VARCHAR(4),
    fkSensor INT, FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor));
    
SELECT * FROM SensorDado;
    
    
    
    
    
	