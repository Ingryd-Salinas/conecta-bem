CREATE DATABASE conectabem;
USE conectabem;

CREATE TABLE usuario(
  usu_cpf VARCHAR(14) PRIMARY KEY,
  usu_nome VARCHAR(60) NOT NULL,
  usu_email VARCHAR(60) NOT NULL,
  usu_senha VARCHAR(15) NOT NULL,
  usu_telefone VARCHAR(14),
  usu_nasc DATE NOT NULL,
  usu_rua VARCHAR(60),
  usu_bairro VARCHAR(40),
  usu_numero INT,
  usu_compl VARCHAR(20),
  usu_cidade VARCHAR(20),
  usu_uf VARCHAR(2)
  );
  
CREATE TABLE gerente(
 ger_id INT PRIMARY KEY,
 ger_aprovado BOOLEAN,
 usu_cpf VARCHAR(14),
 FOREIGN KEY(usu_cpf) REFERENCES usuario(usu_cpf)
 );
  
 CREATE TABLE evento (
 eve_id INT PRIMARY KEY,
 eve_nome VARCHAR(60),
 eve_status VARCHAR(20) NOT NULL,
 eve_data DATE NOT NULL,
 eve_periodo VARCHAR(15),
 eve_qntdmin INT NOT NULL,
 eve_qntdmax INT,
 eve_rua VARCHAR(80),
 eve_numero VARCHAR(10),
 eve_compl VARCHAR(50),
 eve_bairro VARCHAR(40),
 eve_cidade VARCHAR(40),
 eve_uf CHAR(2),
 eve_meta DECIMAL(10,2),
 eve_arrecadado DECIMAL(10,2),
 eve_falta DECIMAL(10,2),
 eve_msg TEXT,
 eve_desc TEXT, 
 ger_id INT,
 FOREIGN KEY(ger_id) REFERENCES gerente(ger_id)
 );

 CREATE TABLE insumo(
 ins_id INT PRIMARY KEY,
 ins_nome VARCHAR(60) NOT NULL,
 ins_peso DECIMAL (10, 2)
 );
 
 CREATE TABLE utensilio(
 ute_id INT PRIMARY KEY,
 ute_nome VARCHAR(60) NOT NULL,
 ute_desc VARCHAR(150)
 );
 
 CREATE TABLE funcao(
  fun_id INT PRIMARY KEY,
  fun_nome VARCHAR(60),
  fun_desc VARCHAR(200)
  );
 
 CREATE TABLE doacao(
 doa_id INT AUTO_INCREMENT PRIMARY KEY,
 doa_data DATE NOT NULL,
 doa_desc VARCHAR(200),
 doa_valor DECIMAL(8, 2),
 doa_qtd INT,
 usu_cpf VARCHAR(14),
 eve_id INT,
 ute_id INT,
 fun_id INT,
 ins_id INT,
 FOREIGN KEY(usu_cpf) REFERENCES usuario(usu_cpf),
 FOREIGN KEY(eve_id) REFERENCES evento(eve_id),
 FOREIGN KEY(ute_id) REFERENCES utensilio(ute_id),
 FOREIGN KEY(fun_id) REFERENCES funcao(fun_id),
 FOREIGN KEY(ins_id) REFERENCES insumo(ins_id)
  );
  
  CREATE TABLE evento_usuario(
  evu_id INT AUTO_INCREMENT PRIMARY KEY,
  eve_id INT,
  usu_cpf VARCHAR(14),
  fun_id INT,
  FOREIGN KEY(eve_id) REFERENCES evento(eve_id),
  FOREIGN KEY(usu_cpf) REFERENCES usuario(usu_cpf),
  FOREIGN KEY(fun_id) REFERENCES funcao(fun_id)
  );
 
 CREATE TABLE administrador(
  adm_id INT PRIMARY KEY,
  adm_senha VARCHAR(15) NOT NULL,
  usu_cpf VARCHAR(14),
  FOREIGN KEY(usu_cpf) REFERENCES usuario(usu_cpf)
  );
  
-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- INSTÂNCIAS
INSERT INTO usuario (usu_cpf, usu_nome, usu_email, usu_senha, usu_telefone, usu_nasc, usu_rua, usu_bairro, usu_numero, usu_compl, usu_cidade, usu_uf) VALUES
('123.456.789-01', 'Carlos Silva', 'carlos.silva@email.com', 'Senha123', '11 98888-1111', '1990-05-15', 'Rua das Flores', 'Centro', 123, 'Apto 42', 'Osasco', 'SP'),
('234.567.890-12', 'Ana Oliveira', 'ana.oliveira@email.com', 'Ana@2026', '11 98888-2222', '1995-08-22', 'Avenida Paulista', 'Bela Vista', 1500, 'Bloco B', 'São Paulo', 'SP'),
('345.678.901-23', 'Marcos Souza', 'marcos.souza@email.com', 'Marcos#99', '11 97777-3333', '1988-12-01', 'Rua Piauí', 'Sertãozinho', 45, NULL, 'Carapicuíba', 'SP'),
('456.788.901-34', 'Juliana Lima', 'juliana.lima@email.com', 'JuLuna12', '11 96666-4444', '2000-03-10', 'Alameda Amazonas', 'Alphaville', 980, 'Sala 4', 'Barueri', 'SP'),
('567.890.123-45', 'Ricardo Santos', 'ricardo.santos@email.com', 'Rico2024', '21 95555-5555', '1983-07-19', 'Rua Copacabana', 'Copacabana', 210, 'Fundos', 'Rio de Janeiro', 'RJ'),
('678.901.234-56', 'Camila Ribeiro', 'camila.ribeiro@email.com', 'Cami@Pass', '11 94444-6666', '1997-11-25', 'Rua Voluntários da Pátria', 'Santana', 1150, NULL, 'São Paulo', 'SP'),
('789.012.345-67', 'Lucas Almeida', 'lucas.almeida@email.com', 'Luk@s888', '11 93333-7777', '1992-01-30', 'Rua Primeiros de Maio', 'Vila Nova', 88, 'Casa A', 'Osasco', 'SP'),
('890.123.456-78', 'Beatriz Costa', 'beatriz.costa@email.com', 'Bia@Senha', '19 92222-8888', '1994-09-05', 'Avenida Alberto Sarmento', 'Bonfim', 402, 'Apto 12', 'Campinas', 'SP'),
('901.234.567-89', 'Fernando Gomes', 'fernando.gomes@email.com', 'FerNando!', '11 91111-9999', '1985-06-14', 'Rua Aurora', 'Santa Ifigênia', 55, NULL, 'São Paulo', 'SP'),
('012.345.678-90', 'Mariana Dupont', 'mariana.dupont@email.com', 'Mari#777', '11 90000-0000', '2002-02-28', 'Rua Antônio Agu', 'Centro', 700, 'Loja 2', 'Osasco', 'SP'),
('111.111.111-11', 'João Silva', 'joao@gmail.com', 'joao123', '11999990001', '1995-03-10', 'Rua das Flores', 'Centro', 101, 'Apto 1', 'São Paulo', 'SP'),
('222.222.222-22', 'Maria Souza', 'maria@gmail.com', 'maria123', '11999990002', '1998-07-21', 'Rua Primavera', 'Jardim América', 202, NULL, 'São Paulo', 'SP'),
('333.333.333-33', 'Carlos Lima', 'carlos@gmail.com', 'carlos123', '11999990003', '1989-11-05', 'Av. Brasil', 'Centro', 303, 'Casa', 'Campinas', 'SP'),
('444.444.444-44', 'Ana Pereira', 'ana@gmail.com', 'ana123', '11999990004', '2000-01-15', 'Rua Central', 'Vila Nova', 404, NULL, 'Santos', 'SP'),
('555.555.555-55', 'Fernanda Costa', 'fernanda@gmail.com', 'fer123', '11999990005', '1997-09-30', 'Rua Aurora', 'Centro', 505, 'Fundos', 'São Paulo', 'SP');

INSERT INTO gerente (ger_id, ger_aprovado, usu_cpf) VALUES
(1, TRUE, '111.111.111-11'),
(2, TRUE, '222.222.222-22'),
(3, TRUE, '333.333.333-33'),
(4, FALSE, '444.444.444-44'),
(5, TRUE, '555.555.555-55');

INSERT INTO evento (eve_id, eve_nome,eve_status, eve_data, eve_periodo, eve_qntdmin, eve_qntdmax, 
					eve_rua, eve_numero, eve_compl, eve_bairro, eve_cidade, eve_uf, eve_meta, 
                    eve_arrecadado, eve_falta, eve_msg, eve_desc,  ger_id) VALUES 
(1, 'Sopão Solidário Centro', 'Ativo', '2026-07-10', 'Noite', 10, 40, 'Rua Central', '100', NULL, 'Centro', 'São Paulo', 'SP', 2500.00, 1500.00, 1000.00, 'Doe alimentos', 'Distribuição de sopa e pão', 1),
(2, 'Almoço Comunitário', 'Ativo', '2026-07-20', 'Tarde', 15, 50, 'Rua das Flores', '220', NULL, 'Jardim América', 'São Paulo', 'SP', 3000.00, 1800.00, 1200.00, 'Precisamos de voluntários', 'Distribuição de almoço completo', 2),
(3, 'Jantar Solidário', 'Planejado', '2026-08-05', 'Noite', 12, 35, 'Av. Brasil', '500', 'Salão Comunitário', 'Centro', 'Campinas', 'SP', 2800.00, 900.00, 1900.00, 'Participe da campanha', 'Distribuição de refeições quentes', 3),
(4, 'Café da Manhã Fraterno', 'Ativo', '2026-08-15', 'Manhã', 8, 30, 'Rua Aurora', '90', NULL, 'Vila Nova', 'Santos', 'SP', 1800.00, 1000.00, 800.00, 'Doe alimentos', 'Distribuição de café da manhã', 4),
(5, 'Marmita Solidária', 'Ativo', '2026-08-25', 'Tarde', 20, 60, 'Rua Esperança', '350', NULL, 'Centro', 'São Paulo', 'SP', 4000.00, 2500.00, 1500.00, 'Ajude nossa causa', 'Distribuição de marmitas', 5);

INSERT INTO funcao (fun_id, fun_nome, fun_desc) VALUES 
(1, 'Cozinheiro', 'Responsável pela preparação e cozimento dos alimentos do evento.'),
(2, 'Limpeza', 'Responsável pela manutenção da higiene e organização do espaço.'),
(3, 'Transporte', 'Responsável pela logística e deslocamento de insumos ou voluntários.'),
(4, 'Organização', 'Responsável pela coordenação geral, infraestrutura e suporte estrutural.'),
(5, 'Distribuição', 'Responsável pela entrega física de refeições, marmitas ou insumos arrecadados.'),
(6, 'Comunicação', 'Responsável pelo acolhimento, recepção dos voluntários, atualizações e divulgação.');

INSERT INTO insumo (ins_id, ins_nome, ins_peso) VALUES
(1, 'Arroz Branco', 5.00),
(2, 'Arroz Integral', 5.00),
(3, 'Feijão Branco', 1.00),
(4, 'Feijão Preto', 1.00),
(5, 'Feijão Carioca', 1.00),
(6, 'Alface', 0.20),
(7, 'Tomate', 1.00),
(8, 'Ovos', 0.80),
(9, 'Carne Vermelha', 2.50),
(10, 'Frango', 2.00),
(11, 'Macarrão', 1.000),
(12, 'Óleo de Soja', 0.900),
(13, 'Farinha de Trigo', 1.000);

INSERT INTO utensilio (ute_id, ute_nome, ute_desc) VALUES
(1, 'Panela', 'Panela grande industrial para cozimento de refeições.'),
(2, 'Faca', 'Faca de corte de cozinha profissional.'),
(3, 'Marmita (isopor)', 'Embalagens térmicas de isopor para distribuição das refeições.'),
(4, 'Concha', 'Concha de inox grande para servir sopas e caldos.'),
(5, 'Colher de Pau', 'Colher de madeira grande para preparo de alimentos em caldeirões.'),
(6, 'Talheres (plástico)', 'Kits de garfos e facas descartáveis de plástico.'),
(7, 'Caixa Térmica', 'Tamanho Grande - Cor Azul'),
(8, 'Mesa Dobrável', 'Tamanho 2 Metros - Cor Branca'),
(9, 'Balde Alimentício', 'Tamanho 20 Litros - Cor Branco');

INSERT INTO doacao (
    doa_data, doa_desc, doa_valor, doa_qtd,
    usu_cpf, eve_id, ute_id, fun_id, ins_id) VALUES
('2026-06-01', 'Doação em dinheiro', 200.00, NULL, '111.111.111-11', 1, NULL, NULL, NULL),
('2026-06-02', 'Doação de arroz', NULL, 20, '222.222.222-22', 2, NULL, NULL, 1),
('2026-06-03', 'Doação de feijão', NULL, 15, '333.333.333-33', 3, NULL, NULL, 2),
('2026-06-04', 'Doação de caixa térmica', NULL, 1, '444.444.444-44', 4, 3, NULL, NULL),
('2026-06-05', 'Trabalho voluntário', NULL, 1, '555.555.555-55', 5, NULL, 2, NULL);

INSERT INTO evento_usuario (evu_id, eve_id, usu_cpf, fun_id) VALUES 
(1, 1, '111.111.111-11', 3),
(2, 2, '222.222.222-22', 1),
(3, 3, '333.333.333-33', 2),
(4, 4, '444.444.444-44', 4),
(5, 5, '555.555.555-55', 5);

INSERT INTO administrador (adm_id, adm_senha, usu_cpf) VALUES
(1, 'admin123', '111.111.111-11'),
(2, 'admin234', '222.222.222-22'),
(3, 'admin345', '333.333.333-33'),
(4, 'admin456', '444.444.444-44'),
(5, 'admin567', '555.555.555-55');
-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDURES
-- RF01 O administrador deve poder cadastrar tipos de cargos
 -- 1 - DEFINIR
 DELIMITER $$
 CREATE PROCEDURE definirFuncao(
                      IN fid INT,
                      IN fnome VARCHAR(60),
                      IN fdesc VARCHAR(200))
 BEGIN
  INSERT INTO funcao(fun_id, fun_nome, fun_desc)
  VALUES (fid, fnome, fdesc);
 END$$
 DELIMITER ;
  
 -- 2 - ALTERAR
 DELIMITER $$
 CREATE PROCEDURE alterarFuncao(
					  IN fid INT,
                      IN fnome VARCHAR(60),
					  IN fdesc VARCHAR(200))
 BEGIN
  UPDATE funcao
  SET fun_nome = fnome,
      fun_desc = fdesc
  WHERE fun_id = fid;
 END$$
 DELIMITER ;

 -- 3 - DELETAR
 DELIMITER $$
 CREATE PROCEDURE apagarFuncao(
					IN fid INT)
 BEGIN
  DELETE FROM funcao
  WHERE fun_id = fid;
 END$$
 DELIMITER ;

 -- 4 - CONSULTAR 
 DELIMITER $$
 CREATE PROCEDURE consultarFuncao(
					   IN fid INT)
 BEGIN
  SELECT fun_id AS "Código", fun_nome AS "Função", fun_desc AS "Descrição"  
  FROM funcao
  WHERE fun_id = fid;
 END$$
 DELIMITER ;


-- RF02 O administrador deve poder avaliar solicitações de gerente
DELIMITER $$
CREATE PROCEDURE aprovar_gerente(
				IN id_gerente INT,
				IN aprovado BOOLEAN)
BEGIN
 SELECT usu_cpf, usu_nome,usu_email,usu_telefone,usu_nasc,usu_rua,usu_bairro,usu_numero,usu_compl,usu_cidade,usu_uf
 FROM usuario INNER JOIN gerente USING(usu_cpf) 
 WHERE ger_id = id_gerente;

 UPDATE gerente 
 SET ger_aprovado= aprovado
 WHERE ger_id= id_gerente;
END $$
DELIMITER ;


-- RF03 O administrador deve poder logar em sua conta
DELIMITER $$
CREATE PROCEDURE loginAdministrador(
				  IN cpf VARCHAR(14),
                  IN senha VARCHAR(15))
BEGIN
 SELECT *
 FROM administrador
 WHERE usu_cpf = cpf AND adm_senha = senha;
END $$
DELIMITER ; 


-- RF04 O sistema deve permitir que o usuário se cadastre
 -- 1 - INCLUIR
 DELIMITER $$
 CREATE PROCEDURE incluirUsuario(
  IN cpf VARCHAR(14),
  IN nome VARCHAR(60),
  IN email VARCHAR(60),
  IN senha VARCHAR(15),
  IN telefone VARCHAR(14),
  IN nasc DATE,
  IN rua VARCHAR(60),
  IN bairro VARCHAR(40),
  IN numero INT,
  IN compl VARCHAR(20),
  IN cidade VARCHAR(20),
  IN uf VARCHAR(2))
 BEGIN
  INSERT INTO usuario (usu_cpf, usu_nome, usu_email, usu_senha, usu_telefone, usu_nasc,
					   usu_rua, usu_bairro, usu_numero, usu_compl, usu_cidade, usu_uf) 
  VALUES (cpf, nome, email, senha, telefone, nasc,
		  rua, bairro, numero, compl, cidade, uf);
 END $$
  DELIMITER ;

 -- 2 - ALTERAR
 DELIMITER $$
 CREATE PROCEDURE alterarUsuario(
  IN cpf VARCHAR(14),
  IN nome VARCHAR(60),
  IN email VARCHAR(60),
  IN senha VARCHAR(15),
  IN telefone VARCHAR(14),
  IN nasc DATE,
  IN rua VARCHAR(60),
  IN bairro VARCHAR(40),
  IN numero INT,
  IN compl VARCHAR(20),
  IN cidade VARCHAR(20),
  IN uf VARCHAR(2))
 BEGIN
  UPDATE usuario 
  SET usu_cpf = cpf, usu_nome = nome, usu_email = email , usu_senha =senha , 
	  usu_telefone = telefone, usu_nasc = nasc, usu_rua = rua, usu_bairro = bairro , 
      usu_numero = numero, usu_compl = compl, usu_cidade = cidade, usu_uf = uf
  WHERE usu_cpf = cpf;
 END $$
 DELIMITER ;
  
 -- 3 - EXCLUIR 
 DELIMITER $$
 CREATE PROCEDURE excluirUsuario(
					  IN cpf INT)
 BEGIN
  DELETE FROM usuario
  WHERE usu_cpf = cpf;
 END $$
 DELIMITER ;


-- RF05 O sistema deve permitir que o usuário faça login
DELIMITER $$
CREATE PROCEDURE loginUsuario(
		   IN nome VARCHAR(40),
           IN cpf VARCHAR(14))
BEGIN
    SELECT *
    FROM usuario
    WHERE usu_nome = nome AND usu_cpf = cpf;		
END $$
DELIMITER ;


-- RF06 O sistema deve permitir que o usuário solicite acesso como gerente
DELIMITER $$

CREATE PROCEDURE solicitarGerente(
					IN id_ger INT,
					IN cpf VARCHAR(14))
BEGIN
    INSERT INTO gerente(ger_id, ger_aprovado,usu_cpf)
    VALUES(id_ger,FALSE,cpf);
END$$
DELIMITER ;


-- RF07 O sistema deve permitir que gerentes cadastrem eventos
 -- 1 - CRIAR
 DELIMITER $$
 CREATE PROCEDURE criarEvento(
					IN id INT,
					IN nome VARCHAR(60),
					IN statuseve VARCHAR(20),		
					IN dataeve DATE,				
					IN periodo VARCHAR(15),
					IN qntdmin INT,
					IN qntdmax INT,
					IN rua VARCHAR(80),
					IN numero VARCHAR(10),
					IN compl VARCHAR(50),
					IN bairro VARCHAR(40),
					IN cidade VARCHAR(40),
					IN uf CHAR(2),
					IN meta DECIMAL(10,2),
                    IN msg TEXT,
                    IN descr TEXT,					
                    IN ger INT)					
 BEGIN
  INSERT INTO evento (eve_id, eve_nome, eve_status, eve_data, eve_periodo, eve_qntdmin, eve_qntdmax, eve_rua, eve_numero, eve_compl, eve_bairro, eve_cidade, eve_uf, eve_meta, eve_msg, eve_desc, ger_id )
  VALUES (id, nome, statuseve, dataeve, periodo, qntdmin, qntdmax, rua, numero, compl, bairro, cidade, uf, meta, msg, descr, ger);
 END $$
 DELIMITER ; 

 -- 2 - EDITAR
 DELIMITER $$
 CREATE PROCEDURE editarEvento(
 IN id INT,
 IN nome VARCHAR(60),
 IN statuseve VARCHAR(20),		 
 IN dataeve DATE,				
 IN periodo VARCHAR(15),
 IN qntdmin INT,
 IN qntdmax INT,
 IN rua VARCHAR(80),
 IN numero VARCHAR(10),
 IN compl VARCHAR(50),
 IN bairro VARCHAR(40),
 IN cidade VARCHAR(40),
 IN uf CHAR(2),
 IN meta DECIMAL(10,2),
 IN msg TEXT,
 IN descr TEXT)					
 BEGIN
  UPDATE evento
  SET eve_nome = nome, eve_status = statuseve, eve_data = dataeve, eve_periodo = periodo, eve_qntdmin = qntdmin, eve_qntdmax = qntdmax, eve_rua = rua, eve_numero = numero, eve_compl = compl, eve_bairro = bairro, eve_cidade = cidade, eve_uf = uf, eve_meta = meta, eve_msg = msg, eve_desc = descr
  WHERE eve_id = id;
 END $$
 DELIMITER ;

 -- 3 - EXCLUIR
 DELIMITER $$
 CREATE PROCEDURE excluirEvento(
  IN nome VARCHAR (60)) 
  BEGIN
   DELETE FROM evento
   WHERE eve_nome = nome;
  END $$
  DELIMITER ;


-- RF09 O sistema deve permitir que o gerente cancele o evento
DELIMITER $$
CREATE PROCEDURE cancelarEvento(
 IN id INT,
 IN statuseve VARCHAR(20),
 IN msg TEXT)				
BEGIN
 UPDATE evento
 SET eve_status = statuseve, eve_msg = msg
 WHERE eve_id = id;
END $$
DELIMITER ;
 
 
-- RF10 O sistema deve permitir que o gerente reagende o evento
DELIMITER $$
CREATE PROCEDURE reagendarEvento(
						IN id INT,
						IN dataeve DATE,				
						IN periodo VARCHAR(15),
						IN rua VARCHAR(80),
						IN numero VARCHAR(10),
						IN compl VARCHAR(50),
						IN bairro VARCHAR(40),
						IN cidade VARCHAR(40),
						IN uf CHAR(2),
						IN msg TEXT)
BEGIN
 UPDATE evento
 SET eve_data = dataeve, eve_periodo = periodo, eve_rua = rua, eve_numero = numero, eve_compl = compl, eve_bairro = bairro, eve_cidade = cidade, eve_uf = uf, eve_msg = msg
 WHERE eve_id = id;
END $$
DELIMITER ;


-- RF11 O sistema deve permitir que o gerente finalize o evento
DELIMITER $$
CREATE PROCEDURE finalizarEvento(
 IN id INT,
 IN statuseve VARCHAR(20))				
BEGIN
 UPDATE evento
 SET eve_status = statuseve
 WHERE eve_id = id;
END $$
DELIMITER ;


-- RF12 O sistema deve apresentar as doações recebidas por evento
 -- 1 - Consulta de doações recebidas em dinheiro
 DELIMITER $$
 CREATE PROCEDURE consultarDoacaoDinheiro(
								IN id INT)
 BEGIN
  SELECT evento.eve_nome AS "Evento", 
		 SUM(doacao.doa_valor) AS "Valor"
  FROM evento
  INNER JOIN doacao
		  ON doacao.eve_id = evento.eve_id
  WHERE evento.eve_id = id 
  GROUP BY evento.eve_nome;
 END $$
 DELIMITER ;
  
 -- 2 - Consulta de doações recebidas em insumo
 DELIMITER $$
 CREATE PROCEDURE consultarDoacaoInsumo(
							  IN id INT)
 BEGIN
  SELECT evento.eve_nome AS "Evento", 
		 COUNT(insumo.ins_nome) AS "Quantidade", 
		 GROUP_CONCAT(insumo.ins_nome SEPARATOR ', ') AS "Insumos"
  FROM evento, doacao, insumo
  WHERE evento.eve_id = id and 
		doacao.eve_id = evento.eve_id and 
        doacao.ins_id = insumo.ins_id
  GROUP BY evento.eve_nome;  
 END $$
 DELIMITER ;

 -- 3 - Consulta de doações recebidas em utensilio
 DELIMITER $$
 CREATE PROCEDURE consultarDoacaoUtensilio(
								 IN id INT)
 BEGIN
  SELECT    evento.eve_nome AS "Evento", 
			COUNT(utensilio.ute_nome) AS "Quantidade",  
			GROUP_CONCAT(utensilio.ute_nome SEPARATOR ', ') AS "Utensílios"
  FROM evento, doacao, utensilio
  WHERE evento.eve_id = id and 
		doacao.eve_id = evento.eve_id and 
        doacao.ute_id = utensilio.ute_id
  GROUP BY evento.eve_nome;  
 END $$
 DELIMITER ;
  
 -- 4 - Consulta de doações recebidas em função
 DELIMITER $$
 CREATE PROCEDURE consultarDoacaoFuncao(
							  IN id INT)
 BEGIN
  SELECT    evento.eve_nome AS "Evento", 
			COUNT(funcao.fun_nome) AS "Quantidade", 
			GROUP_CONCAT(funcao.fun_nome SEPARATOR ', ') AS "Funções"
  FROM evento, doacao, funcao
  WHERE evento.eve_id = id and 
		doacao.eve_id = evento.eve_id and 
        doacao.fun_id = funcao.fun_id
  GROUP BY evento.eve_nome;
 END $$
DELIMITER ;


-- RF13 O sistema deve permitir que o usuário se torne colaborador em um evento
DELIMITER $$
CREATE procedure colaborar_evento(
					IN id_evu INT,
					IN id_evento INT,
					IN cpf INT,
					IN id_funcao INT)
BEGIN
 INSERT INTO evento_usuario(evu_id,eve_id,usu_cpf,fun_id) 
 VALUES (id_evu,id_evento, cpf, id_funcao);
END $$
DELIMITER ;


-- RF14 O sistema deve permitir que o usuário visualize eventos próximos
DELIMITER $$
CREATE PROCEDURE visualizarEventos(
				 IN busca VARCHAR(50))
BEGIN 
 SELECT eve_id, eve_nome, eve_status, eve_data, eve_rua, eve_numero,eve_bairro,eve_cidade, eve_uf
 FROM evento 
 WHERE eve_bairro LIKE concat('%',busca,'%') OR eve_cidade LIKE concat('%',busca,'%');
END $$
DELIMITER ;


-- RF15 O sistema deve permitir que o colaborador escolha um cargo
 -- Escolher o cargo
 DELIMITER $$
 CREATE PROCEDURE escolherCargo(
				IN doadata DATE,
			    IN descricao VARCHAR(200),
				IN usuario VARCHAR(14),
				IN evento INT,
				IN funcao VARCHAR(60))
  BEGIN
   INSERT INTO doacao(doa_data, doa_desc, 
					 usu_cpf, eve_id,
					 fun_id)
   VALUES (doadata, descricao, 
		  usuario, evento, funcao);
  
   INSERT INTO evento_usuario(eve_id, 
              usu_cpf, fun_id)
   VALUES (evento, usuario, funcao);
 END $$
 DELIMITER ;

-- Visualizar o cargo
 DELIMITER $$
 CREATE PROCEDURE visualizarCargo(
						IN id INT)
 BEGIN
  SELECT evento.eve_nome AS "Evento", 
		 evento.eve_data AS "Data Evento", 
		 funcao.fun_nome AS "Função", 
         doacao.doa_id AS "ID Doação", 
         doacao.doa_data AS "Data Atribuição"
  FROM doacao, funcao, evento
  WHERE doacao.doa_id = id and 
		doacao.fun_id = funcao.fun_id and 
        doacao.eve_id = evento.eve_id;
 END $$
 DELIMITER ;
 
 -- Excluir o cargo
 DELIMITER $$
 CREATE PROCEDURE excluirCargo(
				IN cpf VARCHAR(14),
				IN evento INT,
				IN funcao VARCHAR(60))
  BEGIN
   DELETE FROM doacao
   WHERE usu_cpf = cpf 
      AND eve_id = evento 
      AND fun_id = funcao;
  
   DELETE FROM evento_usuario
   WHERE usu_cpf = cpf
      AND eve_id = evento
      AND fun_id = funcao;
 END $$
 DELIMITER ;

-- RF16 O sistema deve permitir que o colaborador consulte eventos em que participa
DELIMITER $$
CREATE PROCEDURE consultarEventos(
						IN cpf VARCHAR(14))
BEGIN
  SELECT evento.eve_nome AS "Eventos", 
		 evento.eve_data AS "Data",
		 GROUP_CONCAT(DISTINCT funcao.fun_nome SEPARATOR ', ') AS "Função", 
         GROUP_CONCAT(DISTINCT doacao.doa_desc SEPARATOR ', ') AS "Doações Realizadas"
  FROM doacao, funcao, evento, usuario, evento_usuario
  WHERE usuario.usu_cpf = cpf and 
		evento_usuario.usu_id = usuario.usu_id and
        evento_usuario.fun_id = funcao.fun_id and
        evento_usuario.eve_id = evento.eve_id and 
        doacao.eve_id = evento.eve_id
  GROUP BY evento.eve_nome, evento.eve_data;
END $$
DELIMITER ;


-- RF17 O sistema deve permitir que o colaborador cancele sua inscrição
DELIMITER $$
CREATE procedure cancelar_inscricao(
						   IN id INT)
BEGIN
 DELETE FROM evento_usuario
 WHERE evu_id= id;
END $$
DELIMITER ;


-- RF18 O sistema deve permitir que o colaborador realize doações
 -- 1 - Mais de um tipo
 DELIMITER $$
 CREATE PROCEDURE fazerDoacaoCompleta(IN doadata DATE, 
									  IN descricao VARCHAR(200), 
                                      IN dinheiro DECIMAL(8, 2),
                                      IN quantidade INT, 
                                      IN cpf VARCHAR(14), 
                                      IN idevento INT, 
                                      IN idutensilio INT,
                                      IN idinsumo INT)
 BEGIN
  INSERT INTO doacao(doa_data, doa_desc, doa_valor, 
					 doa_qtd, usu_cpf, eve_id, ute_id, 
                     ins_id)
  VALUES (doadata, descricao, dinheiro,
		  quantidade, cpf, idevento, 
          idutensilio, idinsumo);
 END $$
 DELIMITER ;

 -- 2 - Somente dinheiro
 DELIMITER $$
 CREATE PROCEDURE fazerDoacaoDinheiro(IN id INT,
									  IN doadata DATE, 
                                      IN descricao VARCHAR(200),
                                      IN cpf VARCHAR(14), 
                                      IN idevento INT, 
                                      IN valor DECIMAL(8, 2))
 BEGIN
  INSERT INTO doacao( doa_id, doa_data, doa_desc, 
					 usu_cpf, eve_id, doa_valor)
  VALUES (id, doadata, descricao, 
		  cpf, idevento, valor);
  UPDATE evento
  SET eve_arrecadado = eve_arrecadado + din_valor,
	  eve_falta = eve_meta - eve_arrecadado
  WHERE evento.eve_id = idevento;
 END $$
 DELIMITER ;

 -- 3 - Somente utensílio
 DELIMITER $$
 CREATE PROCEDURE fazerDoacaoUtensilio(IN id INT,
									   IN doadata DATE, 
                                       IN descricao VARCHAR(200), 
                                       IN quantidade INT,
                                       IN cpf VARCHAR(14), 
                                       IN idevento INT, 
                                       IN idutensilio INT)
 BEGIN
  INSERT INTO doacao(doa_id, doa_data, doa_desc, 
					 doa_qtd, usu_cpf, eve_id, ute_id)
  VALUES (id, doadata, descricao, quantidade,
		  cpf, idevento, idutensilio);
 END $$
 DELIMITER ;

 -- 4 - Somente insumo
 DELIMITER $$
 CREATE PROCEDURE fazerDoacaoInsumo(IN id INT,
									IN doadata DATE, 
                                    IN descricao VARCHAR(200),
                                    IN quantidade INT,
                                    IN cpf VARCHAR(14), 
                                    IN idevento INT, 
                                    IN idinsumo INT)
 BEGIN
  INSERT INTO doacao(doa_id, doa_data, doa_desc, 
					 doa_qtd, usu_cpf, eve_id, 
                     ins_id)
  VALUES (id, doadata, descricao, quantidade,
		  cpf, idevento, idinsumo);
 END $$
 DELIMITER ;

 -- 5 - Visualizar doação
 DELIMITER $$
 CREATE PROCEDURE visualizarDoacao(
						 IN id INT)
 BEGIN
  SELECT doacao.doa_id AS "ID", 
		 doacao.doa_data AS "Data", 
         doacao.doa_desc AS "Descrição",
         evento.eve_nome AS "Evento",
         doacao.doa_valor AS "Valor",
         utensilio.ute_nome AS "Utensílio",
         doacao.doa_qtd AS "Quantidade",
         funcao.fun_nome AS "Função",
         insumo.ins_nome AS "Insumo"
  FROM doacao
  LEFT JOIN evento                                  
       ON doacao.eve_id = evento.eve_id
  LEFT JOIN utensilio
       ON doacao.ute_id = utensilio.ute_id
  LEFT JOIN funcao
       ON doacao.fun_id = funcao.fun_id
  LEFT JOIN insumo
       ON doacao.ins_id = insumo.ins_id
  WHERE doacao.doa_id = id;
 END $$
 DELIMITER ;













