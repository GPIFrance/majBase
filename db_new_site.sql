SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `client` (
  `com_code` varchar(25) NOT NULL DEFAULT '',
  `com_nom` varchar(50) DEFAULT NULL,
  `com_pwd` varchar(255) DEFAULT NULL,
  `com_dep` varchar(5) DEFAULT NULL,
  `com_pays` varchar(5) DEFAULT NULL,
  `com_vil` varchar(50) DEFAULT NULL,
  `com_param` varchar(200) DEFAULT NULL,
  `com_param_txt` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`com_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `edi` (
  `edi_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `edi_sit` char(3) DEFAULT NULL,
  `edi_jus` char(3) DEFAULT NULL,
  `edi_lib` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`edi_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `facture` (
  `fac_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_code` varchar(255) NOT NULL DEFAULT '',
  `fac_date` date DEFAULT NULL,
  `fac_num` varchar(255) DEFAULT NULL,
  `fac_lien` varchar(255) DEFAULT NULL,
  `fac_ttc` decimal(10,2) DEFAULT NULL,
  `fac_ht` decimal(10,2) DEFAULT NULL,
  `rowidFacl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fac_id`) USING BTREE,
  KEY `com_code` (`com_code`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79;

CREATE TABLE IF NOT EXISTS `historique_poin` (
  `poin_id` int(11) NOT NULL,
  `act_id` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `edi_code` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `date_heure_pointage` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_heure_situation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reelle_livraison` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `poin_libelle` varchar(255) CHARACTER SET latin1 NOT NULL,
  `poin_comm` varchar(500) CHARACTER SET latin1 NOT NULL,
  `poin_date` date DEFAULT NULL,
  PRIMARY KEY (`act_id`,`edi_code`,`date_heure_pointage`),
  KEY `act_id` (`act_id`),
  KEY `edi_code` (`edi_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `histo_connexion` (
  `id_histo_connexion` int(11) NOT NULL AUTO_INCREMENT,
  `com_code` int(25) NOT NULL,
  `date_heure` datetime NOT NULL,
  `page` varchar(1000) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `navigateur` varchar(255) NOT NULL,
  PRIMARY KEY (`id_histo_connexion`),
  KEY `client_com_code` (`com_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `histo_visu_fac` (
  `id_histo_visu_fac` int(11) NOT NULL AUTO_INCREMENT,
  `fac_id` int(11) NOT NULL,
  `date_heure` datetime NOT NULL,
  PRIMARY KEY (`id_histo_visu_fac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `histo_visu_fac_detail` (
  `id_histo_visu_fac_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_histo_visu_fac` int(11) NOT NULL,
  `com_code` varchar(50) NOT NULL,
  `date_heure` datetime NOT NULL,
  PRIMARY KEY (`id_histo_visu_fac_detail`),
  KEY `id_histo_visu_fac` (`id_histo_visu_fac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `histo_visu_rec` (
  `id_histo_visu_rec` int(11) NOT NULL AUTO_INCREMENT,
  `id_recep` int(11) NOT NULL,
  `date_heure` datetime NOT NULL,
  PRIMARY KEY (`id_histo_visu_rec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `histo_visu_rec_detail` (
  `id_histo_visu_rec_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_histo_visu_rec` int(11) NOT NULL,
  `com_code` varchar(50) NOT NULL,
  `date_heure` datetime NOT NULL,
  PRIMARY KEY (`id_histo_visu_rec_detail`),
  KEY `id_histo_visu_rec` (`id_histo_visu_rec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `image` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) NOT NULL DEFAULT '0',
  `img_lien` varchar(255) DEFAULT NULL,
  `webt_img_ID` int(11) NOT NULL,
  `nomImage` varchar(255) NOT NULL,
  `type_image` varchar(255) NOT NULL,
  PRIMARY KEY (`img_id`) USING BTREE,
  KEY `act_id` (`act_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60061;

CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2;

CREATE TABLE IF NOT EXISTS `multi_pos` (
  `act_id` int(11) NOT NULL,
  `mpos_id` int(11) NOT NULL,
  `mpos_date` datetime NOT NULL,
  `mpos_date_reelle` datetime NOT NULL,
  `mpos_nom_livreur` varchar(50) NOT NULL,
  `mpos_code_livreur` varchar(50) NOT NULL,
  `mpos_ville` varchar(50) NOT NULL,
  `mpos_code_dep` varchar(2) NOT NULL,
  `mpos_cp` varchar(5) NOT NULL,
  `mpos_code_pays` varchar(4) NOT NULL,
  `mpos_palettes` int(11) NOT NULL,
  `mpos_plancher` decimal(10,0) NOT NULL,
  `mpos_poids` decimal(10,0) NOT NULL,
  `mpos_colis` int(11) NOT NULL,
  `mpos_m3` decimal(10,0) NOT NULL,
  `mpos_unite` varchar(50) NOT NULL,
  `mpos_qte_part` decimal(10,0) NOT NULL,
  `mpos_unite_part` varchar(50) NOT NULL,
  `mpos_type_position` varchar(50) NOT NULL,
  `mpos_observation` text NOT NULL,
  PRIMARY KEY (`act_id`,`mpos_id`),
  KEY `act_id` (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `parametres_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''enregistrement',
  `cible` varchar(255) DEFAULT '0;0' COMMENT 'Partie API - A ne pas changer ni choisir',
  `com_code` varchar(255) DEFAULT NULL COMMENT 'Code d''identification',
  `autorise` varchar(255) DEFAULT '0;0' COMMENT 'Liste des champ autorisés',
  `param_spe` varchar(255) DEFAULT '0;0' COMMENT 'Paramètres spéciaux',
  `act_id` varchar(255) DEFAULT '0;0' COMMENT 'act_id',
  `act_refgin` varchar(255) DEFAULT '0;0' COMMENT 'N° Doc',
  `act_bl` varchar(255) DEFAULT '0;0' COMMENT 'N° BL',
  `act_dos` varchar(255) DEFAULT '0;0' COMMENT 'N° Dossiers',
  `act_refcli` varchar(255) DEFAULT '0;0' COMMENT 'Réf Client',
  `act_refchg` varchar(255) DEFAULT '0;0' COMMENT 'Réf Chgt',
  `act_refliv` varchar(255) DEFAULT '0;0' COMMENT 'Réf Liv',
  `act_affaire` varchar(255) DEFAULT '0;0' COMMENT 'Affaire',
  `ttrs_code` varchar(255) DEFAULT '0;0' COMMENT 'Code transport',
  `ttrs_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. transport',
  `ttemp_code` varchar(255) DEFAULT '0;0' COMMENT 'Code Température',
  `ttemp_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Température',
  `tact_code` varchar(255) DEFAULT '0;0' COMMENT 'Code Activité',
  `tact_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Activité',
  `natm_code` varchar(255) DEFAULT '0;0' COMMENT 'Code Nat. Marchandise',
  `natm_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Nat. Marchandise',
  `act_nom_dest` varchar(255) DEFAULT '0;0' COMMENT 'Nom Dest',
  `act_pay_dest` varchar(255) DEFAULT '0;0' COMMENT 'Pays Dest',
  `act_dep_dest` varchar(255) DEFAULT '0;0' COMMENT 'Dpt Dest',
  `act_vil_dest` varchar(255) DEFAULT '0;0' COMMENT 'Ville Dest',
  `act_nom_exp` varchar(255) DEFAULT '0;0' COMMENT 'Nom Exp',
  `act_pay_exp` varchar(255) DEFAULT '0;0' COMMENT 'Pays Exp',
  `act_dep_exp` varchar(255) DEFAULT '0;0' COMMENT 'Dpt Exp',
  `act_vil_exp` varchar(255) DEFAULT '0;0' COMMENT 'Ville Exp',
  `act_date_liv` varchar(255) DEFAULT '0;0' COMMENT 'Date Liv',
  `act_date_liv_reel` varchar(255) DEFAULT '0;0' COMMENT 'Date Liv Réelle',
  `act_date_chg` varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt',
  `act_date_chg_reel` varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt Réelle',
  `act_heure_liv` varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv',
  `act_heure_liv_fin` varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Liv',
  `act_heure_liv_reel` varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv Réelle',
  `act_heure_chg` varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt',
  `act_heure_chg_fin` varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Chgt',
  `act_heure_chg_reel` varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt Réelle',
  `act_nombre_colis` varchar(255) DEFAULT '0;0' COMMENT 'Colis',
  `act_poids` varchar(255) DEFAULT '0;0' COMMENT 'Poids',
  `act_palettes` varchar(255) DEFAULT '0;0' COMMENT 'Palettes',
  `act_palettes_eur` varchar(255) DEFAULT '0;0' COMMENT 'Palettes EUR',
  `act_m3` varchar(255) DEFAULT '0;0' COMMENT 'M3',
  `act_plancher` varchar(255) DEFAULT '0;0' COMMENT 'ML',
  `act_qte_spec` varchar(255) DEFAULT '0;0' COMMENT 'Qté Spécifique',
  `act_unite_spec` varchar(255) DEFAULT '0;0' COMMENT 'Unité Spécifique',
  `edi_code` varchar(255) DEFAULT '0;0' COMMENT 'Code EDI',
  `poin_libelle` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Pointage',
  `poin_date` varchar(255) DEFAULT '0;0' COMMENT 'Date Pointage',
  `act_obs` varchar(255) DEFAULT '0;0' COMMENT 'Obs Générales',
  `act_obs_chg` varchar(255) DEFAULT '0;0' COMMENT 'Obs Chgt',
  `act_agence` varchar(255) DEFAULT '0;0' COMMENT 'Num Agence',
  `document_url` varchar(255) DEFAULT '0;0' COMMENT 'Url de document',
  `fac_infos` varchar(255) DEFAULT '0;0' COMMENT 'Infos Facture',
  `vte_ht_net` varchar(255) DEFAULT '0;0' COMMENT 'CA HT',
  `ach_tiers_livreur` varchar(255) DEFAULT '0;0' COMMENT 'Prestataire',
  `act_date_creation` varchar(255) DEFAULT '0;0' COMMENT 'Date création',
  `fac_id` varchar(255) DEFAULT '0;0' COMMENT 'Id de facture',
  `act_affret` varchar(255) DEFAULT '0;0' COMMENT 'Affrètement ',
  `mpos_id` varchar(255) DEFAULT '0;0' COMMENT 'Id Multi',
  `mpos_date` varchar(255) DEFAULT '0;0' COMMENT 'Date Multi ',
  `mpos_date_reel` varchar(255) DEFAULT '0;0' COMMENT 'Date Réel Multi',
  `mpos_nom_livreur` varchar(255) DEFAULT '0;0' COMMENT 'Prestataire Multi',
  `mpos_code_livreur` varchar(255) DEFAULT '0;0' COMMENT 'Code Prestatire Multi',
  `mpos_ville` varchar(255) DEFAULT '0;0' COMMENT 'Ville multi',
  `mpos_code_dep` varchar(255) DEFAULT '0;0' COMMENT 'Dpt Multi',
  `mpos_cp` varchar(255) DEFAULT '0;0' COMMENT 'CP Multi',
  `mpos_code_pays` varchar(255) DEFAULT '0;0' COMMENT 'Pays Multi',
  `mpos_palettes` varchar(255) DEFAULT '0;0' COMMENT 'Palettes Multi',
  `mpos_plancher` varchar(255) DEFAULT '0;0' COMMENT 'ML Multi',
  `mpos_colis` varchar(255) DEFAULT '0;0' COMMENT 'Colis Multi',
  `mpos_m3` varchar(255) DEFAULT '0;0' COMMENT 'M3 Multi',
  `mpos_unite` varchar(255) DEFAULT '0;0' COMMENT 'Unite Poids Multi',
  `mpos_qte_part` varchar(255) DEFAULT '0;0' COMMENT 'Qté. Spé. Multi',
  `mpos_unite_part` varchar(255) DEFAULT '0;0' COMMENT 'Unit. Spé. Multi',
  `mpos_poids` varchar(255) DEFAULT '0;0' COMMENT 'Poids Multi',
  `mpos_type_position` varchar(255) DEFAULT '0;0' COMMENT 'Pos. Multi',
  `mpos_observation` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Multi',
  `poin_comm` varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Pointage',
  `date_heure_pointage` varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Date histo',
  `date_heure_situation` varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Date situ histo',
  `date_reelle_livraison` varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Date liv histo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `com_code` (`com_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75;

CREATE TABLE IF NOT EXISTS `parametres_facture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant',
  `com_code` varchar(255) DEFAULT '0;0' COMMENT 'Utilisateur',
  `param_spe` varchar(255) DEFAULT '0;0' COMMENT 'Paramètres Spéciaux',
  `afficher` varchar(255) DEFAULT '0;0' COMMENT 'Afficher',
  `lien_recep` varchar(255) DEFAULT '0;0' COMMENT 'Lien Recep',
  `fac_date` varchar(255) DEFAULT '0;0' COMMENT 'Date Facture',
  `fac_num` varchar(255) DEFAULT '0;0' COMMENT 'N° Facture',
  `fac_lien` varchar(255) DEFAULT '0;0' COMMENT 'Lien Facture PDF',
  `fac_ttc` varchar(255) DEFAULT '0;0' COMMENT 'Montant TTC',
  `fac_ht` varchar(255) DEFAULT '0;0' COMMENT 'Montant HT',
  `rowidFacl` varchar(255) DEFAULT '0;0' COMMENT 'Identifiant bdd Progress',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22;

CREATE TABLE IF NOT EXISTS `parametres_recep` (
  `com_code` varchar(255) NOT NULL COMMENT 'Code d''identification',
  `param_spe` varchar(255) DEFAULT '0;0' COMMENT 'Paramètres Spéciaux',
  `nb_image` varchar(255) DEFAULT '0;0' COMMENT 'Images',
  `imprimer` varchar(255) DEFAULT '0;0' COMMENT 'Imprimer',
  `detail` varchar(255) DEFAULT '0;0' COMMENT 'Détail',
  `act_id` varchar(255) DEFAULT '0;0' COMMENT 'act_id',
  `act_refgin` varchar(255) DEFAULT '0;0' COMMENT 'N° Doc',
  `act_bl` varchar(255) DEFAULT '0;0' COMMENT 'N° BL',
  `act_dos` varchar(255) DEFAULT '0;0' COMMENT 'N° Dossier',
  `act_refcli` varchar(255) DEFAULT '0;0' COMMENT 'Réf Client',
  `act_refchg` varchar(255) DEFAULT '0;0' COMMENT 'Réf Chgt',
  `act_refliv` varchar(255) DEFAULT '0;0' COMMENT 'Réf Liv',
  `act_affaire` varchar(255) DEFAULT '0;0' COMMENT 'Affaire',
  `ttrs_code` varchar(255) DEFAULT '0;0' COMMENT 'Code Transport',
  `ttrs_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Transport',
  `ttemp_code` varchar(255) DEFAULT '0;0' COMMENT 'Code Température',
  `ttemp_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Température',
  `tact_code` varchar(255) DEFAULT '0;0' COMMENT 'Code Activité',
  `tact_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Activité',
  `natm_code` varchar(255) DEFAULT '0;0' COMMENT 'Code Nat Marchandise',
  `natm_lib` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Nat Marchandise',
  `act_nom_dest` varchar(255) DEFAULT '0;0' COMMENT 'Nom Dest',
  `act_pay_dest` varchar(255) DEFAULT '0;0' COMMENT 'Pays Dest',
  `act_dep_dest` varchar(255) DEFAULT '0;0' COMMENT 'Dpt Dest',
  `act_vil_dest` varchar(255) DEFAULT '0;0' COMMENT 'Ville Dest',
  `act_nom_exp` varchar(255) DEFAULT '0;0' COMMENT 'Nom Exp',
  `act_pay_exp` varchar(255) DEFAULT '0;0' COMMENT 'Pays Exp',
  `act_dep_exp` varchar(255) DEFAULT '0;0' COMMENT 'Dpt Exp',
  `act_vil_exp` varchar(255) DEFAULT '0;0' COMMENT 'Ville Exp',
  `act_date_liv` varchar(255) DEFAULT '0;0' COMMENT 'Date Liv',
  `act_date_liv_reel` varchar(255) DEFAULT '0;0' COMMENT 'Date Liv Réelle',
  `act_date_chg` varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt',
  `act_date_chg_reel` varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt Réelle',
  `act_heure_liv` varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv',
  `act_heure_liv_fin` varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Liv',
  `act_heure_liv_reel` varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv Réelle',
  `act_heure_chg` varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt',
  `act_heure_chg_fin` varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Chgt',
  `act_heure_chg_reel` varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt Réelle',
  `act_nombre_colis` varchar(255) DEFAULT '0;0' COMMENT 'Colis',
  `act_poids` varchar(255) DEFAULT '0;0' COMMENT 'Poids (kg)',
  `act_palettes` varchar(255) DEFAULT '0;0' COMMENT 'Palettes',
  `act_palettes_eur` varchar(255) DEFAULT '0;0' COMMENT 'Palettes EUR',
  `act_m3` varchar(255) DEFAULT '0;0' COMMENT 'M3',
  `act_plancher` varchar(255) DEFAULT '0;0' COMMENT 'ML',
  `act_qte_spec` varchar(255) DEFAULT '0;0' COMMENT 'Qté Spécifique',
  `act_unite_spec` varchar(255) DEFAULT '0;0' COMMENT 'Unite Spécifique',
  `edi_code` varchar(255) DEFAULT '0;0' COMMENT 'Code EDI',
  `poin_libelle` varchar(255) DEFAULT '0;0' COMMENT 'Lib. Pointage',
  `poin_date` varchar(255) DEFAULT '0;0' COMMENT 'Date Pointage',
  `act_obs` varchar(255) DEFAULT '0;0' COMMENT 'Obs Générales',
  `act_obs_chg` varchar(255) DEFAULT '0;0' COMMENT 'Obs Chgt',
  `act_obs_liv` varchar(255) DEFAULT '0;0' COMMENT 'Obs Liv',
  `act_agence` varchar(255) DEFAULT '0;0' COMMENT 'Code Agence',
  `act_agence_nom` varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Agence',
  `document_url` varchar(255) DEFAULT '0;0' COMMENT 'Doc Scanné',
  `fac_infos` varchar(255) DEFAULT '0;0' COMMENT 'Infos Facture',
  `vte_ht_net` varchar(255) DEFAULT '0;0' COMMENT 'CA HT',
  `ach_tiers_livreur` varchar(255) DEFAULT '0;0' COMMENT 'Prestataire',
  `act_date_creation` varchar(255) DEFAULT '0;0' COMMENT 'Date Création',
  `fac_id` varchar(255) DEFAULT '0;0' COMMENT 'Id facture',
  `act_affret` varchar(255) DEFAULT '0;0' COMMENT 'Affrêtement',
  PRIMARY KEY (`com_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recep` (
  `recep_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) NOT NULL DEFAULT '0',
  `com_code` varchar(25) NOT NULL DEFAULT '',
  `fac_id` int(11) NOT NULL,
  `act_refgin` varchar(255) DEFAULT NULL,
  `act_bl` varchar(255) DEFAULT NULL,
  `act_dos` varchar(255) DEFAULT NULL,
  `act_refcli` varchar(255) DEFAULT NULL,
  `act_refchg` varchar(255) DEFAULT NULL,
  `act_refliv` varchar(255) DEFAULT NULL,
  `act_affret` binary(1) DEFAULT NULL,
  `act_affaire` varchar(255) DEFAULT NULL,
  `ttrs_code` varchar(4) DEFAULT NULL,
  `ttrs_lib` varchar(255) DEFAULT NULL,
  `ttemp_code` varchar(4) DEFAULT NULL,
  `ttemp_lib` varchar(255) DEFAULT NULL,
  `tact_code` varchar(4) DEFAULT NULL,
  `tact_lib` varchar(255) DEFAULT NULL,
  `natm_code` varchar(6) DEFAULT NULL,
  `natm_lib` varchar(255) DEFAULT NULL,
  `act_nom_dest` varchar(255) DEFAULT NULL,
  `act_pay_dest` varchar(255) DEFAULT NULL,
  `act_dep_dest` varchar(255) DEFAULT NULL,
  `act_vil_dest` varchar(255) DEFAULT NULL,
  `act_nom_exp` varchar(255) DEFAULT NULL,
  `act_pay_exp` varchar(255) DEFAULT NULL,
  `act_dep_exp` varchar(255) DEFAULT NULL,
  `act_vil_exp` varchar(255) DEFAULT NULL,
  `act_date_liv` date DEFAULT NULL,
  `act_date_liv_reel` date DEFAULT NULL,
  `act_date_chg` date DEFAULT NULL,
  `act_date_chg_reel` date DEFAULT NULL,
  `act_heure_liv` time DEFAULT NULL,
  `act_heure_liv_fin` time DEFAULT NULL,
  `act_heure_liv_reel` time DEFAULT NULL,
  `act_heure_chg` time DEFAULT NULL,
  `act_heure_chg_fin` time DEFAULT NULL,
  `act_heure_chg_reel` time DEFAULT NULL,
  `act_nombre_colis` int(10) DEFAULT NULL,
  `act_poids` decimal(10,2) DEFAULT NULL,
  `act_palettes` int(10) DEFAULT NULL,
  `act_palettes_eur` int(10) DEFAULT NULL,
  `act_m3` decimal(10,3) DEFAULT NULL,
  `act_plancher` decimal(10,2) DEFAULT NULL,
  `act_qte_spec` decimal(10,2) DEFAULT NULL,
  `act_unite_spec` varchar(50) DEFAULT NULL,
  `edi_code` varchar(10) DEFAULT NULL,
  `poin_libelle` varchar(255) NOT NULL,
  `poin_date` date NOT NULL,
  `act_obs` varchar(255) DEFAULT NULL,
  `act_obs_chg` varchar(255) DEFAULT NULL,
  `act_obs_liv` varchar(255) DEFAULT NULL,
  `act_agence` int(11) NOT NULL,
  `act_agence_nom` varchar(255) NOT NULL,
  `document_url` varchar(255) NOT NULL,
  `fac_infos` varchar(500) NOT NULL COMMENT 'format: num_facture|JJ/MM/AA|[num_facture|JJ/MM/AA]',
  `vte_ht_net` decimal(7,2) NOT NULL,
  `ach_tiers_livreur` varchar(50) NOT NULL,
  `act_date_creation` date DEFAULT NULL,
  PRIMARY KEY (`act_id`) USING BTREE,
  KEY `act_dos` (`act_dos`) USING BTREE,
  KEY `com_code` (`com_code`) USING BTREE,
  KEY `act_date_chg` (`act_date_chg`) USING BTREE,
  KEY `act_date_liv` (`act_date_liv`) USING BTREE,
  KEY `recep_id` (`recep_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=784;

CREATE TABLE IF NOT EXISTS `recep_facture` (
  `recep_facture_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) NOT NULL,
  `fac_id` int(11) NOT NULL,
  PRIMARY KEY (`recep_facture_id`),
  UNIQUE KEY `act_fac` (`act_id`,`fac_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71;

CREATE TABLE IF NOT EXISTS `societe` (
  `societe_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de la société',
  `societe_nom` varchar(255) DEFAULT NULL COMMENT 'Nom de la société',
  `societe_logo` varchar(1500) DEFAULT NULL COMMENT 'Chemin du logo de la société',
  `societe_param_facture` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Affichage de la recherche des factures',
  `societe_param_recepisse` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Affichage de la recherche des récépissés',
  PRIMARY KEY (`societe_id`),
  KEY `societe_nom` (`societe_nom`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contient les informations générales des sociétés' AUTO_INCREMENT=5;

CREATE TABLE IF NOT EXISTS `statistiques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `page` varchar(250) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `host` varchar(60) NOT NULL DEFAULT '',
  `navigateur` varchar(255) NOT NULL,
  `referer` varchar(250) NOT NULL DEFAULT '',
  `com_code` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1427;

CREATE TABLE IF NOT EXISTS `visualisation` (
  `visu_id` int(11) NOT NULL AUTO_INCREMENT,
  `num_action` int(11) NOT NULL,
  `code_action` varchar(1) NOT NULL,
  `visu_date` date NOT NULL,
  `com_code` varchar(25) NOT NULL,
  PRIMARY KEY (`visu_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=677;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

INSERT INTO `parametres_detail` (`id`, `cible`, `com_code`, `autorise`, `param_spe`, `act_id`, `act_refgin`, `act_bl`, `act_dos`, `act_refcli`, `act_refchg`, `act_refliv`, `act_affaire`, `ttrs_code`, `ttrs_lib`, `ttemp_code`, `ttemp_lib`, `tact_code`, `tact_lib`, `natm_code`, `natm_lib`, `act_nom_dest`, `act_pay_dest`, `act_dep_dest`, `act_vil_dest`, `act_nom_exp`, `act_pay_exp`, `act_dep_exp`, `act_vil_exp`, `act_date_liv`, `act_date_liv_reel`, `act_date_chg`, `act_date_chg_reel`, `act_heure_liv`, `act_heure_liv_fin`, `act_heure_liv_reel`, `act_heure_chg`, `act_heure_chg_fin`, `act_heure_chg_reel`, `act_nombre_colis`, `act_poids`, `act_palettes`, `act_palettes_eur`, `act_m3`, `act_plancher`, `act_qte_spec`, `act_unite_spec`, `edi_code`, `poin_libelle`, `poin_date`, `act_obs`, `act_obs_chg`, `act_agence`, `document_url`, `fac_infos`, `vte_ht_net`, `ach_tiers_livreur`, `act_date_creation`, `fac_id`, `act_affret`, `mpos_id`, `mpos_date`, `mpos_date_reel`, `mpos_nom_livreur`, `mpos_code_livreur`, `mpos_ville`, `mpos_code_dep`, `mpos_cp`, `mpos_code_pays`, `mpos_palettes`, `mpos_plancher`, `mpos_colis`, `mpos_m3`, `mpos_unite`, `mpos_qte_part`, `mpos_unite_part`, `mpos_poids`, `mpos_type_position`, `mpos_observation`, `poin_comm`, `date_heure_pointage`, `date_heure_situation`, `date_reelle_livraison`) VALUES
  (68, 'M', '', NULL, '0', '0;71', '0;47', '0;46', '0;45', '0;48', '0;49', '0;51', '0;50', '0;44', '0;43', '0;37', '0;36', '0;35', '0;38', '0;39', '0;42', '0;41', '0;40', '0;52', '0;53', '0;66', '0;65', '0;64', '0;67', '0;68', '0;70', '0;69', '0;63', '0;62', '0;56', '0;55', '0;54', '0;57', '0;58', '0;61', '0;60', '0;59', '0;34', '0;33', '0;13', '0;12', '0;11', '0;14', '0;15', '0;17', '0;16', '0;10', '0;9', '0;3', '0;2', '0;1', '0;4', '0;5', '0;8', '0;7', '0;6', '0;18', '0;19', '0;28', '0;27', '0;26', '0;29', '0;30', '0;32', '0;31', '1;4', '0;25', '1;2', '1;1', '0;20', '0;21', '0;22', '1;3', '0;24', '0;23', '0;0', '0;0', '0;0'),
  (69, 'L', '', NULL, '0', '0;65', '0;45', '0;44', '0;43', '0;46', '0;47', '0;49', '0;48', '0;42', '0;41', '0;36', '0;35', '0;34', '0;37', '0;38', '0;40', '1;1', '0;39', '1;2', '1;3', '0;60', '0;59', '0;58', '0;61', '0;62', '0;64', '0;63', '0;57', '0;56', '0;52', '0;51', '0;50', '0;53', '0;54', '0;55', '1;5', '1;6', '0;33', '0;32', '1;4', '0;68', '0;9', '0;10', '0;11', '0;13', '0;12', '0;8', '0;7', '0;3', '0;2', '0;1', '0;4', '0;5', '0;67', '0;66', '0;6', '0;14', '0;15', '0;27', '0;26', '0;25', '0;28', '0;29', '0;31', '0;30', '0;69', '0;24', '0;18', '0;17', '0;16', '0;19', '0;20', '0;23', '0;22', '0;21', '0;0', '0;0', '0;0'),
  (70, 'G', '', NULL, '0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0', '0;0'),
  (71, 'C', '', NULL, '0', '0;72', '0;48', '0;47', '0;46', '0;49', '0;50', '0;52', '0;51', '0;45', '0;44', '0;38', '0;37', '0;36', '0;39', '0;40', '0;43', '0;42', '0;41', '0;53', '0;54', '0;67', '0;66', '0;65', '0;68', '0;69', '0;71', '0;70', '0;64', '0;63', '0;57', '0;56', '0;55', '0;58', '0;59', '0;62', '0;61', '0;60', '0;35', '0;34', '1;3', '0;10', '1;2', '0;11', '0;12', '0;14', '0;13', '1;1', '0;9', '0;3', '0;2', '0;1', '0;4', '0;5', '0;8', '0;7', '0;6', '0;15', '0;16', '0;29', '0;28', '0;27', '0;30', '0;31', '0;33', '0;32', '0;26', '0;25', '0;19', '0;18', '0;17', '0;20', '0;21', '0;24', '0;23', '0;22', '0;0', '0;0', '0;0'),
  (72, 'E', '', NULL, '0', '0;72', '0;48', '0;47', '0;46', '0;49', '0;50', '0;52', '0;51', '0;45', '0;44', '0;38', '0;37', '0;36', '0;39', '0;40', '0;43', '0;42', '0;41', '0;53', '0;54', '0;67', '0;66', '0;65', '0;68', '0;69', '0;71', '0;70', '0;64', '0;63', '0;57', '0;56', '0;55', '0;58', '0;59', '0;62', '0;61', '0;60', '0;35', '0;34', '0;10', '0;9', '0;8', '0;11', '0;12', '0;14', '0;13', '1;3', '0;7', '0;2', '1;1', '0;1', '0;3', '0;4', '1;2', '0;6', '0;5', '0;15', '0;16', '0;29', '0;28', '0;27', '0;30', '0;31', '0;33', '0;32', '0;26', '0;25', '0;19', '0;18', '0;17', '0;20', '0;21', '0;24', '0;23', '0;22', '0;0', '0;0', '0;0'),
  (73, 'H', '', NULL, '0', '0;72', '0;48', '0;47', '0;46', '0;49', '0;50', '0;52', '0;51', '0;45', '0;44', '0;38', '0;37', '0;36', '0;39', '0;40', '0;43', '0;42', '0;41', '0;53', '0;54', '0;67', '0;66', '0;65', '0;68', '0;69', '0;71', '0;70', '0;64', '0;63', '0;57', '0;56', '0;55', '0;58', '0;59', '0;62', '0;61', '0;60', '0;35', '0;34', '0;12', '0;74', '0;11', '1;1', '0;13', '0;75', '0;14', '0;10', '0;9', '0;4', '0;3', '0;2', '0;5', '0;6', '0;73', '0;8', '0;7', '0;15', '0;16', '0;29', '0;28', '0;27', '0;30', '0;31', '0;33', '0;32', '0;26', '0;25', '0;19', '0;18', '0;17', '0;20', '0;21', '0;24', '0;23', '0;22', '1;2', '0;1', '1;3'),
  (74, 'Q', '', NULL, '0', '0;72', '0;48', '0;47', '0;46', '0;49', '0;50', '0;52', '0;51', '0;45', '0;44', '0;38', '0;37', '0;36', '0;39', '0;40', '0;43', '0;42', '0;41', '0;53', '0;54', '0;67', '0;66', '0;65', '0;68', '0;69', '0;71', '0;70', '0;64', '0;63', '0;57', '0;56', '0;55', '0;58', '0;59', '0;62', '0;61', '0;60', '0;35', '0;34', '0;10', '1;3', '0;9', '0;11', '0;12', '0;14', '0;13', '0;8', '1;2', '0;3', '0;2', '0;1', '0;4', '0;5', '0;7', '1;1', '0;6', '0;15', '0;16', '0;29', '0;28', '0;27', '0;30', '0;31', '0;33', '0;32', '0;26', '0;25', '0;19', '0;18', '0;17', '0;20', '0;21', '0;24', '0;23', '0;22', '0;0', '0;0', '0;0');

INSERT INTO `parametres_facture` (`ID`, `com_code`, `param_spe`, `afficher`, `lien_recep`, `fac_date`, `fac_num`, `fac_lien`, `fac_ttc`, `fac_ht`, `rowidFacl`) VALUES
  (20, '', '0', '1;1', '1;2', '1;3', '1;4', '0;2', '1;6', '1;5', '0;1');

INSERT INTO `parametres_recep` (`com_code`, `param_spe`, `nb_image`, `imprimer`, `detail`, `act_id`, `act_refgin`, `act_bl`, `act_dos`, `act_refcli`, `act_refchg`, `act_refliv`, `act_affaire`, `ttrs_code`, `ttrs_lib`, `ttemp_code`, `ttemp_lib`, `tact_code`, `tact_lib`, `natm_code`, `natm_lib`, `act_nom_dest`, `act_pay_dest`, `act_dep_dest`, `act_vil_dest`, `act_nom_exp`, `act_pay_exp`, `act_dep_exp`, `act_vil_exp`, `act_date_liv`, `act_date_liv_reel`, `act_date_chg`, `act_date_chg_reel`, `act_heure_liv`, `act_heure_liv_fin`, `act_heure_liv_reel`, `act_heure_chg`, `act_heure_chg_fin`, `act_heure_chg_reel`, `act_nombre_colis`, `act_poids`, `act_palettes`, `act_palettes_eur`, `act_m3`, `act_plancher`, `act_qte_spec`, `act_unite_spec`, `edi_code`, `poin_libelle`, `poin_date`, `act_obs`, `act_obs_chg`, `act_obs_liv`, `act_agence`, `act_agence_nom`, `document_url`, `fac_infos`, `vte_ht_net`, `ach_tiers_livreur`, `act_date_creation`, `fac_id`, `act_affret`) VALUES
  ('', '0', '1;3', '1;1', '1;2', '0;31', '0;30', '0;32', '1;12', '1;13', '0;29', '0;28', '0;24', '0;23', '0;25', '0;26', '0;27', '0;34', '0;33', '0;40', '0;41', '1;6', '1;7', '1;8', '1;9', '0;39', '0;36', '0;35', '0;37', '1;10', '0;38', '1;4', '0;22', '1;11', '0;4', '0;5', '1;5', '0;6', '0;3', '1;16', '1;17', '1;14', '0;1', '0;2', '1;15', '0;42', '0;7', '0;8', '0;18', '0;17', '0;19', '0;20', '0;21', '0;16', '1;18', '0;15', '0;10', '0;9', '0;11', '0;12', '0;14', '0;13');
