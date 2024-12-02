-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 02/12/2024 às 21:05
-- Versão do servidor: 8.0.40
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mamamia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(255) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nome_categoria`) VALUES
(8, 'PIZZA TRADICIONAL'),
(9, 'BEBIDA'),
(10, 'SOBREMESAS'),
(12, 'Pizza Tradicional'),
(13, 'Pizza Doce');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `apelido_nome_fantasia` varchar(255) DEFAULT NULL,
  `nome_razao_social` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `cpf_cnpj` varchar(255) DEFAULT NULL,
  `CEP` varchar(255) DEFAULT NULL,
  `rua_logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`idClientes`, `apelido_nome_fantasia`, `nome_razao_social`, `tipo`, `cpf_cnpj`, `CEP`, `rua_logradouro`, `numero`, `complemento`, `bairro`, `createdAt`, `updatedAt`) VALUES
(6, 'Nathália', 'Nathália', 'pessoa-fisica', '042.352.366-32', '75908670', 'Rua elizabeth campos', '123', 'clinica odonto id', 'setor morada do sol', '2024-11-25 01:00:34', '2024-11-25 01:00:34'),
(7, 'hENRIQUE DIRKS', 'hENRIQUE DIRKS', 'pessoa-fisica', '698.519.198-19', '75908-908', 'RUA TESTE HENRIQUE', '64992933891', 'AO LADO DA DO MERDAO SEI LA ', 'JARDIM DAS ROSAS', '2024-11-25 11:41:03', '2024-11-25 11:41:03'),
(8, 'BRUNO GGFs', 'BRUNO GGFs LTDA', 'pessoa-juridica', '01.561.981/0001-80', '75908780', 'Rua são sebastião', '', 'Ao lado do boliche', 'Setor canaã', '2024-11-25 12:14:45', '2024-11-25 12:14:45'),
(9, 'TESTE3', 'TESTE3', 'pessoa-fisica', '981.981.989-19', '75998198', 'TESTE3', '123', 'TESTE3', 'TESTE3', '2024-12-02 20:52:38', '2024-12-02 20:52:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupons`
--

DROP TABLE IF EXISTS `cupons`;
CREATE TABLE IF NOT EXISTS `cupons` (
  `idCupom` int NOT NULL AUTO_INCREMENT,
  `codigo_promocional` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `inutilizado` tinyint(1) DEFAULT '0',
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCupom`),
  UNIQUE KEY `codigo_promocional` (`codigo_promocional`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cupons`
--

INSERT INTO `cupons` (`idCupom`, `codigo_promocional`, `valor`, `inutilizado`, `data_criacao`) VALUES
(4, '5OFF', 5.00, 0, '2024-11-25 01:02:14'),
(5, '10OFF', 10.00, 0, '2024-11-26 17:58:11'),
(6, '20OFF', 20.00, 0, '2024-12-02 20:53:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcoes`
--

DROP TABLE IF EXISTS `funcoes`;
CREATE TABLE IF NOT EXISTS `funcoes` (
  `idFuncao` int NOT NULL AUTO_INCREMENT,
  `nome_funcao` varchar(45) NOT NULL,
  PRIMARY KEY (`idFuncao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `logins`
--

DROP TABLE IF EXISTS `logins`;
CREATE TABLE IF NOT EXISTS `logins` (
  `idLogin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLogin`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `logins`
--

INSERT INTO `logins` (`idLogin`, `username`, `password_hash`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'Bruno', '123456', 'admin', '2024-12-02 14:32:27', '2024-12-02 14:32:27'),
(2, 'admin', '$2b$10$eW5R4FGD4Gx13FQlXs5aD.mV1e9UmW/0XUFj6MZ59bV5WFnF3CO/y', 'admin', '2024-12-02 15:46:09', '2024-12-02 15:46:09'),
(3, 'TESTE2', '$2b$10$7tIVGFs7O4e0ePYJoYYYv.ydz4eSXT02WQ2t2CfzhuOEBcBs/ISLO', 'user', '2024-12-02 16:39:57', '2024-12-02 16:39:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `valor_pedido` decimal(10,2) DEFAULT NULL,
  `idClientes` int NOT NULL,
  `idCupom` int DEFAULT NULL,
  `idProduto` int NOT NULL,
  `status` enum('PENDENTE','RECEBIDO','EM PREPARO','ENTREGADOR À CAMINHO','ENTREGUE','CANCELADO') NOT NULL,
  `forma_pagamento` varchar(45) DEFAULT NULL,
  `observacao_cliente` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `fk_pedido_clientes1_idx` (`idClientes`),
  KEY `fk_pedido_cupons1_idx` (`idCupom`),
  KEY `fk_pedido_produtos1_idx` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`idpedido`, `valor_pedido`, `idClientes`, `idCupom`, `idProduto`, `status`, `forma_pagamento`, `observacao_cliente`) VALUES
(2, 10.00, 6, 4, 4, 'CANCELADO', 'DINHEIRO', 'REMOVER CELOBA'),
(13, 10.00, 8, 4, 4, 'RECEBIDO', 'PIX', NULL);

--
-- Acionadores `pedido`
--
DROP TRIGGER IF EXISTS `trg_calculate_valor_pedido`;
DELIMITER $$
CREATE TRIGGER `trg_calculate_valor_pedido` BEFORE INSERT ON `pedido` FOR EACH ROW BEGIN
    DECLARE preco_produto DECIMAL(10,2);
    DECLARE desconto_cupom DECIMAL(10,2);

    -- Obter o preço do produto
    SELECT preco INTO preco_produto
    FROM produtos
    WHERE idProduto = NEW.idProduto;

    -- Obter o valor do desconto do cupom (se aplicável)
    IF NEW.idCupom IS NOT NULL THEN
        SELECT valor INTO desconto_cupom
        FROM cupons
        WHERE idCupom = NEW.idCupom;
    ELSE
        SET desconto_cupom = 0;
    END IF;

    -- Calcular o valor do pedido
    SET NEW.valor_pedido = preco_produto - desconto_cupom;

    -- Garantir que o valor do pedido não seja negativo
    IF NEW.valor_pedido < 0 THEN
        SET NEW.valor_pedido = 0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `tamanho` enum('P','M','G','null') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idCategoria` int NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `descricao` text,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`idProduto`, `nome`, `tamanho`, `idCategoria`, `preco`, `descricao`, `imagem`) VALUES
(4, 'COCA-COLA 2L', 'P', 9, 15.00, 'COCA 2L SABE LER NÃO??????', NULL),
(5, 'Margherita ', 'G', 8, 65.00, 'margherita G - 12 pedaços', NULL),
(6, 'GUARANA LATA - 350ml', 'null', 9, 6.00, '', '1732560703880-imagem_2024-11-25_155142891.png'),
(7, 'Pepsi 2L', 'null', 9, 8.00, '', '1732560441966-WhatsApp Image 2024-11-25 at 15.39.25.jpeg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(255) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `funcao` enum('gerente','atendente','entregador','admin') NOT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nome_completo`, `cpf`, `funcao`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `createdAt`, `updatedAt`) VALUES
(7, 'bruno', '04206846111', 'gerente', '75908-780', 'Rua elizabeth campos', NULL, 'ao lado da clinica odonto ID', 'Setor morada do sol', '2024-11-27 22:08:27', '2024-11-27 22:08:27');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_clientes1` FOREIGN KEY (`idClientes`) REFERENCES `clientes` (`idClientes`),
  ADD CONSTRAINT `fk_pedido_cupons1` FOREIGN KEY (`idCupom`) REFERENCES `cupons` (`idCupom`),
  ADD CONSTRAINT `fk_pedido_produtos1` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
