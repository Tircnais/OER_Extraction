-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2020 a las 23:59:19
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ontologies`
--

CREATE TABLE `ontologies` (
  `o_id` int(11) NOT NULL COMMENT 'identificador para la tabla',
  `o_name` varchar(50) NOT NULL COMMENT 'nombre de la ontologia',
  `o_description` varchar(250) NOT NULL COMMENT 'Breve descripción de la ontologia',
  `o_url` varchar(155) NOT NULL COMMENT 'Fuente de información, URL.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vocabulario tomado de las ontologias de: SKOS y FOAF. Registro para clases';

--
-- Volcado de datos para la tabla `ontologies`
--

INSERT INTO `ontologies` (`o_id`, `o_name`, `o_description`, `o_url`) VALUES
(1, 'SKOS', 'The Simple Knowledge Organization System (SKOS) is a common data model for sharing and linking knowledge organization systems via the Semantic Web.This document provides a brief description of the SKOS Vocabulary.', 'https://www.w3.org/2009/08/skos-reference/skos.html'),
(2, 'FOAF', 'FOAF is a project devoted to linking people and information using the Web. Regardless of whether information is in people\'s heads, in physical or digital documents, or in the form of factual data, it can be linked. FOAF integrates three kinds of netw', 'http://xmlns.com/foaf/spec/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predicates`
--

CREATE TABLE `predicates` (
  `p_id` int(11) NOT NULL COMMENT 'identificador para la tabla',
  `fk_onto` int(11) NOT NULL COMMENT 'FK a la tabla de ontologia',
  `p_prefix` varchar(50) NOT NULL COMMENT 'prefijo definido por la ontologia',
  `p_uri` varchar(155) NOT NULL COMMENT 'identificador uniforme de recursos, sirve para identificar recursos en Internet, precisamente lo que el nombre indica.',
  `p_label` varchar(50) NOT NULL COMMENT 'Es una etiqueta léxica, una cadena de caracteres UNICODE.',
  `p_description` varchar(350) NOT NULL COMMENT 'Descripción dada al prefijo por la ontologia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vocabulario tomado de las ontologias de: SKOS y FOAF. Registro para propiedades';

--
-- Volcado de datos para la tabla `predicates`
--

INSERT INTO `predicates` (`p_id`, `fk_onto`, `p_prefix`, `p_uri`, `p_label`, `p_description`) VALUES
(1, 1, 'skos:altLabel', 'http://www.w3.org/2004/02/skos/core#altLabel', 'alternative label', 'Alternative lexical labels, helpful to represent synonyms, near-synonyms, abbreviations and acronyms.'),
(2, 1, 'skos:broadMatch', 'http://www.w3.org/2004/02/skos/core#broadMatch', 'has broader match', 'Used to state a hierarchical mapping link between two concepts from different schemes.'),
(3, 1, 'skos:broader', 'http://www.w3.org/2004/02/skos/core#broader', 'has broader', 'Assert that a concept is broader or narrower in meaning than another. These properties are each other\'s inverse. According to the SKOS data model whenever a concept X is broader than another concept Y, then Y is a narrower concept of X.'),
(4, 1, 'skos:broaderTransitive', 'http://www.w3.org/2004/02/skos/core#broaderTransitive', 'has broader transitive', 'The properties skos:broader and skos:narrower, are not defined explicitly as transitive. This means that their semantics do not support inference of links across an entire hierarchy. For applications that require such semantics SKOS features skos:broaderTransitive and skos:narrowerTransitive.'),
(5, 1, 'skos:changeNote', 'http://www.w3.org/2004/02/skos/core#changeNote', 'change note', 'Documents fine-grained changes to a concept, for the purposes of administration and maintenance.'),
(6, 1, 'skos:closeMatch', 'http://www.w3.org/2004/02/skos/core#closeMatch', 'has close match', 'A weaker equivalence relation - used to link two concepts sufficiently similar that can be used interchangeably in some information retrieval applications.'),
(7, 1, 'skos:definition', 'http://www.w3.org/2004/02/skos/core#definition', 'definition', 'Complete explanation of the intended meaning of a concept.'),
(8, 1, 'skos:editorialNote', 'http://www.w3.org/2004/02/skos/core#editorialNote', 'editorial note', 'Supplies information that is an aid to administrative housekeeping, such as reminders of editorial work still to be done.'),
(9, 1, 'skos:exactMatch', 'http://www.w3.org/2004/02/skos/core#exactMatch', 'has exact match', 'Used to link two concepts that can be used interchangeably across a wide range of information retrieval applications. It is a transitive property.'),
(10, 1, 'skos:example', 'http://www.w3.org/2004/02/skos/core#example', 'example', 'Specific examples which refer to a concept.'),
(11, 1, 'skos:hasTopConcept', 'http://www.w3.org/2004/02/skos/core#hasTopConcept', 'has top concept', 'The property is used to link a concept scheme to the concept(s) at the top of the hierarchical structure(s) for that scheme.'),
(12, 1, 'skos:hiddenLabel', 'http://www.w3.org/2004/02/skos/core#hiddenLabel', 'hidden label', 'A hidden lexical label is a string accessible to applications, but not directly visible for users. Hidden labels may, for example, be used to include misspelled variants of other lexical labels.'),
(13, 1, 'skos:historyNote', 'http://www.w3.org/2004/02/skos/core#historyNote', 'history note', 'Describes significant changes to the meaning or the form of a concept.'),
(14, 1, 'skos:inScheme', 'http://www.w3.org/2004/02/skos/core#inScheme', 'is in scheme', 'Concepts can be linked to one or more concept schemes using skos:inScheme.'),
(15, 1, 'skos:mappingRelation', 'http://www.w3.org/2004/02/skos/core#mappingRelation', '	is in mapping relation with', 'Alternative lexical labels, helpful to represent synonyms, near-synonyms, abbreviations and acronyms.'),
(16, 1, 'skos:member', 'http://www.w3.org/2004/02/skos/core#member', 'has member', 'Refer to the concepts that are part of a collection, unordered (skos:member) or ordered (skos:memberList).'),
(17, 1, 'skos:memberList', 'http://www.w3.org/2004/02/skos/core#memberList', 'has member list', 'Refer to the concepts that are part of a collection, unordered (skos:member) or ordered (skos:memberList).'),
(18, 1, 'skos:narrowMatch', 'http://www.w3.org/2004/02/skos/core#narrowMatch', 'has narrower match', 'Used to state a hierarchical mapping link between two concepts from different schemes.'),
(19, 1, 'skos:narrower', 'http://www.w3.org/2004/02/skos/core#narrower', 'has narrower', 'Assert that a concept is broader or narrower in meaning than another. These properties are each other\'s inverse. According to the SKOS data model whenever a concept X is broader than another concept Y, then Y is a narrower concept of X.'),
(20, 1, 'skos:narrowerTransitive', 'http://www.w3.org/2004/02/skos/core#narrowerTransitive', 'has narrower transitive', 'The properties skos:broader and skos:narrower, are not defined explicitly as transitive. This means that their semantics do not support inference of links across an entire hierarchy. For applications that require such semantics SKOS features skos:broaderTransitive and skos:narrowerTransitive.'),
(21, 1, 'skos:notation', 'http://www.w3.org/2004/02/skos/core#notation', 'notation', 'A notation is a string of characters such as \"T58.5\" or \"303.4833\" used to uniquely identify a concept within the scope of a given concept scheme.'),
(22, 1, 'skos:prefLabel', 'http://www.w3.org/2004/02/skos/core#prefLabel', 'preferred label', 'Preferred lexical label with an optional language tag. A resource can only have one preferred label per language tag. The preferred label of a concept may also be used to unambiguously represent this concept in a language within a KOS.'),
(23, 1, 'skos:related', 'http://www.w3.org/2004/02/skos/core#related', 'has related', 'Represents associative (non-hierarchical) links, such as the relationship between one type of event and entities which typically participate in it. This property is symmetric: whenever a concept X is related with another concept Y, then Y is related with X. SKOS does not define this property as transitive.'),
(24, 1, 'skos:relatedMatch', 'http://www.w3.org/2004/02/skos/core#relatedMatch', 'has related match', 'Allows to state an associative mapping link between two concepts from different schemes.'),
(25, 1, 'skos:scopeNote', 'http://www.w3.org/2004/02/skos/core#scopeNote', 'scope note', 'Some, possibly partial, information about the intended meaning of a concept, especially as an indication of how the concept is used in (subject) indexing practice.'),
(26, 1, 'skos:topConceptOf', 'http://www.w3.org/2004/02/skos/core#topConceptOf', 'is top concept in scheme', 'Inverse of skos:hasTopConcept. Used when a concept is at the top of the hierarchical structure of a concept scheme.'),
(27, 1, 'skos:note', 'http://www.w3.org/2004/02/skos/core#note', 'note', ''),
(28, 1, 'skos:semanticRelation', 'http://www.w3.org/2004/02/skos/core#semanticRelation', 'is in semantic relation with', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE `subjects` (
  `s_id` int(11) NOT NULL COMMENT 'identificador para la tabla',
  `fk_onto` int(11) NOT NULL COMMENT 'FK a la tabla de ontologia',
  `s_prefix` varchar(50) NOT NULL COMMENT 'prefijo definido por la ontologia',
  `s_uri` varchar(155) NOT NULL COMMENT 'identificador uniforme de recursos, sirve para identificar recursos en Internet, precisamente lo que el nombre indica.',
  `s_label` varchar(50) NOT NULL COMMENT 'Es una etiqueta léxica, una cadena de caracteres UNICODE.',
  `s_description` varchar(350) NOT NULL COMMENT 'Descripción dada al prefijo por la ontologia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vocabulario tomado de las ontologias de: SKOS y FOAF. Registro para clases';

--
-- Volcado de datos para la tabla `subjects`
--

INSERT INTO `subjects` (`s_id`, `fk_onto`, `s_prefix`, `s_uri`, `s_label`, `s_description`) VALUES
(1, 1, 'skos:Concept', 'http://www.w3.org/2004/02/skos/core#Concept', 'Concept', 'The fundamental element of the SKOS vocabulary is the concept that exist in the mind independently of the terms used to label them. A SKOS concept can be viewed as an idea or notion; a unit of thought. This definition is meant to be suggestive, rather than restrictive. It leaves the door to defining many things as SKOS concepts.'),
(2, 1, 'skos:ConceptScheme', 'http://www.w3.org/2004/02/skos/core#ConceptScheme', 'Concept Scheme', 'A SKOS concept scheme is an aggregation of one or more SKOS concepts. Concepts can be created and used as stand-alone entities. However, especially in indexing practice concepts usually come in carefully compiled vocabularies (i.e thesauri or classification schemes).'),
(3, 1, 'skos:Collection', 'http://www.w3.org/2004/02/skos/core#Collection', 'Collection', 'SKOS makes it possible to define meaningful groupings or \"collections\" of concepts. Collections are useful where a group of concepts shares something in common, and it is convenient to group them under a common label, or where some concepts can be placed in a meaningful order.'),
(4, 1, 'skos:OrderedCollection', 'http://www.w3.org/2004/02/skos/core#OrderedCollection', 'Ordered Collection', 'SKOS makes it possible to define meaningful groupings or \"collections\" of concepts. Collections are useful where a group of concepts shares something in common, and it is convenient to group them under a common label, or where some concepts can be placed in a meaningful order.'),
(5, 1, 'skos:CollectableProperty', 'http://www.w3.org/2004/02/skos/core#CollectableProperty', 'Collectable Property', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ontologies`
--
ALTER TABLE `ontologies`
  ADD PRIMARY KEY (`o_id`);

--
-- Indices de la tabla `predicates`
--
ALTER TABLE `predicates`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `uri_unico` (`p_uri`),
  ADD KEY `predicates_fkOntology` (`fk_onto`);

--
-- Indices de la tabla `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `uri_unico` (`s_uri`),
  ADD KEY `subjects_fkOntology` (`fk_onto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ontologies`
--
ALTER TABLE `ontologies`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador para la tabla', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `predicates`
--
ALTER TABLE `predicates`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador para la tabla', AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador para la tabla', AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `predicates`
--
ALTER TABLE `predicates`
  ADD CONSTRAINT `predicates_fkOntology` FOREIGN KEY (`fk_onto`) REFERENCES `ontologies` (`o_id`);

--
-- Filtros para la tabla `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_fkOntology` FOREIGN KEY (`fk_onto`) REFERENCES `ontologies` (`o_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
