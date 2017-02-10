-- phpMyAdmin SQL Dump
-- version 3.0.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Fev 09, 2017 as 11:05 PM
-- Versão do Servidor: 5.0.51
-- Versão do PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `nr-10`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(10) NOT NULL default 'banner',
  `name` varchar(50) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_banner`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `contact` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_bannerclient`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_bannerfinish`
--

CREATE TABLE IF NOT EXISTS `jos_bannerfinish` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(10) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `impressions` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(50) NOT NULL default '',
  `datestart` datetime default NULL,
  `dateend` datetime default NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_bannerfinish`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `image` varchar(100) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(10) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_section` (`section`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_categories`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Extraindo dados da tabela `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, ''),
(2, 'Administar Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, ''),
(3, 'Administar Clientes', '', 0, 1, 'option=com_banners&task=listclients', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, ''),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/globe2.png', 0, ''),
(5, 'Weblink Itens', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, ''),
(6, 'Weblink Categorias', '', 0, 4, 'option=categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, ''),
(7, 'Contatos', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/user.png', 1, ''),
(8, 'Administrar Contatos', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, ''),
(9, 'Categoria Contatos', '', 0, 7, 'option=categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, ''),
(10, 'Primeira Página', 'option=com_frontpage', 0, 0, '', 'Gerir Artigos da Primeira Página', 'com_frontpage', 0, 'js/ThemeOffice/component.png', 1, ''),
(11, 'Enquetes', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, ''),
(12, 'Notícias Externas', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, ''),
(13, 'Administrar Notícias Externas', '', 0, 12, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, ''),
(14, 'Administrar Categorias', '', 0, 12, 'option=categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, ''),
(15, 'Login', 'option=com_login', 0, 0, '', '', 'com_login', 0, '', 1, ''),
(16, 'Pesquisar', 'option=com_search', 0, 0, '', '', 'com_search', 0, '', 1, ''),
(17, 'Difusão de Notícias', '', 0, 0, 'option=com_syndicate&hidemainmenu=1', 'Gerir configuração de Difusão dos Sinais Noticiosos', 'com_syndicate', 0, 'js/ThemeOffice/component.png', 0, ''),
(18, 'E-mail em Massa', '', 0, 0, 'option=com_massmail&hidemainmenu=1', 'Enviar e-mail para múltiplos destinatários', 'com_massmail', 0, 'js/ThemeOffice/mass_email.png', 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `con_position` varchar(50) default NULL,
  `address` text,
  `suburb` varchar(50) default NULL,
  `state` varchar(20) default NULL,
  `country` varchar(50) default NULL,
  `postcode` varchar(10) default NULL,
  `telephone` varchar(25) default NULL,
  `fax` varchar(25) default NULL,
  `misc` mediumtext,
  `image` varchar(100) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(100) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_contact_details`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `title_alias` varchar(100) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(100) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_mask` (`mask`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`) VALUES
(1, 'Norma NR 10', 'Norma NR 10', '<div align="right"><em><strong>NR &ndash; 10:</strong> Portaria n.&ordm; 598, de 07/12/2004 (D.O.U. de 08/12/2004 &ndash; Se&ccedil;&atilde;o 1)</em><br /><em><strong>Ementas:</strong> Portaria n.&ordm; 126, de 03/06/2005 (D.O.U. de 06/06/2005 &ndash; Se&ccedil;&atilde;o 1)</em><br /></div><p>&nbsp;</p><div align="center"><strong>NORMA REGULAMENTADORA N&ordm; 10</strong><br /><strong>SEGURAN&Ccedil;A EM INSTALA&Ccedil;&Otilde;ES E SERVI&Ccedil;OS EM ELETRICIDADE</strong></div><div align="center">&nbsp;</div><p><strong>10.1- OBJETIVO E CAMPO DE APLICA&Ccedil;&Atilde;O</strong></p><p><br /><strong>10.1.1</strong> Esta Norma Regulamentadora &ndash; NR estabelece os requisitos e condi&ccedil;&otilde;es m&iacute;nimas objetivando a implementa&ccedil;&atilde;o de medidas de controle e sistemas reventivos, de forma a garantir a seguran&ccedil;a e a sa&uacute;de dos trabalhadores que, direta ou indiretamente, interajam em instala&ccedil;&otilde;es el&eacute;tricas e servi&ccedil;os com eletricidade.<br /><strong>10.1.2 </strong>Esta NR se aplica &agrave;s fases de gera&ccedil;&atilde;o, transmiss&atilde;o, distribui&ccedil;&atilde;o e consumo, incluindo as etapas de projeto, constru&ccedil;&atilde;o, montagem, opera&ccedil;&atilde;o, manuten&ccedil;&atilde;o das instala&ccedil;&otilde;es el&eacute;tricas e quaisquer trabalhos realizados nas suas proximidades, observando-se as normas t&eacute;cnicas oficiais estabelecidas pelos &oacute;rg&atilde;os competentes e, na aus&ecirc;ncia ou omiss&atilde;o destas, as normas internacionais cab&iacute;veis.</p><p><br /><strong>10.2 - MEDIDAS DE CONTROLE</strong></p><p><br /><strong>10.2.1</strong> Em todas as interven&ccedil;&otilde;es em instala&ccedil;&otilde;es el&eacute;tricas devem ser adotadas medidas preventivas de controle do risco el&eacute;trico e de outros riscos adicionais, mediante t&eacute;cnicas de an&aacute;lise de risco, de forma a garantir a seguran&ccedil;a e a sa&uacute;de no trabalho. (210.001-0/I=3)<br /><span style="font-weight: bold">10.2.2 </span>As medidas de controle adotadas devem integrar-se &agrave;s demais iniciativas da empresa, no &acirc;mbito da preserva&ccedil;&atilde;o da seguran&ccedil;a, da sa&uacute;de e do meio ambiente do trabalho. (210.002-9/I=1)<br /><span style="font-weight: bold">10.2.3</span> As empresas est&atilde;o obrigadas a manter esquemas unifilares atualizados das instala&ccedil;&otilde;es el&eacute;tricas dos seus estabelecimentos com as especifica&ccedil;&otilde;es do sistema de aterramento e demais equipamentos e dispositivos de prote&ccedil;&atilde;o. (210.003-7/I=3)<br /><span style="font-weight: bold">10.2.4</span> Os estabelecimentos com carga instalada superior a 75 kW devem constituir e manter o Prontu&aacute;rio de Instala&ccedil;&otilde;es El&eacute;tricas, contendo, al&eacute;m do disposto no subitem <span style="font-weight: bold">10.2.3</span>, no m&iacute;nimo: (210.004-5/I=4)</p><div style="margin-left: 40px"><span style="font-weight: bold">a)</span> conjunto de procedimentos e instru&ccedil;&otilde;es t&eacute;cnicas e administrativas de seguran&ccedil;a e sa&uacute;de, implantadas e relacionadas a esta NR e descri&ccedil;&atilde;o das medidas de controle existentes; (210.005-3/I=3)</div><div style="margin-left: 40px"><span style="font-weight: bold">b) </span>documenta&ccedil;&atilde;o das inspe&ccedil;&otilde;es e medi&ccedil;&otilde;es do sistema de prote&ccedil;&atilde;o contra descargas atmosf&eacute;ricas e aterramentos el&eacute;tricos; (210.006-1/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">c)</span> especifica&ccedil;&atilde;o dos equipamentos de prote&ccedil;&atilde;o coletiva e individual e o ferramental, aplic&aacute;veis conforme determina esta NR; (210.007-0/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">d)</span> documenta&ccedil;&atilde;o comprobat&oacute;ria da qualifica&ccedil;&atilde;o, habilita&ccedil;&atilde;o, capacita&ccedil;&atilde;o, autoriza&ccedil;&atilde;o dos trabalhadores e dos treinamentos realizados; (210.008-8/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">e)</span> resultados dos testes de isola&ccedil;&atilde;o el&eacute;trica realizados em equipamentos de prote&ccedil;&atilde;o individual e coletiva; (210.009-6/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">f) </span>certifica&ccedil;&otilde;es dos equipamentos e materiais el&eacute;tricos em &aacute;reas classificadas; (210.010-0/I=3)</div><div style="margin-left: 40px"><span style="font-weight: bold">g)</span> relat&oacute;rio t&eacute;cnico das inspe&ccedil;&otilde;es atualizadas com recomenda&ccedil;&otilde;es, cronogramas de adequa&ccedil;&otilde;es, contemplando as al&iacute;neas de &ldquo;a&rdquo; a &ldquo;f&rdquo;. (210.011-8/I=3)<br /></div><p><span style="font-weight: bold">10.2.5</span> As empresas que operam em instala&ccedil;&otilde;es ou equipamentos integrantes do sistema el&eacute;trico de pot&ecirc;ncia devem constituir prontu&aacute;rio com o conte&uacute;do do item 10.2.4 e acrescentar ao prontu&aacute;rio os documentos a seguir listados: (210.012-6/I=4)</p><div style="margin-left: 40px"><span style="font-weight: bold">a)</span> descri&ccedil;&atilde;o dos procedimentos para emerg&ecirc;ncias; (210.013-4/I=3)</div><div style="margin-left: 40px"><span style="font-weight: bold">b)</span> certifica&ccedil;&otilde;es dos equipamentos de prote&ccedil;&atilde;o coletiva e individual; 210.014-2/I=3)<br /></div><p><span style="font-weight: bold">10.2.5.1</span> As empresas que realizam trabalhos em proximidade do Sistema El&eacute;trico de Pot&ecirc;ncia devem constituir prontu&aacute;rio contemplando as al&iacute;neas &ldquo;a&rdquo;, &ldquo;c&rdquo;, &quot;d&rdquo; e &ldquo;e&rdquo;, do item 10.2.4 e al&iacute;neas &ldquo;a&rdquo; e &ldquo;b&rdquo; do item 10.2.5. (210.015-0/I=4)<br /><span style="font-weight: bold">10.2.6</span> O Prontu&aacute;rio de Instala&ccedil;&otilde;es El&eacute;tricas deve ser organizado e mantido atualizado pelo empregador ou pessoa formalmente designada pela empresa, devendo permanecer &agrave; disposi&ccedil;&atilde;o dos trabalhadores envolvidos nas instala&ccedil;&otilde;es e servi&ccedil;os em eletricidade. (210.016-9/I=3)<br /><span style="font-weight: bold">10.2.7</span> Os documentos t&eacute;cnicos previstos no Prontu&aacute;rio de Instala&ccedil;&otilde;es El&eacute;tricas devem ser elaborados por profissional legalmente habilitado. (210.017-7/I=2)</p><p><br /><span style="font-weight: bold">10.2.8 - MEDIDAS DE PROTE&Ccedil;&Atilde;O COLETIVA</span></p><p><br /><span style="font-weight: bold">10.2.8.1</span> Em todos os servi&ccedil;os executados em instala&ccedil;&otilde;es el&eacute;tricas devem ser previstas e adotadas, prioritariamente, medidas de prote&ccedil;&atilde;o coletiva aplic&aacute;veis, mediante procedimentos, &agrave;s atividades a serem desenvolvidas, de forma a garantir a seguran&ccedil;a e a sa&uacute;de dos trabalhadores. (210.018-5/I=4)<br /><span style="font-weight: bold">10.2.8.2</span> As medidas de prote&ccedil;&atilde;o coletiva compreendem, prioritariamente, a desenergiza&ccedil;&atilde;o el&eacute;trica conforme estabelece esta NR e, na sua impossibilidade, o emprego de tens&atilde;o de seguran&ccedil;a. (210.019-3/I=3)<br /><span style="font-weight: bold">10.2.8.2.1</span> Na impossibilidade de implementa&ccedil;&atilde;o do estabelecido no subitem 10.2.8.2., devem ser utilizadas outras medidas de prote&ccedil;&atilde;o coletiva, tais como: isola&ccedil;&atilde;o das partes vivas, obst&aacute;culos, barreiras, sinaliza&ccedil;&atilde;o, sistema de seccionamento autom&aacute;tico de alimenta&ccedil;&atilde;o, bloqueio do religamento autom&aacute;tico. (210.020-7/I=2)<br /><span style="font-weight: bold">10.2.8.3</span> O aterramento das instala&ccedil;&otilde;es el&eacute;tricas deve ser executado conforme regulamenta&ccedil;&atilde;o estabelecida pelos &oacute;rg&atilde;os competentes e, na aus&ecirc;ncia desta, deve atender &agrave;s Normas Internacionais vigentes. (210.021-5/I=2)</p><p><br /><span style="font-weight: bold">10.2.9 - MEDIDAS DE PROTE&Ccedil;&Atilde;O INDIVIDUAL</span></p><p><br /><span style="font-weight: bold">10.2.9.1</span> Nos trabalhos em instala&ccedil;&otilde;es el&eacute;tricas, quando as medidas de prote&ccedil;&atilde;o coletiva forem tecnicamente invi&aacute;veis ou insuficientes para controlar os riscos, devem ser adotados equipamentos de prote&ccedil;&atilde;o individual espec&iacute;ficos e adequados &agrave;s atividades desenvolvidas, em atendimento ao disposto na NR 6. (210.022-3/I=4)<br /><span style="font-weight: bold">10.2.9.2</span> As vestimentas de trabalho devem ser adequadas &agrave;s atividades, devendo contemplar a condutibilidade, inflamabilidade e influ&ecirc;ncias eletromagn&eacute;ticas. (210.023-1\\/I=4)<br /><span style="font-weight: bold">10.2.9.3</span> &Eacute; vedado o uso de adornos pessoais nos trabalhos com instala&ccedil;&otilde;es el&eacute;tricas ou em suas proximidades. (210.024-0/I=1)</p><p><br /><span style="font-weight: bold">10.3 - SEGURAN&Ccedil;A EM PROJETOS</span></p><p><br /><span style="font-weight: bold">10.3.1</span> &Eacute; obrigat&oacute;rio que os projetos de instala&ccedil;&otilde;es el&eacute;tricas especifiquem dispositivos de desligamento de circuitos que possuam recursos para impedimento de reenergiza&ccedil;&atilde;o, para sinaliza&ccedil;&atilde;o de advert&ecirc;ncia com indica&ccedil;&atilde;o da condi&ccedil;&atilde;o operativa. (210.025-8/I=3)<br /><span style="font-weight: bold">10.3.2</span> O projeto el&eacute;trico, na medida do poss&iacute;vel, deve prever a instala&ccedil;&atilde;o de dispositivo de seccionamento de a&ccedil;&atilde;o simult&acirc;nea, que permita a aplica&ccedil;&atilde;o de impedimento de reenergiza&ccedil;&atilde;o do circuito. (210.026-6/I=3)<br /><span style="font-weight: bold">10.3.3 </span>O projeto de instala&ccedil;&otilde;es el&eacute;tricas deve considerar o espa&ccedil;o seguro, quanto ao dimensionamento e a localiza&ccedil;&atilde;o de seus componentes e as influ&ecirc;ncias externas, quando da opera&ccedil;&atilde;o e da realiza&ccedil;&atilde;o de servi&ccedil;os de constru&ccedil;&atilde;o e manuten&ccedil;&atilde;o. (210.027-4/I=3)<br /><span style="font-weight: bold">10.3.3.1</span> Os circuitos el&eacute;tricos com finalidades diferentes, tais como: comunica&ccedil;&atilde;o, sinaliza&ccedil;&atilde;o, controle e tra&ccedil;&atilde;o el&eacute;trica devem ser identificados e instalados separadamente, salvo quando o desenvolvimento tecnol&oacute;gico permitir compartilhamento, respeitadas as defini&ccedil;&otilde;es de projetos. (210.028-2/I=3)<br /><span style="font-weight: bold">10.3.4</span> O projeto deve definir a configura&ccedil;&atilde;o do esquema de aterramento, a obrigatoriedade ou n&atilde;o da interliga&ccedil;&atilde;o entre o condutor neutro e o de prote&ccedil;&atilde;o e a conex&atilde;o &agrave; terra das partes condutoras n&atilde;o destinadas &agrave; condu&ccedil;&atilde;o da eletricidade. (210.029-0/I=3)<br /><span style="font-weight: bold">10.3.5</span> Sempre que for tecnicamente vi&aacute;vel e necess&aacute;rio, devem ser projetados dispositivos de seccionamento que incorporem recursos fixos de equipotencializa&ccedil;&atilde;o e aterramento do circuito seccionado. (210.030-4/I=1)<br /><span style="font-weight: bold">10.3.6 </span>Todo projeto deve prever condi&ccedil;&otilde;es para a ado&ccedil;&atilde;o de aterramento tempor&aacute;rio. (210.031-2/I=2)<br /><span style="font-weight: bold">10.3.7</span> O projeto das instala&ccedil;&otilde;es el&eacute;tricas deve ficar &agrave; disposi&ccedil;&atilde;o dos trabalhadores autorizados, das autoridades competentes e de outras pessoas autorizadas pela empresa e deve ser mantido atualizado. (210.032-0/I=2)<br /><span style="font-weight: bold">10.3.8</span> O projeto el&eacute;trico deve atender ao que disp&otilde;em as Normas Regulamentadoras de Sa&uacute;de e Seguran&ccedil;a no Trabalho, as regulamenta&ccedil;&otilde;es t&eacute;cnicas oficiais estabelecidas, e ser assinado por profissional legalmente habilitado. (210.033-9/I=2)<br /><span style="font-weight: bold">10.3.9</span> O memorial descritivo do projeto deve conter, no m&iacute;nim o, os seguintes itens de seguran&ccedil;a:</p><div style="margin-left: 40px"><span style="font-weight: bold">a)</span> especifica&ccedil;&atilde;o das caracter&iacute;sticas relativas &agrave; prote&ccedil;&atilde;o contra choques el&eacute;tricos, queimaduras e outros riscos adicionais; (210.034-7/I-1)<br /><span style="font-weight: bold">b)</span> indica&ccedil;&atilde;o de posi&ccedil;&atilde;o dos dispositivos de manobra dos circuitos el&eacute;tricos: (Verde &ndash; &ldquo;D&rdquo;, desligado e Vermelho - &ldquo;L&rdquo;, ligado); (210.035-5/I-1)<br /><span style="font-weight: bold">c)</span> descri&ccedil;&atilde;o do sistema de identifica&ccedil;&atilde;o de circuitos el&eacute;tricos e equipamentos, incluindo dispositivos de manobra, de controle, de prote&ccedil;&atilde;o, de intertravamento, dos condutores e os pr&oacute;prios equipamentos e estruturas, definindo como tais indica&ccedil;&otilde;es devem ser aplicadas fisicamente nos componentes das instala&ccedil;&otilde;es; (210.036-3/I-1)<br /><span style="font-weight: bold">d)</span> recomenda&ccedil;&otilde;es de restri&ccedil;&otilde;es e advert&ecirc;ncias quanto ao acesso de pessoas aos componentes das instala&ccedil;&otilde;es; (210.037-1/I-1)<br /><span style="font-weight: bold">e)</span> precau&ccedil;&otilde;es aplic&aacute;veis em face das influ&ecirc;ncias externas; (210.038-0/I-1)</div><div style="margin-left: 40px"><span style="font-weight: bold">f) </span>o princ&iacute;pio funcional dos dispositivos de prote&ccedil;&atilde;o, constantes do projeto, destinados &agrave; seguran&ccedil;a das pessoas; (210.039-8/I-1)</div><div style="margin-left: 40px"><span style="font-weight: bold">g)</span> descri&ccedil;&atilde;o da compatibilidade dos dispositivos de prote&ccedil;&atilde;o com a instala&ccedil;&atilde;o el&eacute;trica. (210.040-1/I-1)</div><p><span style="font-weight: bold">10.3.10</span> Os projetos devem assegurar que as instala&ccedil;&otilde;es proporcionem aos trabalhadores ilumina&ccedil;&atilde;o adequada e uma posi&ccedil;&atilde;o de trabalho segura, de acordo<br />com a NR 17 &ndash; Ergonomia. (210.041-0/I=2)</p><p><br /><span style="font-weight: bold">10.4 - SEGURAN&Ccedil;A NA CONSTRU&Ccedil;&Atilde;O, MONTAGEM, OPERA&Ccedil;&Atilde;O E MANUTEN&Ccedil;&Atilde;O</span></p><p><br /><span style="font-weight: bold">10.4.1</span> As instala&ccedil;&otilde;es el&eacute;tricas devem ser constru&iacute;das, montadas, operadas, reformadas, ampliadas, reparadas e inspecionadas de forma a garantir a seguran&ccedil;a e a sa&uacute;de dos trabalhadores e dos usu&aacute;rios, e serem supervisionadas por profissional autorizado, conforme disp&otilde;e esta NR. (210.042-8/I=4)<br /><span style="font-weight: bold">10.4.2</span> Nos trabalhos e nas atividades referidas devem ser adotadas medidas preventivas destinadas ao controle dos riscos adicionais, especialmente quanto a altura, confinamento, campos el&eacute;tricos e magn&eacute;ticos, explosividade, umidade, poeira, fauna e flora e outros agravantes, adotando-se a sinaliza&ccedil;&atilde;o de seguran&ccedil;a. (210.043-6/I=4)<br /><span style="font-weight: bold">10.4.3 </span>Nos locais de trabalho s&oacute; podem ser utilizados equipamentos, dispositivos e ferramentas el&eacute;tricas compat&iacute;veis com a instala&ccedil;&atilde;o el&eacute;trica existente, preservandos e as caracter&iacute;sticas de prote&ccedil;&atilde;o, respeitadas as recomenda&ccedil;&otilde;es do fabricante e as influ&ecirc;ncias externas. (210.044-4/I=3)<br /><span style="font-weight: bold">10.4.3.1</span> Os equipamentos, dispositivos e ferramentas que possuam isolamento el&eacute;trico devem estar adequados &agrave;s tens&otilde;es envolvidas, e serem inspecionados e testados de acordo com as regulamenta&ccedil;&otilde;es existentes ou recomenda&ccedil;&otilde;es dos fabricantes. (210.045-2/I=3)<br /><span style="font-weight: bold">10.4.4 </span>As instala&ccedil;&otilde;es el&eacute;tricas devem ser mantidas em condi&ccedil;&otilde;es seguras de funcionamento e seus sistemas de prote&ccedil;&atilde;o devem ser inspecionados e controlados periodicamente, de acordo com as regulamenta&ccedil;&otilde;es existentes e defini&ccedil;&otilde;es de projetos. (210.046-0/I=3)<br /><span style="font-weight: bold">10.4.4.1 </span>Os locais de servi&ccedil;os el&eacute;tricos, compartimentos e inv&oacute;lucros de equipamentos e instala&ccedil;&otilde;es el&eacute;tricas s&atilde;o exclusivos para essa finalidade, sendo expressamente proibido utiliz&aacute;-los para armazenamento ou guarda de quaisquer objetos. (210.047-9/I=2)<br /><span style="font-weight: bold">10.4.5 </span>Para atividades em instala&ccedil;&otilde;es el&eacute;tricas deve ser garantida ao trabalhador ilumina&ccedil;&atilde;o adequada e uma posi&ccedil;&atilde;o de trabalho segura, de acordo com a NR 17 &ndash; Ergonomia, de forma a permitir que ele disponha dos membros superiores livres para a realiza&ccedil;&atilde;o das tarefas. (210.048-7/I=2)<br /><span style="font-weight: bold">10.4.6</span> Os ensaios e testes el&eacute;tricos laboratoriais e de campo ou comissionamento de instala&ccedil;&otilde;es el&eacute;tricas devem atender &agrave; regulamenta&ccedil;&atilde;o estabelecida nos itens 10.6 e 10.7, e somente podem ser realizados por trabalhadores que atendam &agrave;s condi&ccedil;&otilde;es de qualifica&ccedil;&atilde;o, habilita&ccedil;&atilde;o, capacita&ccedil;&atilde;o e autoriza&ccedil;&atilde;o estabelecidas nesta NR. (210.049-5/I=3)</p><p><br /><span style="font-weight: bold">10.5 - SEGURAN&Ccedil;A EM INSTALA&Ccedil;&Otilde;ES EL&Eacute;TRICAS DESENERGIZADAS</span></p><p><br /><span style="font-weight: bold">10.5.1</span> Somente ser&atilde;o consideradas desenergizadas as instala&ccedil;&otilde;es el&eacute;tricas liberadas para trabalho, mediante os procedimentos apropriados, obedecida a seq&uuml;&ecirc;ncia abaixo:</p><div style="margin-left: 40px"><span style="font-weight: bold">a)</span> seccionamento; (210.050-9/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">b)</span> impedimento de reenergiza&ccedil;&atilde;o; (210.051-7/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">c)</span> constata&ccedil;&atilde;o da aus&ecirc;ncia de tens&atilde;o; (210.052-5/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">d)</span> instala&ccedil;&atilde;o de aterramento tempor&aacute;rio com equipotencializa&ccedil;&atilde;o dos condutores dos circuitos; (210.053-3/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">e)</span> prote&ccedil;&atilde;o dos elementos energizados existentes na zona controlada (Anexo I); (210.054-1/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">f)</span> instala&ccedil;&atilde;o da sinaliza&ccedil;&atilde;o de impedimento de reenergiza&ccedil;&atilde;o. (210.055-0/I=2)<br /></div><p><span style="font-weight: bold">10.5.2</span> O estado de instala&ccedil;&atilde;o desenergizada deve ser mantido at&eacute; a autoriza&ccedil;&atilde;o para reenergiza&ccedil;&atilde;o, devendo ser reenergizada respeitando a seq&uuml;&ecirc;ncia de procedimentos abaixo: (210.056-8/I=3)</p><div style="margin-left: 40px"><span style="font-weight: bold">a)</span> retirada das ferramentas, utens&iacute;lios e equipamentos; (210.057-6/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">b)</span> retirada da zona controlada de todos os trabalhadores n&atilde;o envolvidos no processo de reenergiza&ccedil;&atilde;o; (210.058-4/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">c)</span> remo&ccedil;&atilde;o do aterramento tempor&aacute;rio, da equipotencializa&ccedil;&atilde;o e das prote&ccedil;&otilde;es adicionais; (210.059-2/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">d)</span> remo&ccedil;&atilde;o da sinaliza&ccedil;&atilde;o de impedimento de reenergiza&ccedil;&atilde;o; (210.060-6/I=2)</div><div style="margin-left: 40px"><span style="font-weight: bold">e) </span>destravamento, se houver, e religa&ccedil;&atilde;o dos dispositivos de seccionamento. (210.061-4/I=2)<br /></div><p>10.5.3 As medidas constantes das al&iacute;neas apresentadas nos itens 10.5.1 e 10.5.2<br />podem ser alteradas, substitu&iacute;das, ampliadas ou eliminadas, em fun&ccedil;&atilde;o das<br />peculiaridades de cada situa&ccedil;&atilde;o, por profissional legalmente habilitado, autorizado e<br />mediante justificativa t&eacute;cnica previamente formalizada, desde que seja mantido o<br />mesmo n&iacute;vel de seguran&ccedil;a originalmente preconizado.<br />10.5.4 Os servi&ccedil;os a serem executados em instala&ccedil;&otilde;es el&eacute;tricas desligadas, mas<br />com possibilidade de energiza&ccedil;&atilde;o, por qualquer meio ou raz&atilde;o, devem atender ao<br />que estabelece o disposto no item 10.6. (210.062-2/I=3)<br />10.6 - SEGURAN&Ccedil;A EM INSTALA&Ccedil;&Otilde;ES EL&Eacute;TRICAS ENERGIZADAS<br />10.6.1 As interven&ccedil;&otilde;es em instala&ccedil;&otilde;es el&eacute;tricas com tens&atilde;o igual ou superior a 50<br />Volts em corrente alternada ou superior a 120 Volts em corrente cont&iacute;nua somente<br />podem ser realizadas por trabalhadores que atendam ao que estabelece o item 10.8<br />desta Norma. (210.063-0/I=4)<br />10.6.1.1 Os trabalhadores de que trata o item anterior devem receber<br />treinamento de seguran&ccedil;a para trabalhos com instala&ccedil;&otilde;es el&eacute;tricas energizadas, com<br />7<br />curr&iacute;culo m&iacute;nimo, carga hor&aacute;ria e demais determina&ccedil;&otilde;es estabelecidas no Anexo II<br />desta NR. (210.064-9/I=4)<br />10.6.1.2 As opera&ccedil;&otilde;es elementares como ligar e desligar circuitos el&eacute;tricos,<br />realizadas em baixa tens&atilde;o, com materiais e equipamentos el&eacute;tricos em perfeito<br />estado de conserva&ccedil;&atilde;o, adequados para opera&ccedil;&atilde;o, podem ser realizadas por<br />qualquer pessoa n&atilde;o advertida.<br />10.6.2 Os trabalhos que exigem o ingresso na zona controlada devem ser<br />realizados mediante procedimentos espec&iacute;ficos respeitando as dist&acirc;ncias previstas<br />no Anexo I. (210.065-7/I=3)<br />10.6.3 Os servi&ccedil;os em instala&ccedil;&otilde;es energizadas, ou em suas proximidades devem<br />ser suspensos de imediato na imin&ecirc;ncia de ocorr&ecirc;ncia que possa colocar os<br />trabalhadores em perigo. (210.066-5/I=2)<br />10.6.4 Sempre que inova&ccedil;&otilde;es tecnol&oacute;gicas forem implementadas ou para a<br />entrada em opera&ccedil;&otilde;es de novas instala&ccedil;&otilde;es ou equipamentos el&eacute;tricos devem ser<br />previamente elaboradas an&aacute;lises de risco, desenvolvidas com circuitos<br />desenergizados, e respectivos procedimentos de trabalho. (210.067-3/I=3)<br />10.6.5 O respons&aacute;vel pela execu&ccedil;&atilde;o do servi&ccedil;o deve suspender as atividades<br />quando verificar situa&ccedil;&atilde;o ou condi&ccedil;&atilde;o de risco n&atilde;o prevista, cuja elimina&ccedil;&atilde;o ou<br />neutraliza&ccedil;&atilde;o imediata n&atilde;o seja poss&iacute;vel. (210.068-1/I=2)<br />10.7 - TRABALHOS ENVOLVENDO ALTA TENS&Atilde;O (AT)<br />10.7.1 Os trabalhadores que intervenham em instala&ccedil;&otilde;es el&eacute;tricas energizadas<br />com alta tens&atilde;o, que exer&ccedil;am suas atividades dentro dos limites estabelecidos como<br />zonas controladas e de risco, conforme Anexo I, devem atender ao disposto no item<br />10.8 desta NR. (210.069-0/I=4)<br />10.7.2 Os trabalhadores de que trata o item 10.7.1 devem receber treinamento de<br />seguran&ccedil;a, espec&iacute;fico em seguran&ccedil;a no Sistema El&eacute;trico de Pot&ecirc;ncia (SEP) e em suas<br />proximidades, com curr&iacute;culo m&iacute;nimo, carga hor&aacute;ria e demais determina&ccedil;&otilde;es<br />estabelecidas no Anexo II desta NR. (210.070-3/I=4)<br />10.7.3 Os servi&ccedil;os em instala&ccedil;&otilde;es el&eacute;tricas energizadas em AT, bem como<br />aqueles executados no Sistema El&eacute;trico de Pot&ecirc;ncia &ndash; SEP, n&atilde;o podem ser realizados<br />individualmente. (210.071-1/I=4)<br />10.7.4 Todo trabalho em instala&ccedil;&otilde;es el&eacute;tricas energizadas em AT, bem como<br />aquelas que interajam com o SEP, somente pode ser realizado mediante ordem de<br />8<br />servi&ccedil;o espec&iacute;fica para data e local, assinada por superior respons&aacute;vel pela &aacute;rea.<br />(210.072-0/I=2)<br />10.7.5 Antes de iniciar trabalhos em circuitos energizados em AT, o superior<br />imediato e a equipe, respons&aacute;veis pela execu&ccedil;&atilde;o do servi&ccedil;o, devem realizar uma<br />avalia&ccedil;&atilde;o pr&eacute;via, estudar e planejar as atividades e a&ccedil;&otilde;es a serem desenvolvidas de<br />forma a atender os princ&iacute;pios t&eacute;cnicos b&aacute;sicos e as melhores t&eacute;cnicas de seguran&ccedil;a<br />em eletricidade aplic&aacute;veis ao servi&ccedil;o. (210.073-8/I=2)<br />10.7.6 Os servi&ccedil;os em instala&ccedil;&otilde;es el&eacute;tricas energizadas em AT somente podem<br />ser realizados quando houver procedimentos espec&iacute;ficos, detalhados e assinados por<br />profissional autorizado. (210.074-6/I=3)<br />10.7.7 A interven&ccedil;&atilde;o em instala&ccedil;&otilde;es el&eacute;tricas energizadas em AT dentro dos<br />limites estabelecidos como zona de risco, conforme Anexo I desta NR, somente pode<br />ser realizada mediante a desativa&ccedil;&atilde;o, tamb&eacute;m conhecida como bloqueio, dos<br />conjuntos e dispositivos de religamento autom&aacute;tico do circuito, sistema ou<br />equipamento. (210.075-4/I-4)<br />10.7.7.1 Os equipamentos e dispositivos desativados devem ser sinalizados com<br />identifica&ccedil;&atilde;o da condi&ccedil;&atilde;o de desativa&ccedil;&atilde;o, conforme procedimento de trabalho<br />espec&iacute;fico padronizado. (210.076-2/I-4)<br />10.7.8 Os equipamentos, ferramentas e dispositivos isolantes ou equipados com<br />materiais isolantes, destinados ao trabalho em alta tens&atilde;o, devem ser submetidos a<br />testes el&eacute;tricos ou ensaios de laborat&oacute;rio peri&oacute;dicos, obedecendo-se as especifica&ccedil;&otilde;es<br />do fabricante, os procedimentos da empresa e na aus&ecirc;ncia desses, anualmente.<br />(210.077-0/I-4)<br />10.7.9 Todo trabalhador em instala&ccedil;&otilde;es el&eacute;tricas energizadas em AT, bem como<br />aqueles envolvidos em atividades no SEP devem dispor de equipamento que<br />permita a comunica&ccedil;&atilde;o permanente com os demais membros da equipe ou com o<br />centro de opera&ccedil;&atilde;o durante a realiza&ccedil;&atilde;o do servi&ccedil;o. (210.078-9/I-4)<br />10.8 - HABILITA&Ccedil;&Atilde;O, QUALIFICA&Ccedil;&Atilde;O, CAPACITA&Ccedil;&Atilde;O E<br />AUTORIZA&Ccedil;&Atilde;O DOS TRABALHADORES.<br />10.8.1 &Eacute; considerado trabalhador qualificado aquele que comprovar conclus&atilde;o<br />de curso espec&iacute;fico na &aacute;rea el&eacute;trica reconhecido pelo Sistema Oficial de Ensino.<br />10.8.2 &Eacute; considerado profissional legalmente habilitado o trabalhador<br />previamente qualificado e com registro no competente conselho de classe.<br />9<br />10.8.3 &Eacute; considerado trabalhador capacitado aquele que atenda &agrave;s seguintes<br />condi&ccedil;&otilde;es, simultaneamente:<br />a) receba capacita&ccedil;&atilde;o sob orienta&ccedil;&atilde;o e responsabilidade de profissional<br />habilitado e autorizado; e<br />b) trabalhe sob a responsabilidade de profissional habilitado e autorizado.<br />10.8.3.1 A capacita&ccedil;&atilde;o s&oacute; ter&aacute; validade para a empresa que o capacitou e nas<br />condi&ccedil;&otilde;es estabelecidas pelo profissional habilitado e autorizado respons&aacute;vel pela<br />capacita&ccedil;&atilde;o.<br />10.8.4 S&atilde;o considerados autorizados os trabalhadores qualificados ou<br />capacitados e os profissionais habilitados, com anu&ecirc;ncia formal da empresa.<br />10.8.5 A empresa deve estabelecer sistema de identifica&ccedil;&atilde;o que permita a<br />qualquer tempo conhecer a abrang&ecirc;ncia da autoriza&ccedil;&atilde;o de cada trabalhador,<br />conforme o item 10.8.4. (210.079-7/I=1)<br />10.8.6 Os trabalhadores autorizados a trabalhar em instala&ccedil;&otilde;es el&eacute;tricas devem<br />ter essa condi&ccedil;&atilde;o consignada no sistema de registro de empregado da empresa.<br />(210.080-0/I=1)<br />10.8.7 Os trabalhadores autorizados a intervir em instala&ccedil;&otilde;es el&eacute;tricas devem ser<br />submetidos &agrave; exame de sa&uacute;de compat&iacute;vel com as atividades a serem desenvolvidas,<br />realizado em conformidade com a NR 7 e registrado em seu prontu&aacute;rio m&eacute;dico.<br />(210.081-9/I=3)<br />10.8.8 Os trabalhadores autorizados a intervir em instala&ccedil;&otilde;es el&eacute;tricas devem<br />possuir treinamento espec&iacute;fico sobre os riscos decorrentes do emprego da energia<br />el&eacute;trica e as principais medidas de preven&ccedil;&atilde;o de acidentes em instala&ccedil;&otilde;es el&eacute;tricas,<br />de acordo com o estabelecido no Anexo II desta NR. (210.082-7/I=4)<br />10.8.8.1 A empresa conceder&aacute; autoriza&ccedil;&atilde;o na forma desta NR aos trabalhadores<br />capacitados ou qualificados e aos profissionais habilitados que tenham participado<br />com avalia&ccedil;&atilde;o e aproveitamento satisfat&oacute;rios dos cursos constantes do ANEXO II<br />desta NR. (210.083-5/I=4)<br />10.8.8.2 Deve ser realizado um treinamento de reciclagem bienal e sempre que<br />ocorrer alguma das situa&ccedil;&otilde;es a seguir: (210.084-3/I=2)<br />a) troca de fun&ccedil;&atilde;o ou mudan&ccedil;a de empresa; (210.085-1/I=2)<br />b) retorno de afastamento ao trabalho ou inatividade, por per&iacute;odo superior a tr&ecirc;s<br />meses; (210.086-0/I=2)<br />c) modifica&ccedil;&otilde;es significativas nas instala&ccedil;&otilde;es el&eacute;tricas ou troca de m&eacute;todos,<br />processos e organiza&ccedil;&atilde;o do trabalho. (210.087-8/I=2)<br />10<br />10.8.8.3 A carga hor&aacute;ria e o conte&uacute;do program&aacute;tico dos treinamentos de<br />reciclagem destinados ao atendimento das al&iacute;neas &ldquo;a&rdquo;, &ldquo;b&rdquo; e &ldquo;c&rdquo; do item 10.8.8.2<br />devem atender as necessidades da situa&ccedil;&atilde;o que o motivou. (210.088-6/I=1)<br />10.8.8.4 Os trabalhos em &aacute;reas classificadas devem ser precedidos de<br />treinamento especifico de acordo com risco envolvido. (210.089-4/I=3)<br />10.8.9 Os trabalhadores com atividades n&atilde;o relacionadas &agrave;s instala&ccedil;&otilde;es el&eacute;tricas<br />desenvolvidas em zona livre e na vizinhan&ccedil;a da zona controlada, conforme define<br />esta NR, devem ser instru&iacute;dos formalmente com conhecimentos que permitam<br />identificar e avaliar seus poss&iacute;veis riscos e adotar as precau&ccedil;&otilde;es cab&iacute;veis. (210.090-<br />8/I=2)<br />10.9 - PROTE&Ccedil;&Atilde;O CONTRA INC&Ecirc;NDIO E EXPLOS&Atilde;O<br />10.9.1 As &aacute;reas onde houver instala&ccedil;&otilde;es ou equipamentos el&eacute;tricos devem ser<br />dotadas de prote&ccedil;&atilde;o contra inc&ecirc;ndio e explos&atilde;o, conforme disp&otilde;e a NR 23 &ndash; Prote&ccedil;&atilde;o<br />Contra Inc&ecirc;ndios. (210.091-6/I=3)<br />10.9.2 Os materiais, pe&ccedil;as, dispositivos, equipamentos e sistemas destinados &agrave;<br />aplica&ccedil;&atilde;o em instala&ccedil;&otilde;es el&eacute;tricas de ambientes com atmosferas potencialmente<br />explosivas devem ser avaliados quanto &agrave; sua conformidade, no &acirc;mbito do Sistema<br />Brasileiro de Certifica&ccedil;&atilde;o. (210.092-4/I=2)<br />10.9.3 Os processos ou equipamentos suscept&iacute;veis de gerar ou acumular<br />eletricidade est&aacute;tica devem dispor de prote&ccedil;&atilde;o espec&iacute;fica e dispositivos de descarga<br />el&eacute;trica. (210.093-2/I=2)<br />10.9.4 Nas instala&ccedil;&otilde;es el&eacute;tricas de &aacute;reas classificadas ou sujeitas a risco<br />acentuado de inc&ecirc;ndio ou explos&otilde;es, devem ser adotados dispositivos de prote&ccedil;&atilde;o,<br />como alarme e seccionamento autom&aacute;tico para prevenir sobretens&otilde;es,<br />sobrecorrentes, falhas de isolamento, aquecimentos ou outras condi&ccedil;&otilde;es anormais de<br />opera&ccedil;&atilde;o. (210.094-0/I=3)<br />10.9.5 Os servi&ccedil;os em instala&ccedil;&otilde;es el&eacute;tricas nas &aacute;reas classificadas somente<br />poder&atilde;o ser realizados mediante permiss&atilde;o para o trabalho com libera&ccedil;&atilde;o<br />formalizada, conforme estabelece o item 10.5 ou supress&atilde;o do agente de risco que<br />determina a classifica&ccedil;&atilde;o da &aacute;rea. (210.095-9/I=4)<br />10.10 - SINALIZA&Ccedil;&Atilde;O DE SEGURAN&Ccedil;A<br />10.10.1 Nas instala&ccedil;&otilde;es e servi&ccedil;os em eletricidade deve ser adotada sinaliza&ccedil;&atilde;o<br />adequada de seguran&ccedil;a, destinada &agrave; advert&ecirc;ncia e &agrave; identifica&ccedil;&atilde;o, obedecendo ao<br />11<br />disposto na NR-26 &ndash; Sinaliza&ccedil;&atilde;o de Seguran&ccedil;a, de forma a atender, dentre outras, as<br />situa&ccedil;&otilde;es a seguir: (210.096-7/I=3)<br />a) identifica&ccedil;&atilde;o de circuitos el&eacute;tricos; (210.097-5/I=2)<br />b) travamentos e bloqueios de dispositivos e sistemas de manobra e comandos;<br />(210.098-3/I=2)<br />c) restri&ccedil;&otilde;es e impedimentos de acesso; (210.099-1/I=2)<br />d) delimita&ccedil;&otilde;es de &aacute;reas; (210.100-9/I=2)<br />e) sinaliza&ccedil;&atilde;o de &aacute;reas de circula&ccedil;&atilde;o, de vias p&uacute;blicas, de ve&iacute;culos e de<br />movimenta&ccedil;&atilde;o de cargas; (210.101-7/I=2)<br />f) sinaliza&ccedil;&atilde;o de impedimento de energiza&ccedil;&atilde;o; (210.102-5/I=2)<br />g) identifica&ccedil;&atilde;o de equipamento ou circuito impedido. (210.103-3/I=2)<br />10.11 - PROCEDIMENTOS DE TRABALHO<br />10.11.1 Os servi&ccedil;os em instala&ccedil;&otilde;es el&eacute;tricas devem ser planejados e realizados<br />em conformidade com procedimentos de trabalho espec&iacute;ficos, padronizados, com<br />descri&ccedil;&atilde;o detalhada de cada tarefa, passo a passo, assinados por profissional que<br />atenda ao que estabelece o item 10.8 desta NR. (210.104-1/I=3)<br />10.11.2 Os servi&ccedil;os em instala&ccedil;&otilde;es el&eacute;tricas devem ser precedidos de ordens de<br />servi&ccedil;o especificas, aprovadas por trabalhador autorizado, contendo, no m&iacute;nimo, o<br />tipo, a data, o local e as refer&ecirc;ncias aos procedimentos de trabalho a serem adotados.<br />(210.105-0/I=2)<br />10.11.3 Os procedimentos de trabalho devem conter, no m&iacute;nimo, objetivo,<br />campo de aplica&ccedil;&atilde;o, base t&eacute;cnica, compet&ecirc;ncias e responsabilidades, disposi&ccedil;&otilde;es<br />gerais, medidas de controle e orienta&ccedil;&otilde;es finais. (210.106-8/I=2)<br />10.11.4 Os procedimentos de trabalho, o treinamento de seguran&ccedil;a e sa&uacute;de e a<br />autoriza&ccedil;&atilde;o de que trata o item 10.8 devem ter a participa&ccedil;&atilde;o em todo processo de<br />desenvolvimento do Servi&ccedil;o Especializado de Engenharia de Seguran&ccedil;a e Medicina<br />do Trabalho - SESMT, quando houver. (210.107-6/I=2)<br />10.11.5 A autoriza&ccedil;&atilde;o referida no item 10.8 deve estar em conformidade com o<br />treinamento ministrado, previsto no Anexo II desta NR. (210.108-4/I=3)<br />10.11.6 Toda equipe dever&aacute; ter um de seus trabalhadores indicado e em<br />condi&ccedil;&otilde;es de exercer a supervis&atilde;o e condu&ccedil;&atilde;o dos trabalhos. (210.109-2/I=2)<br />10.11.7 Antes de iniciar trabalhos em equipe os seus membros, em conjunto com<br />o respons&aacute;vel pela execu&ccedil;&atilde;o do servi&ccedil;o, devem realizar uma avalia&ccedil;&atilde;o pr&eacute;via,<br />estudar e planejar as atividades e a&ccedil;&otilde;es a serem desenvolvidas no local, de forma a<br />atender os princ&iacute;pios t&eacute;cnicos b&aacute;sicos e as melhores t&eacute;cnicas de seguran&ccedil;a aplic&aacute;veis<br />ao servi&ccedil;o. (210.110-6/I=2)<br />12<br />10.11.8 A altern&acirc;ncia de atividades deve considerar a an&aacute;lise de riscos das<br />tarefas e a compet&ecirc;ncia dos trabalhadores envolvidos, de forma a garantir a<br />seguran&ccedil;a e a sa&uacute;de no trabalho. (210.111-4/I=2)<br />10.12 - SITUA&Ccedil;&Atilde;O DE EMERG&Ecirc;NCIA<br />10.12.1 As a&ccedil;&otilde;es de emerg&ecirc;ncia que envolvam as instala&ccedil;&otilde;es ou servi&ccedil;os com<br />eletricidade devem constar do plano de emerg&ecirc;ncia da empresa. (210.112-2/I=3)<br />10.12.2 Os trabalhadores autorizados devem estar aptos a executar o resgate e<br />prestar primeiros socorros a acidentados, especialmente por meio de reanima&ccedil;&atilde;o<br />cardio-respirat&oacute;ria. (210.113-0/I=3)<br />10.12.3 A empresa deve possuir m&eacute;todos de resgate padronizados e adequados<br />&agrave;s suas atividades, disponibilizando os meios para a sua aplica&ccedil;&atilde;o. (210.114-9/I=3)<br />10.12.4 Os trabalhadores autorizados devem estar aptos a manusear e operar<br />equipamentos de preven&ccedil;&atilde;o e combate a inc&ecirc;ndio existentes nas instala&ccedil;&otilde;es<br />el&eacute;tricas. (210.115-7/I=3)<br />10.13 - RESPONSABILIDADES<br />10.13.1 As responsabilidades quanto ao cumprimento desta NR s&atilde;o solid&aacute;rias<br />aos contratantes e contratados envolvidos.<br />10.13.2 &Eacute; de responsabilidade dos contratantes manter os trabalhadores<br />informados sobre os riscos a que est&atilde;o expostos, instruindo-os quanto aos<br />procedimentos e medidas de controle contra os riscos el&eacute;tricos a serem adotados.<br />(210.116-5/I=3)<br />10.13.3 Cabe &agrave; empresa, na ocorr&ecirc;ncia de acidentes de trabalho envolvendo<br />instala&ccedil;&otilde;es e servi&ccedil;os em eletricidade, propor e adotar medidas preventivas e<br />corretivas. (210.117-3/I=4)<br />10.13.4 Cabe aos trabalhadores:<br />a) zelar pela sua seguran&ccedil;a e sa&uacute;de e a de outras pessoas que possam ser<br />afetadas por suas a&ccedil;&otilde;es ou omiss&otilde;es no trabalho;<br />b) responsabilizar-se junto com a empresa pelo cumprimento das disposi&ccedil;&otilde;es<br />legais e regulamentares, inclusive quanto aos procedimentos internos de seguran&ccedil;a<br />e sa&uacute;de; e<br />c) comunicar, de imediato, ao respons&aacute;vel pela execu&ccedil;&atilde;o do servi&ccedil;o as situa&ccedil;&otilde;es<br />que considerar de risco para sua seguran&ccedil;a e sa&uacute;de e a de outras pessoas.<br />13<br />10.14 - DISPOSI&Ccedil;&Otilde;ES FINAIS<br />10.14.1 Os trabalhadores devem interromper suas tarefas exercendo o direito de<br />recusa, sempre que constatarem evid&ecirc;ncias de riscos graves e iminentes para sua<br />seguran&ccedil;a e sa&uacute;de ou a de outras pessoas, comunicando imediatamente o fato a seu<br />superior hier&aacute;rquico, que diligenciar&aacute; as medidas cab&iacute;veis. (210.118-1/I=4)<br />10.14.2 As empresas devem promover a&ccedil;&otilde;es de controle de riscos originados por<br />outrem em suas instala&ccedil;&otilde;es el&eacute;tricas e oferecer, de imediato, quando cab&iacute;vel,<br />den&uacute;ncia aos &oacute;rg&atilde;os competentes. (210.119-0/I=2)<br />10.14.3 Na ocorr&ecirc;ncia do n&atilde;o cumprimento das normas constantes nesta NR, o<br />MTE adotar&aacute; as provid&ecirc;ncias estabelecidas na NR 3.<br />10.14.4 A documenta&ccedil;&atilde;o prevista nesta NR deve estar permanentemente &agrave;<br />disposi&ccedil;&atilde;o dos trabalhadores que atuam em servi&ccedil;os e instala&ccedil;&otilde;es el&eacute;tricas,<br />respeitadas as abrang&ecirc;ncias, limita&ccedil;&otilde;es e interfer&ecirc;ncias nas tarefas. (210.120-3/I=2)<br />10.14.5 A documenta&ccedil;&atilde;o prevista nesta NR deve estar, permanentemente, &agrave;<br />disposi&ccedil;&atilde;o das autoridades competentes. (210.121-1/I=2)<br />10.14.6 Esta NR n&atilde;o &eacute; aplic&aacute;vel a instala&ccedil;&otilde;es el&eacute;tricas alimentadas por extrabaixa<br />tens&atilde;o.<br />GLOSS&Aacute;RIO<br />1. Alta Tens&atilde;o (AT): tens&atilde;o superior a 1000 volts em corrente alternada ou 1500<br />volts em corrente cont&iacute;nua, entre fases ou entre fase e terra.<br />2. &Aacute;rea Classificada: local com potencialidade de ocorr&ecirc;ncia de atmosfera explosiva.<br />3. Aterramento El&eacute;trico Tempor&aacute;rio: liga&ccedil;&atilde;o el&eacute;trica efetiva confi&aacute;vel e adequada<br />intencional &agrave; terra, destinada a garantir a equipotencialidade e mantida<br />continuamente durante a interven&ccedil;&atilde;o na instala&ccedil;&atilde;o el&eacute;trica.<br />4. Atmosfera Explosiva: mistura com o ar, sob condi&ccedil;&otilde;es atmosf&eacute;ricas, de<br />subst&acirc;ncias inflam&aacute;veis na forma de g&aacute;s, vapor, n&eacute;voa, poeira ou fibras, na qual<br />ap&oacute;s a igni&ccedil;&atilde;o a combust&atilde;o se propaga.<br />5. Baixa Tens&atilde;o (BT): tens&atilde;o superior a 50 volts em corrente alternada ou 120 volts<br />em corrente cont&iacute;nua e igual ou inferior a 1000 volts em corrente alternada ou 1500<br />volts em corrente cont&iacute;nua, entre fases ou entre fase e terra.<br />14<br />6. Barreira: dispositivo que impede qualquer contato com partes energizadas das<br />instala&ccedil;&otilde;es el&eacute;tricas.<br />7. Direito de Recusa: instrumento que assegura ao trabalhador a interrup&ccedil;&atilde;o de<br />uma atividade de trabalho por considerar que ela envolve grave e iminente risco<br />para sua seguran&ccedil;a e sa&uacute;de ou de outras pessoas.<br />8. Equipamento de Prote&ccedil;&atilde;o Coletiva (EPC): dispositivo, sistema, ou meio, fixo ou<br />m&oacute;vel de abrang&ecirc;ncia coletiva, destinado a preservar a integridade f&iacute;sica e a sa&uacute;de<br />dos trabalhadores, usu&aacute;rios e terceiros.<br />9. Equipamento Segregado: equipamento tornado inacess&iacute;vel por meio de inv&oacute;lucro<br />ou barreira.<br />10. Extra-Baixa Tens&atilde;o (EBT): tens&atilde;o n&atilde;o superior a 50 volts em corrente alternada<br />ou 120 volts em corrente cont&iacute;nua, entre fases ou entre fase e terra.<br />11. Influ&ecirc;ncias Externas: vari&aacute;veis que devem ser consideradas na defini&ccedil;&atilde;o e<br />sele&ccedil;&atilde;o de medidas de prote&ccedil;&atilde;o para seguran&ccedil;a das pessoas e desempenho dos<br />componentes da instala&ccedil;&atilde;o.<br />12. Instala&ccedil;&atilde;o El&eacute;trica: conjunto das partes el&eacute;tricas e n&atilde;o el&eacute;tricas associadas e com<br />caracter&iacute;sticas coordenadas entre si, que s&atilde;o necess&aacute;rias ao funcionamento de uma<br />parte determinada de um sistema el&eacute;trico.<br />13. Instala&ccedil;&atilde;o Liberada para Servi&ccedil;os (BT/AT): aquela que garanta as condi&ccedil;&otilde;es de<br />seguran&ccedil;a ao trabalhador por meio de procedimentos e equipamentos adequados<br />desde o in&iacute;cio at&eacute; o final dos trabalhos e libera&ccedil;&atilde;o para uso.<br />14. Impedimento de Reenergiza&ccedil;&atilde;o: condi&ccedil;&atilde;o que garante a n&atilde;o energiza&ccedil;&atilde;o do<br />circuito atrav&eacute;s de recursos e procedimentos apropriados, sob controle dos<br />trabalhadores envolvidos nos servi&ccedil;os.<br />15. Inv&oacute;lucro: envolt&oacute;rio de partes energizadas destinado a impedir qualquer<br />contato com partes internas.<br />16. Isolamento El&eacute;trico: processo destinado a impedir a passagem de corrente<br />el&eacute;trica, por interposi&ccedil;&atilde;o de materiais isolantes.<br />17. Obst&aacute;culo: elemento que impede o contato acidental, mas n&atilde;o impede o contato<br />direto por a&ccedil;&atilde;o deliberada.<br />18. Perigo: situa&ccedil;&atilde;o ou condi&ccedil;&atilde;o de risco com probabilidade de causar les&atilde;o f&iacute;sica ou<br />dano &agrave; sa&uacute;de das pessoas por aus&ecirc;ncia de medidas de controle.<br />15<br />19. Pessoa Advertida: pessoa informada ou com conhecimento suficiente para evitar<br />os perigos da eletricidade.<br />20. Procedimento: seq&uuml;&ecirc;ncia de opera&ccedil;&otilde;es a serem desenvolvidas para realiza&ccedil;&atilde;o de<br />um determinado trabalho, com a inclus&atilde;o dos meios materiais e humanos, medidas<br />de seguran&ccedil;a e circunst&acirc;ncias que impossibilitem sua realiza&ccedil;&atilde;o.<br />21. Prontu&aacute;rio: sistema organizado de forma a conter uma mem&oacute;ria din&acirc;mica de<br />informa&ccedil;&otilde;es pertinentes &agrave;s instala&ccedil;&otilde;es e aos trabalhadores.<br />22. Risco: capacidade de uma grandeza com potencial para causar les&otilde;es ou danos &agrave;<br />sa&uacute;de das pessoas.<br />23. Riscos Adicionais: todos os demais grupos ou fatores de risco, al&eacute;m dos<br />el&eacute;tricos, espec&iacute;ficos de cada ambiente ou processos de Trabalho que, direta ou<br />indiretamente, possam afetar a seguran&ccedil;a e a sa&uacute;de no trabalho.<br />24. Sinaliza&ccedil;&atilde;o: procedimento padronizado destinado a orientar, alertar, avisar e<br />advertir.<br />25. Sistema El&eacute;trico: circuito ou circuitos el&eacute;tricos inter-relacionados destinados a<br />atingir um determinado objetivo.<br />26. Sistema El&eacute;trico de Pot&ecirc;ncia (SEP): conjunto das instala&ccedil;&otilde;es e equipamentos<br />destinados &agrave; gera&ccedil;&atilde;o, transmiss&atilde;o e distribui&ccedil;&atilde;o de energia el&eacute;trica at&eacute; a medi&ccedil;&atilde;o,<br />inclusive.<br />27. Tens&atilde;o de Seguran&ccedil;a: extra baixa tens&atilde;o originada em uma fonte de seguran&ccedil;a.<br />28. Trabalho em Proximidade: trabalho durante o qual o trabalhador pode entrar na<br />zona controlada, ainda que seja com uma parte do seu corpo ou com extens&otilde;es<br />condutoras, representadas por materiais, ferramentas ou equipamentos que<br />manipule.<br />29. Travamento: a&ccedil;&atilde;o destinada a manter, por meios mec&acirc;nicos, um dispositivo de<br />manobra fixo numa determinada posi&ccedil;&atilde;o, de forma a impedir uma opera&ccedil;&atilde;o n&atilde;o<br />autorizada.<br />30. Zona de Risco: entorno de parte condutora energizada, n&atilde;o segregada, acess&iacute;vel<br />inclusive acidentalmente, de dimens&otilde;es estabelecidas de acordo com o n&iacute;vel de<br />tens&atilde;o, cuja aproxima&ccedil;&atilde;o s&oacute; &eacute; permitida a profissionais autorizados e com a ado&ccedil;&atilde;o<br />de t&eacute;cnicas e instrumentos apropriados de trabalho.<br />16<br />31. Zona Controlada: entorno de parte condutora energizada, n&atilde;o segregada,<br />acess&iacute;vel, de dimens&otilde;es estabelecidas de acordo com o n&iacute;vel de tens&atilde;o, cuja<br />aproxima&ccedil;&atilde;o s&oacute; &eacute; permitida a profissionais autorizados.<br />17<br />ANEXO II<br />ZONA DE RISCO E ZONA CONTROLADA<br />Tabela de raios de delimita&ccedil;&atilde;o de zonas de risco, controlada e livre.<br />Faixa de<br />tens&atilde;o<br />Nominal da<br />instala&ccedil;&atilde;o<br />el&eacute;trica em<br />kV<br />Rr - Raio de<br />delimita&ccedil;&atilde;o<br />entre zona<br />de risco e<br />controlada<br />em metros<br />Rc - Raio de<br />delimita&ccedil;&atilde;o<br />entre zona<br />controlada e<br />livre em<br />metros<br />&lt;1 0,20 0,70<br />&sup3;1 e &lt;3 0,22 1,22<br />&sup3;3 e &lt;6 0,25 1,25<br />&sup3;6 e &lt;10 0,35 1,35<br />&sup3;10 e &lt;15 0,38 1,38<br />&sup3;15 e &lt;20 0,40 1,40<br />&sup3;20 e &lt;30 0,56 1,56<br />&sup3;30 e &lt;36 0,58 1,58<br />&sup3;36 e &lt;45 0,63 1,63<br />&sup3;45 e &lt;60 0,83 1,83<br />&sup3;60 e &lt;70 0,90 1,90<br />&sup3;70 e &lt;110 1,00 2,00<br />&sup3;110 e &lt;132 1,10 3,10<br />&sup3;132 e &lt;150 1,20 3,20<br />&sup3;150 e &lt;220 1,60 3,60<br />&sup3;220 e &lt;275 1,80 3,80<br />&sup3;275 e &lt;380 2,50 4,50<br />&sup3;380 e &lt;480 3,20 5,20<br />&sup3;480 e &lt;700 5,20 7,20<br />18<br />Figura 1 - Dist&acirc;ncias no ar que delimitam radialmente as zonas de risco, controlada e<br />livre<br />Figura 2 - Dist&acirc;ncias no ar que delimitam radialmente as zonas de risco, controlada e<br />livre, com interposi&ccedil;&atilde;o de superf&iacute;cie de separa&ccedil;&atilde;o f&iacute;sica adequada.<br />ZL = Zona livre<br />ZC = Zona controlada, restrita a trabalhadores autorizados.<br />ZR = Zona de risco, restrita a trabalhadores autorizados e com a ado&ccedil;&atilde;o de t&eacute;cnicas,<br />instrumentos e equipamentos apropriados ao trabalho.<br />PE = Ponto da instala&ccedil;&atilde;o energizado.<br />SI = Superf&iacute;cie isolante constru&iacute;da com material resistente e dotada de todos<br />dispositivos de seguran&ccedil;a.<br />ANEXO III<br />Rr<br />Rc ZCP<br />ZR<br />PE<br />ZL<br />Rr<br />ZC<br />Rc<br />ZR<br />PE<br />ZL<br />ZL<br />SI<br />19<br />TREINAMENTO<br />1. CURSO B&Aacute;SICO &ndash; SEGURAN&Ccedil;A EM INSTALA&Ccedil;&Otilde;ES E SERVI&Ccedil;OS COM<br />ELETRICIDADE<br />I - Para os trabalhadores autorizados: carga hor&aacute;ria m&iacute;nima &ndash; 40h:<br />Programa&ccedil;&atilde;o M&iacute;nima:<br />1. introdu&ccedil;&atilde;o &agrave; seguran&ccedil;a com eletricidade.<br />2. riscos em instala&ccedil;&otilde;es e servi&ccedil;os com eletricidade:<br />a) o choque el&eacute;trico, mecanismos e efeitos;<br />b) arcos el&eacute;tricos; queimaduras e quedas;<br />c) campos eletromagn&eacute;ticos.<br />3. T&eacute;cnicas de An&aacute;lise de Risco.<br />4. Medidas de Controle do Risco El&eacute;trico:<br />a) desenergiza&ccedil;&atilde;o.<br />b) aterramento funcional (TN / TT / IT); de prote&ccedil;&atilde;o; tempor&aacute;rio;<br />c) equipotencializa&ccedil;&atilde;o;<br />d) seccionamento autom&aacute;tico da alimenta&ccedil;&atilde;o;<br />e) dispositivos a corrente de fuga;<br />f) extra baixa tens&atilde;o;<br />g) barreiras e inv&oacute;lucros;<br />h) bloqueios e impedimentos;<br />i) obst&aacute;culos e anteparos;<br />j) isolamento das partes vivas;<br />k) isola&ccedil;&atilde;o dupla ou refor&ccedil;ada;<br />l) coloca&ccedil;&atilde;o fora de alcance;<br />m) separa&ccedil;&atilde;o el&eacute;trica.<br />5. Normas T&eacute;cnicas Brasileiras &ndash; NBR da ABNT: NBR-5410, NBR 14039 e outras;<br />6) Regulamenta&ccedil;&otilde;es do MTE:<br />a) NRs;<br />b) NR-10 (Seguran&ccedil;a em Instala&ccedil;&otilde;es e Servi&ccedil;os com Eletricidade);<br />c) qualifica&ccedil;&atilde;o; habilita&ccedil;&atilde;o; capacita&ccedil;&atilde;o e autoriza&ccedil;&atilde;o.<br />7. Equipamentos de prote&ccedil;&atilde;o coletiva.<br />8. Equipamentos de prote&ccedil;&atilde;o individual.<br />9. Rotinas de trabalho &ndash; Procedimentos.<br />20<br />a) instala&ccedil;&otilde;es desenergizadas;<br />b) libera&ccedil;&atilde;o para servi&ccedil;os;<br />c) sinaliza&ccedil;&atilde;o;<br />d) inspe&ccedil;&otilde;es de &aacute;reas, servi&ccedil;os, ferramental e equipamento;<br />10. Documenta&ccedil;&atilde;o de instala&ccedil;&otilde;es el&eacute;tricas.<br />11. Riscos adicionais:<br />a) altura;<br />b) ambientes confinados;<br />c) &aacute;reas classificadas;<br />d) umidade;<br />e) condi&ccedil;&otilde;es atmosf&eacute;ricas.<br />12. Prote&ccedil;&atilde;o e combate a inc&ecirc;ndios:<br />a) no&ccedil;&otilde;es b&aacute;sicas;<br />b) medidas preventivas;<br />c) m&eacute;todos de extin&ccedil;&atilde;o;<br />d) pr&aacute;tica;<br />13. Acidentes de origem el&eacute;trica:<br />a) causas diretas e indiretas;<br />b) discuss&atilde;o de casos;<br />14. Primeiros socorros:<br />a) no&ccedil;&otilde;es sobre les&otilde;es;<br />b) prioriza&ccedil;&atilde;o do atendimento;<br />c) aplica&ccedil;&atilde;o de respira&ccedil;&atilde;o artificial;<br />d) massagem card&iacute;aca;<br />e) t&eacute;cnicas para remo&ccedil;&atilde;o e transporte de acidentados;<br />f) pr&aacute;ticas.<br />15. Responsabilidades.<br />2. CURSO COMPLEMENTAR &ndash; SEGURAN&Ccedil;A NO SISTEMA EL&Eacute;TRICO DE<br />POT&Ecirc;NCIA (SEP) E EM SUAS PROXIMIDADES.<br />&Eacute; pr&eacute;-requisito para freq&uuml;entar este curso complementar, ter participado, com<br />aproveitamento satisfat&oacute;rio, do curso b&aacute;sico definido anteriormente.<br />Carga hor&aacute;ria m&iacute;nima &ndash; 40h<br />(*) Estes t&oacute;picos dever&atilde;o ser desenvolvidos e dirigidos especificamente para as<br />condi&ccedil;&otilde;es de trabalho caracter&iacute;sticas de cada ramo, padr&atilde;o de opera&ccedil;&atilde;o, de n&iacute;vel de<br />21<br />tens&atilde;o e de outras peculiaridades espec&iacute;ficas ao tipo ou condi&ccedil;&atilde;o especial de<br />atividade, sendo obedecida a hierarquia no aperfei&ccedil;oamento t&eacute;cnico do trabalhador.<br />I - Programa&ccedil;&atilde;o M&iacute;nima:<br />1. Organiza&ccedil;&atilde;o do Sistema El&eacute;trico de Potencia &ndash; SEP.<br />2. Organiza&ccedil;&atilde;o do trabalho:<br />a) programa&ccedil;&atilde;o e planejamento dos servi&ccedil;os;<br />b) trabalho em equipe;<br />c) prontu&aacute;rio e cadastro das instala&ccedil;&otilde;es;<br />d) m&eacute;todos de trabalho; e<br />e) comunica&ccedil;&atilde;o.<br />3. Aspectos comportamentais.<br />4. Condi&ccedil;&otilde;es impeditivas para servi&ccedil;os.<br />5. Riscos t&iacute;picos no SEP e sua preven&ccedil;&atilde;o (*):<br />a) proximidade e contatos com partes energizadas;<br />b) indu&ccedil;&atilde;o;<br />c) descargas atmosf&eacute;ricas;<br />d) est&aacute;tica;<br />e) campos el&eacute;tricos e magn&eacute;ticos;<br />f) comunica&ccedil;&atilde;o e identifica&ccedil;&atilde;o; e<br />g) trabalhos em altura, m&aacute;quinas e equipamentos especiais.<br />6. T&eacute;cnicas de an&aacute;lise de Risco no S E P (*)<br />7. Procedimentos de trabalho &ndash; an&aacute;lise e discuss&atilde;o. (*)<br />8. T&eacute;cnicas de trabalho sob tens&atilde;o: (*)<br />a) em linha viva;<br />b) ao potencial;<br />c) em &aacute;reas internas;<br />d) trabalho a dist&acirc;ncia;<br />e) trabalhos noturnos; e<br />f) ambientes subterr&acirc;neos.<br />9. Equipamentos e ferramentas de trabalho (escolha, uso, conserva&ccedil;&atilde;o, verifica&ccedil;&atilde;o,<br />ensaios) (*).<br />10. Sistemas de prote&ccedil;&atilde;o coletiva (*).<br />22<br />11. Equipamentos de prote&ccedil;&atilde;o individual (*).<br />12. Posturas e vestu&aacute;rios de trabalho (*).<br />13. Seguran&ccedil;a com ve&iacute;culos e transporte de pessoas, materiais e equipamentos(*).<br />14. Sinaliza&ccedil;&atilde;o e isolamento de &aacute;reas de trabalho(*).<br />15. Libera&ccedil;&atilde;o de instala&ccedil;&atilde;o para servi&ccedil;o e para opera&ccedil;&atilde;o e uso (*).<br />16. Treinamento em t&eacute;cnicas de remo&ccedil;&atilde;o, atendimento, transporte de acidentados<br />(*).<br />17. Acidentes t&iacute;picos (*) &ndash; An&aacute;lise, discuss&atilde;o, medidas de prote&ccedil;&atilde;o.<br />18. Responsabilidades (*).</p>', '', 1, 0, 0, 0, '2008-06-23 09:50:03', 62, '', '2008-06-23 11:57:19', 62, 0, '0000-00-00 00:00:00', '2008-06-23 09:48:48', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 270);
INSERT INTO `jos_content` (`id`, `title`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`) VALUES
(2, 'Home', '', '<div class="eng"><div class="titulo">Cursos da norma NR-10</div><a href="#">Saiba Mais</a></div>\r\n<style type="text/css">\r\ndiv#breadcrumb{\r\n	display: none;\r\n}\r\ndiv#middle{\r\n    height: 600px;\r\n    background-image: url(images/stories/ee.jpg);\r\n    background-size: cover;\r\n}\r\ntable.contentpaneopen {\r\n	margin: 30% auto;\r\n}\r\ndiv.eng {\r\n    background-color: rgba(55,55,55,0.7);\r\n    width: 295px;\r\n    padding: 20px;\r\n}\r\ndiv.titulo {\r\n    font-size: 2em;\r\n    color: white;\r\n    margin-bottom: 16px;\r\n}\r\ndiv.eng a {\r\n    font-weight: bold;\r\n    color: #8ad030;\r\n}\r\n</style>', '', 1, 0, 0, 0, '2017-02-09 22:25:49', 62, '', '2017-02-09 22:50:08', 62, 0, '0000-00-00 00:00:00', '2017-02-09 22:25:14', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=0\nrating=0\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=0', 1, 0, 0, '', '', 0, 33);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_content_frontpage`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `aro_id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`aro_id`),
  UNIQUE KEY `jos_gacl_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`aro_id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'jam nelson da silva david', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  PRIMARY KEY  (`group_id`),
  KEY `parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`group_id`, `parent_id`, `name`, `lft`, `rgt`) VALUES
(17, 0, 'ROOT', 1, 22),
(28, 17, 'USERS', 2, 21),
(29, 28, 'Public Frontend', 3, 12),
(18, 29, 'Registered', 4, 11),
(19, 18, 'Author', 5, 10),
(20, 19, 'Editor', 6, 9),
(21, 20, 'Publisher', 7, 8),
(30, 28, 'Public Backend', 13, 20),
(23, 30, 'Manager', 14, 19),
(24, 23, 'Administrator', 15, 18),
(25, 24, 'Super Administrator', 16, 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `section_id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`section_id`),
  UNIQUE KEY `value_aro_sections` (`value`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `hidden_aro_sections` (`hidden`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`section_id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 11),
(25, '', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Público'),
(1, 'Registrado'),
(2, 'Especial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_mambots`
--

CREATE TABLE IF NOT EXISTS `jos_mambots` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Extraindo dados da tabela `jos_mambots`
--

INSERT INTO `jos_mambots` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'MOS: Imagem', 'mosimage', 'content', 0, -10000, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'MOS: Paginação', 'mospaging', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(3, 'Inclusão de Plugins Antigos', 'legacybots', 'content', 0, 1, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'SEF em Artigos', 'mossef', 'content', 0, 3, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'MOS: Votação', 'mosvote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(6, 'Procurar Conteúdo', 'content.searchbot', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(7, 'Procurar Weblinks', 'weblinks.searchbot', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(8, 'Suporte de Código', 'moscode', 'content', 0, 2, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(9, 'Editor não WYSIWYG', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(10, 'Editor WYSIWYG TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced'),
(11, 'MOS: Botão de Imagem', 'mosimage.btn', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(12, 'MOS: Botão de Quebra de Página', 'mospage.btn', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(13, 'Procurar Contatos', 'contacts.searchbot', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Procurar Categorias', 'categories.searchbot', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(15, 'Procurar Seções', 'sections.searchbot', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Proteção de Email', 'mosemailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(17, 'GeSHi', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(18, 'Procurar Notícias Externas', 'newsfeeds.searchbot', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Posicionador de Módulos', 'mosloadposition', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(25) default NULL,
  `name` varchar(100) default NULL,
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`) VALUES
(1, 'mainmenu', 'Início', 'index.php?option=com_frontpage', 'components', -2, 0, 10, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'leading=1\r\nintro=2\r\nlink=1\r\nimage=1\r\npage_title=0\r\nheader=Welcome to the Frontpage\r\norderby_sec=front\r\nprint=0\r\npdf=0\r\nemail=0\r\nback_button=0'),
(2, 'mainmenu', 'A Norma', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 0, 1, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(3, 'mainmenu', 'Cursos', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 0, 1, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(4, 'mainmenu', 'Orientações', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 3, 1, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(5, 'mainmenu', 'NR-10', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 3, 1, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(6, 'mainmenu', 'Curso OnLine', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 3, 1, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(7, 'mainmenu', 'Material Didatico', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 5, 1, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(8, 'mainmenu', 'Normas ABNT', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 0, 1, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(9, 'mainmenu', 'Normas MTE', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 0, 1, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(10, 'mainmenu', 'Links', 'index.php?option=com_content&task=view&id=1', 'content_typed', 0, 0, 1, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(11, 'mainmenu', 'Sala dos Alunos', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 0, 1, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(12, 'mainmenu', 'Registre-se', 'index.php?option=com_content&task=view&id=1', 'content_typed', -2, 0, 1, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(13, 'mainmenu', 'Registre-se', 'http://localhost/index.php?option=com_registration&task=register', 'url', 1, 0, 0, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(14, 'mainmenu', 'Home', 'index.php?option=com_content&task=view&id=2', 'content_typed', 1, 0, 2, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` varchar(230) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_messages`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(10) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Extraindo dados da tabela `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`) VALUES
(1, 'Enquete', '', 1, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_poll', 0, 0, 1, 'cache=0\nmoduleclass_sfx=', 0, 0),
(2, 'Menu Usuários', '', 2, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu', 1, 0),
(3, 'Menu Principal', '', 1, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'class_sfx=\nmoduleclass_sfx=\nmenutype=mainmenu\nmenu_style=vert_indent\nfull_active_id=0\ncache=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nactivate_parent=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=', 1, 0),
(4, 'Login', '', 4, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_login', 0, 0, 1, 'moduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\nlogin_message=0\nlogout_message=0\ngreeting=1\nname=0', 1, 0),
(5, 'Difusão de Notícias', '', 5, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_rssfeed', 0, 0, 1, 'text=\ncache=0\nmoduleclass_sfx=\nrss091=1\nrss10=1\nrss20=1\natom=1\nopml=1\nrss091_image=\nrss10_image=\nrss20_image=\natom_image=\nopml_image=', 1, 0),
(6, 'Últimas Notícias', '', 4, 'user1', 0, '0000-00-00 00:00:00', 0, 'mod_latestnews', 0, 0, 1, '', 1, 0),
(7, 'Estatísticas', '', 6, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_stats', 0, 0, 1, 'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=', 0, 0),
(8, 'Usuários On-line', '', 2, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_whosonline', 0, 0, 1, 'showmode=0\nmoduleclass_sfx=', 0, 0),
(9, 'Popular', '', 6, 'user2', 0, '0000-00-00 00:00:00', 0, 'mod_mostread', 0, 0, 1, '', 0, 0),
(10, 'Escolher Tema', '', 7, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_templatechooser', 0, 0, 1, 'show_preview=1', 0, 0),
(11, 'Arquivo', '', 8, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_archive', 0, 0, 1, '', 1, 0),
(12, 'Seções', '', 9, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_sections', 0, 0, 1, '', 1, 0),
(13, 'Flash de Notícias', '', 1, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_newsflash', 0, 0, 1, 'catid=3\r\nstyle=random\r\nitems=\r\nmoduleclass_sfx=', 0, 0),
(14, 'Itens Relacionados', '', 10, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_related_items', 0, 0, 1, 'cache=0\nmoduleclass_sfx=', 0, 0),
(15, 'Procurar', '', 1, 'inset', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 0, 'moduleclass_sfx=\ncache=0\nset_itemid=\nwidth=20\ntext=\nbutton_pos=right\nbutton_text=', 0, 0),
(16, 'Imagens Aleatórias', '', 3, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_random_image', 0, 0, 1, '', 0, 0),
(17, 'Top Menu', '', 1, 'user3', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list_flat\nmenu_images=n\nmenu_images_align=left\nexpand_menu=n\nclass_sfx=-nav\nmoduleclass_sfx=\nindent_image1=0\nindent_image2=0\nindent_image3=0\nindent_image4=0\nindent_image5=0\nindent_image6=0', 1, 0),
(18, 'Banners', '', 1, 'banner', 0, '0000-00-00 00:00:00', 0, 'mod_banners', 0, 0, 0, 'banner_cids=\nmoduleclass_sfx=\n', 1, 0),
(19, 'Componente', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_components', 0, 99, 1, '', 1, 1),
(20, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 99, 1, '', 0, 1),
(21, 'Últimos', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 99, 1, '', 0, 1),
(22, 'Menus', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 99, 1, '', 0, 1),
(23, 'Mensagens Não Lidas', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 99, 1, '', 1, 1),
(24, 'Usuários Online', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 99, 1, '', 1, 1),
(25, 'Menu Completo', '', 1, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_fullmenu', 0, 99, 1, '', 1, 1),
(26, 'Caminho de Navegação', '', 1, 'pathway', 0, '0000-00-00 00:00:00', 1, 'mod_pathway', 0, 99, 1, '', 1, 1),
(27, 'Barra', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 99, 1, '', 1, 1),
(28, 'Mensagem de Sistema', '', 1, 'inset', 0, '0000-00-00 00:00:00', 1, 'mod_mosmsg', 0, 99, 1, '', 1, 1),
(29, 'Ícones Rápidos', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 99, 1, '', 1, 1),
(30, 'Outro Menu', '', 3, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=othermenu\nmenu_style=vert_indent\ncache=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nclass_sfx=\nmoduleclass_sfx=\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=', 0, 0),
(31, 'Wrapper', '', 11, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_wrapper', 0, 0, 1, '', 0, 0),
(32, 'Logado', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 99, 1, '', 0, 1),
(33, 'YOOlogin', '', 2, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_yt_login', 0, 0, 1, 'moduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\nlogin_message=0\nlogout_message=0\ngreeting=1\nname=0\ntext_in=1\nlogin_button=1\nlogout_button=0\nauto_remember=1\nlost_password=0\nregistration=0', 0, 0),
(34, 'Registre-se', '<div class="componentheading" style="color: #7e7e7e; height: 100px; vertical-align: middle"><br /><a href="index.php?option=com_registration&amp;task=register" title="Registre-se">Registre-se</a>  <a href="index.php?option=com_registration&amp;task=register" title="Registre-se"><img src="images/seta.png" border="0" alt="Seta" title="Registre-se" hspace="4" width="41" height="41" align="absmiddle" /></a> </div>', 1, 'user8', 0, '0000-00-00 00:00:00', 1, '', 0, 0, 0, 'moduleclass_sfx=\ncache=0\nfirebots=1\nrssurl=\nrsstitle=1\nrssdesc=1\nrssimage=1\nrssitems=3\nrssitemdesc=1\nword_count=0\nrsscache=3600', 0, 0),
(35, 'Browsers', 'Melhor visualizado em 1024x768 pixels<strong><br /></strong><table border="0" cellspacing="0" cellpadding="0" width="100%"><tbody><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td align="center" valign="bottom" style="width: 33%">&nbsp;<a href="http://br.mozdev.org/" target="_blank"><img src="images/browser_firefox.png" border="0" alt="Firefox" title="Firefox" width="48" height="48" /></a> </td><td align="center" valign="bottom" style="width: 33%">&nbsp;<a href="http://www.microsoft.com/brasil/windows/products/winfamily/ie/default.mspx" target="_blank" title="Internet Explorer 7"><img src="images/browser_ie7.png" border="0" alt="Internet Explorer 7" title="Internet Explorer 7" width="48" height="48" /></a> </td><td align="center" valign="bottom" style="width: 33%">&nbsp;<a href="http://www.opera.com/" target="_blank" title="Opera"><img src="images/browser_opera.png" border="0" alt="Opera" title="Opera" width="48" height="48" /></a> </td></tr><tr><td align="center">&nbsp;Firefox</td><td align="center">&nbsp;IE 7<br /></td><td align="center">&nbsp;Opera</td></tr></tbody></table>', 1, 'bottom', 0, '0000-00-00 00:00:00', 1, '', 0, 0, 0, 'moduleclass_sfx=\ncache=0\nfirebots=1\nrssurl=\nrsstitle=1\nrssdesc=1\nrssimage=1\nrssitems=3\nrssitemdesc=1\nword_count=0\nrsscache=3600', 0, 0),
(36, 'Validação', '<p>&nbsp;</p><p><table border="0" cellspacing="0" cellpadding="0" width="80" align="center" style="height: 45px"><tbody><tr><td><a href="http://jigsaw.w3.org/css-validator/validator?uri=http://www.nr-10.com" target="_blank"><img src="images/validation_css.png" border="0" alt="Valida&ccedil;&atilde;o CSS" title="Valida&ccedil;&atilde;o CSS" width="80" height="15" /></a> </td></tr><tr><td><a href="http://validator.w3.org/check?uri=http://www.nr-10.com" target="_blank"><img src="images/validation_xhtml.png" border="0" alt="Valida&ccedil;&atilde;o XHTML" title="Valida&ccedil;&atilde;o XHTML" width="80" height="15" /></a> </td></tr><tr><td><a href="http://feedvalidator.org/check.cgi?url=http%3A%2F%2Fwww.nr-10.com%2Findex.php%3Foption%3Dcom_rss%26feed%3DRSS2.0%26no_html%3D1" target="_blank"><img src="images/M_images/rss20.gif" border="0" alt="RSS" title="RSS" width="80" height="15" /></a> </td></tr></tbody></table></p>', 1, 'user9', 0, '0000-00-00 00:00:00', 1, '', 0, 0, 0, 'moduleclass_sfx=\ncache=0\nfirebots=1\nrssurl=\nrsstitle=1\nrssdesc=1\nrssimage=1\nrssitems=3\nrssitemdesc=1\nword_count=0\nrsscache=3600', 0, 0),
(37, 'Copyright', '<div align="center">Copyright NR-10 &copy; 2008&nbsp;&nbsp; |&nbsp;&nbsp; Desenvolvido por <a href="http://www.devhouse.com.br" target="_blank">DevHouse</a> </div>', 1, 'footer', 0, '0000-00-00 00:00:00', 1, '', 0, 0, 1, 'moduleclass_sfx=\ncache=0\nfirebots=1\nrssurl=\nrsstitle=1\nrssdesc=1\nrssimage=1\nrssitems=3\nrssitemdesc=1\nword_count=0\nrsscache=3600', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 1),
(6, 2),
(6, 4),
(6, 27),
(6, 36),
(8, 0),
(9, 1),
(9, 2),
(9, 4),
(9, 27),
(9, 36),
(10, 1),
(13, 0),
(14, 0),
(15, 0),
(17, 0),
(18, 0),
(30, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(1, 'Qual o seu campo de aplicação para a norma NR 10?', 0, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(4) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 1, 'Leitura', 0),
(2, 1, 'Manutenção', 0),
(3, 1, 'Operação', 0),
(4, 1, 'Projeto', 0),
(5, 1, '', 0),
(6, 1, '', 0),
(7, 1, '', 0),
(8, 1, '', 0),
(9, 1, '', 0),
(10, 1, '', 0),
(11, 1, '', 0),
(12, 1, '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_poll_menu`
--

INSERT INTO `jos_poll_menu` (`pollid`, `menuid`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `image` varchar(100) NOT NULL default '',
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(10) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_sections`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(50) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `whosonline` (`guest`,`usertype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`) VALUES
('', '1486688168', 'df7ebdb6f0431e5622f5245d925cb525', 1, 0, '', 0),
('', '1486688223', '195f56265c0674fffffe18f8ca905ea2', 1, 0, '', 0),
('', '1486688698', '31a106f860d0829eab95bcd88ad711b5', 1, 0, '', 0),
('', '1486688717', '2b2675511411c7007a6fb55af89eb691', 1, 0, '', 0),
('admin', '1486688625', '50d9029a218c6887f5a298e507235503', 1, 62, 'Super Administrator', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(50) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`template`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('yt_switch', 0, 0),
('joomla_admin', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_template_positions`
--

CREATE TABLE IF NOT EXISTS `jos_template_positions` (
  `id` int(11) NOT NULL auto_increment,
  `position` varchar(10) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `jos_template_positions`
--

INSERT INTO `jos_template_positions` (`id`, `position`, `description`) VALUES
(1, 'left', ''),
(2, 'right', ''),
(3, 'top', ''),
(4, 'bottom', ''),
(5, 'inset', ''),
(6, 'banner', ''),
(7, 'header', ''),
(8, 'footer', ''),
(9, 'newsflash', ''),
(10, 'legals', ''),
(11, 'pathway', ''),
(12, 'toolbar', ''),
(13, 'cpanel', ''),
(14, 'user1', ''),
(15, 'user2', ''),
(16, 'user3', ''),
(17, 'user4', ''),
(18, 'user5', ''),
(19, 'user6', ''),
(20, 'user7', ''),
(21, 'user8', ''),
(22, 'user9', ''),
(23, 'advert1', ''),
(24, 'advert2', ''),
(25, 'advert3', ''),
(26, 'icon', ''),
(27, 'debug', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `username` varchar(25) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Extraindo dados da tabela `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'contato@nr-10.com', '8f9917be547d9fe931cac0a3527fd8c7:YNjgv832T6nByrWs', 'Super Administrator', 0, 1, 25, '2008-06-20 10:19:00', '2008-06-23 19:41:13', '', 'editor=\nexpired=\nexpired_time='),
(63, 'jam nelson da silva david', 'jam david', 'jamdavid30@hotmail.com', '7edd45105f289fe3e4178c22d7c0209e:0QhsPJz1PgT6gR48', '', 0, 0, 18, '2008-06-30 19:46:32', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_usertypes`
--

CREATE TABLE IF NOT EXISTS `jos_usertypes` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `mask` varchar(11) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_usertypes`
--

INSERT INTO `jos_usertypes` (`id`, `name`, `mask`) VALUES
(0, 'superadministrator', ''),
(1, 'administrator', ''),
(2, 'editor', ''),
(3, 'user', ''),
(4, 'author', ''),
(5, 'publisher', ''),
(6, 'manager', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` varchar(250) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_weblinks`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
