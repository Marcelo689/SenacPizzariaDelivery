-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2021 às 23:26
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `senac_pizzaria_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adicional`
--

CREATE TABLE `adicional` (
  `codigo` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `situacao` tinyint(3) UNSIGNED NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `adicional_hst`
--

CREATE TABLE `adicional_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_adicional` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor` decimal(10,2) UNSIGNED NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo` int(11) UNSIGNED NOT NULL,
  `nome` varchar(90) NOT NULL,
  `telefone` bigint(20) NOT NULL,
  `celular` bigint(20) NOT NULL,
  `situacao` tinyint(3) UNSIGNED NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_hst`
--

CREATE TABLE `cliente_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_cliente` int(10) UNSIGNED NOT NULL,
  `nome` varchar(90) NOT NULL,
  `telefone` bigint(20) UNSIGNED NOT NULL,
  `celular` bigint(20) UNSIGNED NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_cliente` int(10) UNSIGNED NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` int(10) UNSIGNED NOT NULL,
  `complemento` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_padrao_cliente`
--

CREATE TABLE `endereco_padrao_cliente` (
  `codigo_cliente` int(11) UNSIGNED NOT NULL,
  `codigo_endereco` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_cliente` int(10) UNSIGNED NOT NULL,
  `codigo_status` int(10) UNSIGNED NOT NULL,
  `valor_pedido` decimal(10,2) UNSIGNED NOT NULL,
  `tele_entrega` tinyint(3) UNSIGNED NOT NULL,
  `valor_entrega` decimal(10,2) UNSIGNED NOT NULL,
  `valor_total` decimal(10,2) UNSIGNED NOT NULL,
  `dt_registro` datetime NOT NULL,
  `codigo_usr_registro` int(10) UNSIGNED NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_adicional`
--

CREATE TABLE `pedido_adicional` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_pedido` int(10) UNSIGNED NOT NULL,
  `codigo_adicional` int(10) UNSIGNED NOT NULL,
  `valor_total` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_adicional_hst`
--

CREATE TABLE `pedido_adicional_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_pedido_adicional` int(10) UNSIGNED NOT NULL,
  `codigo_pedido` int(10) UNSIGNED NOT NULL,
  `codigo_adicional` int(10) UNSIGNED NOT NULL,
  `valor_total` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_hst`
--

CREATE TABLE `pedido_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_pedido` int(10) UNSIGNED NOT NULL,
  `codigo_cliente` int(10) UNSIGNED NOT NULL,
  `codigo_status` int(10) UNSIGNED NOT NULL,
  `valor_pedido` decimal(10,2) UNSIGNED NOT NULL,
  `tele_entrega` tinyint(3) UNSIGNED NOT NULL,
  `valor_entrega` decimal(10,2) UNSIGNED NOT NULL,
  `valor_total` decimal(10,2) UNSIGNED NOT NULL,
  `dt_registro` datetime NOT NULL,
  `codigo_usr_registro` int(10) UNSIGNED NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_pizza`
--

CREATE TABLE `pedido_pizza` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_pedido` int(10) UNSIGNED NOT NULL,
  `codigo_tamanho_pizza` int(10) UNSIGNED NOT NULL,
  `codigo_sabor_borda` int(10) UNSIGNED NOT NULL,
  `valor_total` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_pizza_hst`
--

CREATE TABLE `pedido_pizza_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_pedido_pizza` int(10) UNSIGNED NOT NULL,
  `codigo_pedido` int(10) UNSIGNED NOT NULL,
  `codigo_tamanho_pizza` int(10) UNSIGNED NOT NULL,
  `codigo_sabor_borda` int(10) UNSIGNED NOT NULL,
  `valor_total` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_pizza_sabor`
--

CREATE TABLE `pedido_pizza_sabor` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_pedido_pizza` int(10) UNSIGNED NOT NULL,
  `codigo_sabor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_pizza_sabor_hst`
--

CREATE TABLE `pedido_pizza_sabor_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_pedido_pizza_sabor` int(10) UNSIGNED NOT NULL,
  `codigo_pedido_pizza` int(10) UNSIGNED NOT NULL,
  `codigo_sabor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sabor_borda`
--

CREATE TABLE `sabor_borda` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor_adicional` decimal(10,2) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sabor_borda_hst`
--

CREATE TABLE `sabor_borda_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_sabor_borda` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor_adicional` decimal(10,2) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sabor_pizza`
--

CREATE TABLE `sabor_pizza` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor_adicional` decimal(10,2) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sabor_pizza_hst`
--

CREATE TABLE `sabor_pizza_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_sabor_pizza` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor_adicional` decimal(10,2) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_pedido`
--

CREATE TABLE `status_pedido` (
  `codigo` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho_pizza`
--

CREATE TABLE `tamanho_pizza` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `qtd_sabores` tinyint(4) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho_pizza_hst`
--

CREATE TABLE `tamanho_pizza_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_tamanho_pizza` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `observacao` varchar(200) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `qtd_sabores` tinyint(4) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`codigo`, `descricao`) VALUES
(1, 'Surpevisor'),
(2, 'Atendente'),
(3, 'Pizzaiolo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_tipo_usuario` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `codigo_tipo_usuario`, `nome`, `login`, `senha`, `situacao`, `dt_alteracao`, `codigo_usr_alteracao`) VALUES
(1, 1, 'Marcelo Jaeger', 'marcelo.jaeger', '12345', 1, '2021-08-09 19:59:40', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_hst`
--

CREATE TABLE `usuario_hst` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `codigo_usuario` int(10) UNSIGNED NOT NULL,
  `codigo_tipo_usuario` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` int(45) NOT NULL,
  `situacao` tinyint(4) NOT NULL,
  `dt_alteracao` datetime NOT NULL,
  `codigo_usr_alteracao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `adicional`
--
ALTER TABLE `adicional`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_adicional_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `adicional_hst`
--
ALTER TABLE `adicional_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_adicional_hst_adicional` (`codigo_adicional`),
  ADD KEY `fk_adicional_hst_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_cliente_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `cliente_hst`
--
ALTER TABLE `cliente_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_cliente_hst_cliente` (`codigo_cliente`),
  ADD KEY `fk_cliente_hst_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_endereco_cliente_cliente` (`codigo_cliente`);

--
-- Índices para tabela `endereco_padrao_cliente`
--
ALTER TABLE `endereco_padrao_cliente`
  ADD PRIMARY KEY (`codigo_cliente`,`codigo_endereco`),
  ADD KEY `fk_endereco_padrao_cliente_endereco_cliente` (`codigo_endereco`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_usuario` (`codigo_usr_alteracao`),
  ADD KEY `fk_pedido_cliente` (`codigo_cliente`),
  ADD KEY `fk_pedido_status_pedido` (`codigo_status`),
  ADD KEY `fk_pedido_usuario_registro` (`codigo_usr_registro`);

--
-- Índices para tabela `pedido_adicional`
--
ALTER TABLE `pedido_adicional`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_adicional_pedido` (`codigo_pedido`),
  ADD KEY `fk_pedido_adicional_adicional` (`codigo_adicional`);

--
-- Índices para tabela `pedido_adicional_hst`
--
ALTER TABLE `pedido_adicional_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_adicional_hst_adicional` (`codigo_adicional`),
  ADD KEY `fk_pedido_adicional_hst_pedido` (`codigo_pedido`),
  ADD KEY `fk_pedido_adicional_hst_pedido_adicional` (`codigo_pedido_adicional`);

--
-- Índices para tabela `pedido_hst`
--
ALTER TABLE `pedido_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_hst_cliente` (`codigo_cliente`),
  ADD KEY `fk_pedido_hst_pedido` (`codigo_pedido`),
  ADD KEY `fk_pedido_hst_usuario_alteracao` (`codigo_usr_alteracao`),
  ADD KEY `fk_pedido_hst_usuario_registro` (`codigo_usr_registro`),
  ADD KEY `fk_pedido_hst_status_pedido` (`codigo_status`);

--
-- Índices para tabela `pedido_pizza`
--
ALTER TABLE `pedido_pizza`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_pizza_codigo_pedido` (`codigo_pedido`),
  ADD KEY `fk_pedido_pizza_sabor_borda` (`codigo_sabor_borda`),
  ADD KEY `fk_pedido_pizza_tamanho_pizza` (`codigo_tamanho_pizza`);

--
-- Índices para tabela `pedido_pizza_hst`
--
ALTER TABLE `pedido_pizza_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_pizza_hst_pedido` (`codigo_pedido`),
  ADD KEY `fk_pedido_pizza_pedido_pizza` (`codigo_pedido_pizza`),
  ADD KEY `fk_pedido_pizza_hst_sabor_borda` (`codigo_sabor_borda`),
  ADD KEY `fk_pedido_pizza_hst_tamanho_pizza` (`codigo_tamanho_pizza`);

--
-- Índices para tabela `pedido_pizza_sabor`
--
ALTER TABLE `pedido_pizza_sabor`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_pizza_sabor_pedido` (`codigo_pedido_pizza`),
  ADD KEY `fk_pedido_pizza_sabor_sabor_pizza` (`codigo_sabor`);

--
-- Índices para tabela `pedido_pizza_sabor_hst`
--
ALTER TABLE `pedido_pizza_sabor_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pedido_pizza_sabor_hst_pedido_pizza` (`codigo_pedido_pizza`),
  ADD KEY `fk_pedido_pizza_sabor_hst_pedido_pizza_sabor` (`codigo_pedido_pizza_sabor`),
  ADD KEY `fk_pedido_pizza_hst_sabor_pizza` (`codigo_sabor`);

--
-- Índices para tabela `sabor_borda`
--
ALTER TABLE `sabor_borda`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_sabor_borda` (`codigo_usr_alteracao`);

--
-- Índices para tabela `sabor_borda_hst`
--
ALTER TABLE `sabor_borda_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_sabor_borda_hst_sabor_borda` (`codigo_sabor_borda`),
  ADD KEY `fk_sabor_borda_hst_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `sabor_pizza`
--
ALTER TABLE `sabor_pizza`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_sabor_pizza_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `sabor_pizza_hst`
--
ALTER TABLE `sabor_pizza_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_sabor_pizza_hst_sabor_pizza` (`codigo_sabor_pizza`),
  ADD KEY `fk_sabor_pizza_hst_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `status_pedido`
--
ALTER TABLE `status_pedido`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `tamanho_pizza`
--
ALTER TABLE `tamanho_pizza`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_tamanho_pizza_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `tamanho_pizza_hst`
--
ALTER TABLE `tamanho_pizza_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_tamanho_pizza_hst_tamanho_pizza` (`codigo_tamanho_pizza`),
  ADD KEY `fk_tamanho_pizza_hst_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_usuario_tipo_usuario` (`codigo_tipo_usuario`),
  ADD KEY `fk_usuario_usuario` (`codigo_usr_alteracao`);

--
-- Índices para tabela `usuario_hst`
--
ALTER TABLE `usuario_hst`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_usuario_hst_usuario` (`codigo_usuario`),
  ADD KEY `fk_usuario_hst_tipo_usuario` (`codigo_tipo_usuario`),
  ADD KEY `fk_usuario_hst_usuario_alteracao` (`codigo_usr_alteracao`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adicional`
--
ALTER TABLE `adicional`
  MODIFY `codigo` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `adicional_hst`
--
ALTER TABLE `adicional_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente_hst`
--
ALTER TABLE `cliente_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_adicional`
--
ALTER TABLE `pedido_adicional`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_adicional_hst`
--
ALTER TABLE `pedido_adicional_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_hst`
--
ALTER TABLE `pedido_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_pizza`
--
ALTER TABLE `pedido_pizza`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_pizza_hst`
--
ALTER TABLE `pedido_pizza_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_pizza_sabor`
--
ALTER TABLE `pedido_pizza_sabor`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_pizza_sabor_hst`
--
ALTER TABLE `pedido_pizza_sabor_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sabor_borda`
--
ALTER TABLE `sabor_borda`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sabor_borda_hst`
--
ALTER TABLE `sabor_borda_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sabor_pizza`
--
ALTER TABLE `sabor_pizza`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sabor_pizza_hst`
--
ALTER TABLE `sabor_pizza_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status_pedido`
--
ALTER TABLE `status_pedido`
  MODIFY `codigo` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tamanho_pizza`
--
ALTER TABLE `tamanho_pizza`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tamanho_pizza_hst`
--
ALTER TABLE `tamanho_pizza_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario_hst`
--
ALTER TABLE `usuario_hst`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `adicional`
--
ALTER TABLE `adicional`
  ADD CONSTRAINT `fk_adicional_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `adicional_hst`
--
ALTER TABLE `adicional_hst`
  ADD CONSTRAINT `fk_adicional_hst_adicional` FOREIGN KEY (`codigo_adicional`) REFERENCES `adicional` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_adicional_hst_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cliente_hst`
--
ALTER TABLE `cliente_hst`
  ADD CONSTRAINT `fk_cliente_hst_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_hst_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `fk_endereco_cliente_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `endereco_padrao_cliente`
--
ALTER TABLE `endereco_padrao_cliente`
  ADD CONSTRAINT `fk_endereco_padrao_cliente_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `fk_endereco_padrao_cliente_endereco_cliente` FOREIGN KEY (`codigo_endereco`) REFERENCES `endereco_cliente` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_status_pedido` FOREIGN KEY (`codigo_status`) REFERENCES `status_pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_usuario_registro` FOREIGN KEY (`codigo_usr_registro`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_adicional`
--
ALTER TABLE `pedido_adicional`
  ADD CONSTRAINT `fk_pedido_adicional_adicional` FOREIGN KEY (`codigo_adicional`) REFERENCES `adicional` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_adicional_pedido` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_adicional_hst`
--
ALTER TABLE `pedido_adicional_hst`
  ADD CONSTRAINT `fk_pedido_adicional_hst_adicional` FOREIGN KEY (`codigo_adicional`) REFERENCES `adicional` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_adicional_hst_pedido` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_adicional_hst_pedido_adicional` FOREIGN KEY (`codigo_pedido_adicional`) REFERENCES `pedido_adicional` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_hst`
--
ALTER TABLE `pedido_hst`
  ADD CONSTRAINT `fk_pedido_hst_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_hst_pedido` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_hst_status_pedido` FOREIGN KEY (`codigo_status`) REFERENCES `status_pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_hst_usuario_alteracao` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_hst_usuario_registro` FOREIGN KEY (`codigo_usr_registro`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_pizza`
--
ALTER TABLE `pedido_pizza`
  ADD CONSTRAINT `fk_pedido_pizza_codigo_pedido` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_sabor_borda` FOREIGN KEY (`codigo_sabor_borda`) REFERENCES `sabor_borda` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_tamanho_pizza` FOREIGN KEY (`codigo_tamanho_pizza`) REFERENCES `tamanho_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_pizza_hst`
--
ALTER TABLE `pedido_pizza_hst`
  ADD CONSTRAINT `fk_pedido_pizza_hst_pedido` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_hst_sabor_borda` FOREIGN KEY (`codigo_sabor_borda`) REFERENCES `sabor_borda` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_hst_tamanho_pizza` FOREIGN KEY (`codigo_tamanho_pizza`) REFERENCES `tamanho_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_pedido_pizza` FOREIGN KEY (`codigo_pedido_pizza`) REFERENCES `pedido_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_pizza_sabor`
--
ALTER TABLE `pedido_pizza_sabor`
  ADD CONSTRAINT `fk_pedido_pizza_sabor_pedido` FOREIGN KEY (`codigo_pedido_pizza`) REFERENCES `pedido_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_sabor_sabor_pizza` FOREIGN KEY (`codigo_sabor`) REFERENCES `sabor_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_pizza_sabor_hst`
--
ALTER TABLE `pedido_pizza_sabor_hst`
  ADD CONSTRAINT `fk_pedido_pizza_hst_sabor_pizza` FOREIGN KEY (`codigo_sabor`) REFERENCES `sabor_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_sabor_hst_pedido_pizza` FOREIGN KEY (`codigo_pedido_pizza`) REFERENCES `pedido_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pizza_sabor_hst_pedido_pizza_sabor` FOREIGN KEY (`codigo_pedido_pizza_sabor`) REFERENCES `pedido_pizza_sabor` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `sabor_borda`
--
ALTER TABLE `sabor_borda`
  ADD CONSTRAINT `fk_sabor_borda` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `sabor_borda_hst`
--
ALTER TABLE `sabor_borda_hst`
  ADD CONSTRAINT `fk_sabor_borda_hst_sabor_borda` FOREIGN KEY (`codigo_sabor_borda`) REFERENCES `sabor_borda` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sabor_borda_hst_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `sabor_pizza`
--
ALTER TABLE `sabor_pizza`
  ADD CONSTRAINT `fk_sabor_pizza_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `sabor_pizza_hst`
--
ALTER TABLE `sabor_pizza_hst`
  ADD CONSTRAINT `fk_sabor_pizza_hst_sabor_pizza` FOREIGN KEY (`codigo_sabor_pizza`) REFERENCES `sabor_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sabor_pizza_hst_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tamanho_pizza`
--
ALTER TABLE `tamanho_pizza`
  ADD CONSTRAINT `fk_tamanho_pizza_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tamanho_pizza_hst`
--
ALTER TABLE `tamanho_pizza_hst`
  ADD CONSTRAINT `fk_tamanho_pizza_hst_tamanho_pizza` FOREIGN KEY (`codigo_tamanho_pizza`) REFERENCES `tamanho_pizza` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tamanho_pizza_hst_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipo_usuario` FOREIGN KEY (`codigo_tipo_usuario`) REFERENCES `tipo_usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_usuario` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario_hst`
--
ALTER TABLE `usuario_hst`
  ADD CONSTRAINT `fk_usuario_hst_tipo_usuario` FOREIGN KEY (`codigo_tipo_usuario`) REFERENCES `tipo_usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_hst_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_hst_usuario_alteracao` FOREIGN KEY (`codigo_usr_alteracao`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
