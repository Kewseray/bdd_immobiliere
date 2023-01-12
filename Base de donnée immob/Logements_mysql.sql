CREATE DATABASE IF NOT EXISTS `LOGEMENTS` DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8_general_ci;
USE `LOGEMENTS`;

CREATE TABLE `ADRESSE_LOGEMENT` (
  `id_adresse` VARCHAR(42),
  `no_voie` VARCHAR(42),
  `b/t/q` VARCHAR(42),
  `code_voie` VARCHAR(42),
  `#code_id_commune` VARCHAR(42),
  `voie` VARCHAR(42),
  `type_de_voie` VARCHAR(42),
  `prefixe_de_section` VARCHAR(42),
  `section` VARCHAR(42),
  `no_plan` VARCHAR(42),
  `nombre_de_lot` VARCHAR(42),
  `surface_terrain` VARCHAR(42),
  `code_id_commune` VARCHAR(42),
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `COMMUNE` (
  `code_id_commune` VARCHAR(42),
  `code_commune` VARCHAR(42),
  `commune` VARCHAR(42),
  `code_postal` VARCHAR(42),
  `code_departement` VARCHAR(42),
  PRIMARY KEY (`code_id_commune`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `LOGEMENT` (
  `id_logement` VARCHAR(42),
  `type_local` VARCHAR(42),
  `surface_reel_batie` VARCHAR(42),
  `nombre_pieces_principales` VARCHAR(42),
  PRIMARY KEY (`id_logement`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `LOT` (
  `id_lot` VARCHAR(42),
  `1er_lot` VARCHAR(42),
  `surface_carrez_du_1er_lot` VARCHAR(42),
  `2eme_lot` VARCHAR(42),
  `surface_carrez_du_2eme_lot` VARCHAR(42),
  `3eme_lot` VARCHAR(42),
  `surface_carrez_du_3eme_lot` VARCHAR(42),
  `4eme_lot` VARCHAR(42),
  `surface_carrez_du_4eme_lot` VARCHAR(42),
  `5eme_lot` VARCHAR(42),
  `surface_carrez_du_5eme_lot` VARCHAR(42),
  PRIMARY KEY (`id_lot`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `MUTATION` (
  `id_mutation` VARCHAR(42),
  `valeur_fonciere` VARCHAR(42),
  `nature_mutation` VARCHAR(42),
  `date_mutation` VARCHAR(42),
  `no_dispositon` VARCHAR(42),
  PRIMARY KEY (`id_mutation`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `APPARTIENT` (
  `id_lot` VARCHAR(42),
  `id_logement` VARCHAR(42),
  `id_logement_1` VARCHAR(42),
  `id_lot_1` VARCHAR(42),
  PRIMARY KEY (`id_lot`, `id_logement`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `POSSEDE` (
  `id_logement` VARCHAR(42),
  `id_adresse` VARCHAR(42),
  `id_logement_1` VARCHAR(42),
  `id_adresse_1` VARCHAR(42),
  PRIMARY KEY (`id_logement`, `id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `SUBIT` (
  `id_mutation` VARCHAR(42),
  `id_logement` VARCHAR(42),
  `id_logement_1` VARCHAR(42),
  `id_mutation_1` VARCHAR(42),
  PRIMARY KEY (`id_mutation`, `id_logement`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE `ADRESSE_LOGEMENT` ADD FOREIGN KEY (`code_id_commune`) REFERENCES `COMMUNE` (`code_id_commune`);
ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`id_logement`) REFERENCES `LOGEMENT` (`id_logement`);
ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`id_lot`) REFERENCES `LOT` (`id_lot`);
ALTER TABLE `POSSEDE` ADD FOREIGN KEY (`id_adresse`) REFERENCES `ADRESSE_LOGEMENT` (`id_adresse`);
ALTER TABLE `POSSEDE` ADD FOREIGN KEY (`id_logement`) REFERENCES `LOGEMENT` (`id_logement`);
ALTER TABLE `SUBIT` ADD FOREIGN KEY (`id_logement`) REFERENCES `LOGEMENT` (`id_logement`);
ALTER TABLE `SUBIT` ADD FOREIGN KEY (`id_mutation`) REFERENCES `MUTATION` (`id_mutation`);