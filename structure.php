<?php
return [
    "client" => [
        "com_code" => "varchar(25) NOT NULL DEFAULT ''",
        "com_nom" =>"varchar(50) DEFAULT NULL",
        "com_pwd" => "varchar(255) DEFAULT NULL",
        "com_dep" => "varchar(5) DEFAULT NULL",
        "com_pays" => "varchar(5) DEFAULT NULL",
        "com_vil" => "varchar(50) DEFAULT NULL",
        "com_param" => "varchar(200) DEFAULT NULL",
        "com_param_txt" => "varchar(500) DEFAULT NULL"
    ],
    "edi" => [
        "edi_code" => "varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL",
        "edi_sit" => "char(3) DEFAULT NULL",
        "edi_jus" => "char(3) DEFAULT NULL",
        "edi_lib" => "varchar(255) DEFAULT NULL"
    ],
    "facture" => [
        "fac_id" => "int(11) NOT NULL AUTO_INCREMENT",
        "com_code" => "varchar(255) NOT NULL DEFAULT ''",
        "fac_date" => "date DEFAULT NULL",
        "fac_num" => "varchar(255) DEFAULT NULL",
        "fac_lien" => "varchar(255) DEFAULT NULL",
        "fac_ttc" => "decimal(10,2) DEFAULT NULL",
        "fac_ht" => "decimal(10,2) DEFAULT NULL",
        "rowidFacl" => "varchar(500) DEFAULT NULL"
    ],
    "historique_poin" => [
        "poin_id" => "int(11) NOT NULL",
        "act_id" => "varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT ''",
        "edi_code" => "varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT ''",
        "date_heure_pointage" => "datetime NOT NULL DEFAULT '0000-00-00 00:00:00'",
        "date_heure_situation" => "datetime NOT NULL DEFAULT '0000-00-00 00:00:00'",
        "date_reelle_livraison" => "datetime NOT NULL DEFAULT '0000-00-00 00:00:00'",
        "poin_libelle" => "varchar(255) CHARACTER SET latin1 NOT NULL",
        "poin_comm" => "varchar(500) CHARACTER SET latin1 NOT NULL"
    ],
    "histo_connexion" => [
        "id_histo_connexion" => "int(11) NOT NULL AUTO_INCREMENT",
        "com_code" => "int(25) NOT NULL",
        "date_heure" => "datetime NOT NULL",
        "page" => "varchar(1000) NOT NULL",
        "ip" => "varchar(255) NOT NULL",
        "host" => "varchar(255) NOT NULL",
        "navigateur" => "varchar(255) NOT NULL"
    ],
    "histo_visu_fac" => [
        "id_histo_visu_fac" => "int(11) NOT NULL AUTO_INCREMENT",
        "fac_id" => "int(11) NOT NULL",
        "date_heure" => "datetime NOT NULL"
    ],
    "histo_visu_fac_detail" => [
        "id_histo_visu_fac_detail" => "int(11) NOT NULL AUTO_INCREMENT",
        "id_histo_visu_fac" => "int(11) NOT NULL",
        "com_code" => "varchar(50) NOT NULL",
        "date_heure" => "datetime NOT NULL"
    ],
    "histo_visu_rec" => [
        "id_histo_visu_rec" => "int(11) NOT NULL AUTO_INCREMENT",
        "id_recep" => "int(11) NOT NULL",
        "date_heure" => "datetime NOT NULL"
    ],
    "histo_visu_rec_detail" => [
        "id_histo_visu_rec_detail" => "int(11) NOT NULL AUTO_INCREMENT",
        "id_histo_visu_rec" => "int(11) NOT NULL",
        "com_code" => "varchar(50) NOT NULL",
        "date_heure" => "datetime NOT NULL"
    ],
    "image" => [
        "img_id" => "int(11) NOT NULL AUTO_INCREMENT",
        "act_id" => "int(11) NOT NULL DEFAULT '0'",
        "img_lien" => "varchar(255) DEFAULT NULL",
        "webt_img_ID" => "int(11) NOT NULL",
        "nomImage" => "varchar(255) NOT NULL",
        "type_image" => "varchar(255) NOT NULL"
    ],
    "message" => [
        "id_message" => "int(11) NOT NULL AUTO_INCREMENT",
        "event" => "varchar(255) NOT NULL",
        "title" => "varchar(50) NOT NULL",
        "content" => "text NOT NULL",
        "active" => "tinyint(1) NOT NULL DEFAULT '0'"
    ],
    "multi_pos" => [
        "act_id" => "int(11) NOT NULL",
        "mpos_id" => "int(11) NOT NULL",
        "mpos_date" => "datetime NOT NULL",
        "mpos_date_reelle" => "datetime NOT NULL",
        "mpos_nom_livreur" => "varchar(50) NOT NULL",
        "mpos_code_livreur" => "varchar(50) NOT NULL",
        "mpos_ville" => "varchar(50) NOT NULL",
        "mpos_code_dep" => "varchar(2) NOT NULL",
        "mpos_cp" => "varchar(5) NOT NULL",
        "mpos_code_pays" => "varchar(4) NOT NULL",
        "mpos_palettes" => "int(11) NOT NULL",
        "mpos_plancher" => "decimal(10,0) NOT NULL",
        "mpos_poids" => "decimal(10,0) NOT NULL",
        "mpos_colis" => "int(11) NOT NULL",
        "mpos_m3" => "decimal(10,0) NOT NULL",
        "mpos_unite" => "varchar(50) NOT NULL",
        "mpos_qte_part" => "decimal(10,0) NOT NULL",
        "mpos_unite_part" => "varchar(50) NOT NULL",
        "mpos_type_position" => "varchar(50) NOT NULL",
        "mpos_observation" => "text NOT NULL"
    ],
    "parametres_detail" => [
        "id" => "int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''enregistrement'",
        "cible" => "varchar(255) DEFAULT '0;0' COMMENT 'Partie API - A ne pas changer ni choisir'",
        "com_code" => "varchar(255) DEFAULT NULL COMMENT 'Code d''identification'",
        "autorise" => "varchar(255) DEFAULT '0;0' COMMENT 'Liste des champ autorisés'",
        "param_spe" => "varchar(255) DEFAULT '0;0' COMMENT 'Paramètres spéciaux'",
        "act_id" => "varchar(255) DEFAULT '0;0' COMMENT 'act_id'",
        "act_refgin" => "varchar(255) DEFAULT '0;0' COMMENT 'N° Doc'",
        "act_bl" => "varchar(255) DEFAULT '0;0' COMMENT 'N° BL'",
        "act_dos" => "varchar(255) DEFAULT '0;0' COMMENT 'N° Dossiers'",
        "act_refcli" => "varchar(255) DEFAULT '0;0' COMMENT 'Réf Client'",
        "act_refchg" => "varchar(255) DEFAULT '0;0' COMMENT 'Réf Chgt'",
        "act_refliv" => "varchar(255) DEFAULT '0;0' COMMENT 'Réf Liv'",
        "act_affaire" => "varchar(255) DEFAULT '0;0' COMMENT 'Affaire'",
        "ttrs_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code transport'",
        "ttrs_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. transport'",
        "ttemp_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Température'",
        "ttemp_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Température'",
        "tact_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Activité'",
        "tact_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Activité'",
        "natm_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Nat. Marchandise'",
        "natm_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Nat. Marchandise'",
        "act_nom_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Nom Dest'",
        "act_pay_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Pays Dest'",
        "act_dep_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Dpt Dest'",
        "act_vil_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Ville Dest'",
        "act_nom_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Nom Exp'",
        "act_pay_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Pays Exp'",
        "act_dep_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Dpt Exp'",
        "act_vil_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Ville Exp'",
        "act_date_liv" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Liv'",
        "act_date_liv_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Liv Réelle'",
        "act_date_chg" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt'",
        "act_date_chg_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt Réelle'",
        "act_heure_liv" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv'",
        "act_heure_liv_fin" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Liv'",
        "act_heure_liv_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv Réelle'",
        "act_heure_chg" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt'",
        "act_heure_chg_fin" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Chgt'",
        "act_heure_chg_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt Réelle'",
        "act_nombre_colis" => "varchar(255) DEFAULT '0;0' COMMENT 'Colis'",
        "act_poids" => "varchar(255) DEFAULT '0;0' COMMENT 'Poids'",
        "act_palettes" => "varchar(255) DEFAULT '0;0' COMMENT 'Palettes'",
        "act_palettes_eur" => "varchar(255) DEFAULT '0;0' COMMENT 'Palettes EUR'",
        "act_m3" => "varchar(255) DEFAULT '0;0' COMMENT 'M3'",
        "act_plancher" => "varchar(255) DEFAULT '0;0' COMMENT 'ML'",
        "act_qte_spec" => "varchar(255) DEFAULT '0;0' COMMENT 'Qté Spécifique'",
        "act_unite_spec" => "varchar(255) DEFAULT '0;0' COMMENT 'Unité Spécifique'",
        "edi_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code EDI'",
        "poin_libelle" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Pointage'",
        "poin_date" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Pointage'",
        "act_obs" => "varchar(255) DEFAULT '0;0' COMMENT 'Obs Générales'",
        "act_obs_chg" => "varchar(255) DEFAULT '0;0' COMMENT 'Obs Chgt'",
        "act_agence" => "varchar(255) DEFAULT '0;0' COMMENT 'Num Agence'",
        "document_url" => "varchar(255) DEFAULT '0;0' COMMENT 'Url de document'",
        "fac_infos" => "varchar(255) DEFAULT '0;0' COMMENT 'Infos Facture'",
        "vte_ht_net" => "varchar(255) DEFAULT '0;0' COMMENT 'CA HT'",
        "ach_tiers_livreur" => "varchar(255) DEFAULT '0;0' COMMENT 'Prestataire'",
        "act_date_creation" => "varchar(255) DEFAULT '0;0' COMMENT 'Date création'",
        "fac_id" => "varchar(255) DEFAULT '0;0' COMMENT 'Id de facture'",
        "act_affret" => "varchar(255) DEFAULT '0;0' COMMENT 'Affrètement'",
        "mpos_id" => "varchar(255) DEFAULT '0;0' COMMENT 'Id Multi'",
        "mpos_date" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Multi '",
        "mpos_date_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Réel Multi'",
        "mpos_nom_livreur" => "varchar(255) DEFAULT '0;0' COMMENT 'Prestataire Multi'",
        "mpos_code_livreur" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Prestatire Multi'",
        "mpos_ville" => "varchar(255) DEFAULT '0;0' COMMENT 'Ville multi'",
        "mpos_code_dep" => "varchar(255) DEFAULT '0;0' COMMENT 'Dpt Multi'",
        "mpos_cp" => "varchar(255) DEFAULT '0;0' COMMENT 'CP Multi'",
        "mpos_code_pays" => "varchar(255) DEFAULT '0;0' COMMENT 'Pays Multi'",
        "mpos_palettes" => "varchar(255) DEFAULT '0;0' COMMENT 'Palettes Multi'",
        "mpos_plancher" => "varchar(255) DEFAULT '0;0' COMMENT 'ML Multi'",
        "mpos_colis" => "varchar(255) DEFAULT '0;0' COMMENT 'Colis Multi'",
        "mpos_m3" => "varchar(255) DEFAULT '0;0' COMMENT 'M3 Multi'",
        "mpos_unite" => "varchar(255) DEFAULT '0;0' COMMENT 'Unite Poids Multi'",
        "mpos_qte_part" => "varchar(255) DEFAULT '0;0' COMMENT 'Qté. Spé. Multi'",
        "mpos_unite_part" => "varchar(255) DEFAULT '0;0' COMMENT 'Unit. Spé. Multi'",
        "mpos_poids" => "varchar(255) DEFAULT '0;0' COMMENT 'Poids Multi'",
        "mpos_type_position" => "varchar(255) DEFAULT '0;0' COMMENT 'Pos. Multi'",
        "mpos_observation" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Multi'",
        "poin_comm" => "varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Pointage'",
        "date_heure_pointage" => "varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Date histo'",
        "date_heure_situation" => "varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Date situ histo'",
        "date_reelle_livraison" => "varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Date liv histo'"
    ],
    "parametres_facture" => [
        "ID" => "int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant'",
        "com_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Utilisateur'",
        "param_spe" => "varchar(255) DEFAULT '0;0' COMMENT 'Paramètres Spéciaux'",
        "afficher" => "varchar(255) DEFAULT '0;0' COMMENT 'Afficher'",
        "lien_recep" => "varchar(255) DEFAULT '0;0' COMMENT 'Lien Recep'",
        "fac_date" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Facture'",
        "fac_num" => "varchar(255) DEFAULT '0;0' COMMENT 'N° Facture'",
        "fac_lien" => "varchar(255) DEFAULT '0;0' COMMENT 'Lien Facture PDF'",
        "fac_ttc" => "varchar(255) DEFAULT '0;0' COMMENT 'Montant TTC'",
        "fac_ht" => "varchar(255) DEFAULT '0;0' COMMENT 'Montant HT'",
        "rowidFacl" => "varchar(255) DEFAULT '0;0' COMMENT 'Identifiant bdd Progress'"
    ],
    "parametres_recep" => [
        "com_code" => "varchar(255) NOT NULL COMMENT 'Code d''identification'",
        "param_spe" => "varchar(255) DEFAULT '0;0' COMMENT 'Paramètres Spéciaux'",
        "nb_image" => "varchar(255) DEFAULT '0;0' COMMENT 'Images'",
        "imprimer" => "varchar(255) DEFAULT '0;0' COMMENT 'Imprimer'",
        "detail" => "varchar(255) DEFAULT '0;0' COMMENT 'Détail'",
        "act_id" => "varchar(255) DEFAULT '0;0' COMMENT 'act_id'",
        "act_refgin" => "varchar(255) DEFAULT '0;0' COMMENT 'N° Doc'",
        "act_bl" => "varchar(255) DEFAULT '0;0' COMMENT 'N° BL'",
        "act_dos" => "varchar(255) DEFAULT '0;0' COMMENT 'N° Dossier'",
        "act_refcli" => "varchar(255) DEFAULT '0;0' COMMENT 'Réf Client'",
        "act_refchg" => "varchar(255) DEFAULT '0;0' COMMENT 'Réf Chgt'",
        "act_refliv" => "varchar(255) DEFAULT '0;0' COMMENT 'Réf Liv'",
        "act_affaire" => "varchar(255) DEFAULT '0;0' COMMENT 'Affaire'",
        "ttrs_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Transport'",
        "ttrs_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Transport'",
        "ttemp_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Température'",
        "ttemp_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Température'",
        "tact_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Activité'",
        "tact_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Activité'",
        "natm_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Nat Marchandise'",
        "natm_lib" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Nat Marchandise'",
        "act_nom_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Nom Dest'",
        "act_pay_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Pays Dest'",
        "act_dep_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Dpt Dest'",
        "act_vil_dest" => "varchar(255) DEFAULT '0;0' COMMENT 'Ville Dest'",
        "act_nom_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Nom Exp'",
        "act_pay_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Pays Exp'",
        "act_dep_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Dpt Exp'",
        "act_vil_exp" => "varchar(255) DEFAULT '0;0' COMMENT 'Ville Exp'",
        "act_date_liv" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Liv'",
        "act_date_liv_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Liv Réelle'",
        "act_date_chg" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt'",
        "act_date_chg_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Chgt Réelle'",
        "act_heure_liv" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv'",
        "act_heure_liv_fin" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Liv'",
        "act_heure_liv_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Liv Réelle'",
        "act_heure_chg" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt'",
        "act_heure_chg_fin" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Fin Chgt'",
        "act_heure_chg_reel" => "varchar(255) DEFAULT '0;0' COMMENT 'Heure Chgt Réelle'",
        "act_nombre_colis" => "varchar(255) DEFAULT '0;0' COMMENT 'Colis'",
        "act_poids" => "varchar(255) DEFAULT '0;0' COMMENT 'Poids (kg)'",
        "act_palettes" => "varchar(255) DEFAULT '0;0' COMMENT 'Palettes'",
        "act_palettes_eur" => "varchar(255) DEFAULT '0;0' COMMENT 'Palettes EUR'",
        "act_m3" => "varchar(255) DEFAULT '0;0' COMMENT 'M3'",
        "act_plancher" => "varchar(255) DEFAULT '0;0' COMMENT 'ML'",
        "act_qte_spec" => "varchar(255) DEFAULT '0;0' COMMENT 'Qté Spécifique'",
        "act_unite_spec" => "varchar(255) DEFAULT '0;0' COMMENT 'Unite Spécifique'",
        "edi_code" => "varchar(255) DEFAULT '0;0' COMMENT 'Code EDI'",
        "poin_libelle" => "varchar(255) DEFAULT '0;0' COMMENT 'Lib. Pointage'",
        "poin_date" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Pointage'",
        "act_obs" => "varchar(255) DEFAULT '0;0' COMMENT 'Obs Générales'",
        "act_obs_chg" => "varchar(255) DEFAULT '0;0' COMMENT 'Obs Chgt'",
        "act_obs_liv" => "varchar(255) DEFAULT '0;0' COMMENT 'Obs Liv'",
        "act_agence" => "varchar(255) DEFAULT '0;0' COMMENT 'Code Agence'",
        "act_agence_nom" => "varchar(255) NOT NULL DEFAULT '0;0' COMMENT 'Agence'",
        "document_url" => "varchar(255) DEFAULT '0;0' COMMENT 'Doc Scanné'",
        "fac_infos" => "varchar(255) DEFAULT '0;0' COMMENT 'Infos Facture'",
        "vte_ht_net" => "varchar(255) DEFAULT '0;0' COMMENT 'CA HT'",
        "ach_tiers_livreur" => "varchar(255) DEFAULT '0;0' COMMENT 'Prestataire'",
        "act_date_creation" => "varchar(255) DEFAULT '0;0' COMMENT 'Date Création'",
        "fac_id" => "varchar(255) DEFAULT '0;0' COMMENT 'Id facture'",
        "act_affret" => "varchar(255) DEFAULT '0;0' COMMENT 'Affrêtement'"
    ],
    "recep" => [
        "recep_id" => "int(11) NOT NULL AUTO_INCREMENT",
        "act_id" => "int(11) NOT NULL DEFAULT '0'",
        "com_code" => "varchar(25) NOT NULL DEFAULT ''",
        "fac_id" => "int(11) NOT NULL",
        "act_refgin" => "varchar(255) DEFAULT NULL",
        "act_bl" => "varchar(255) DEFAULT NULL",
        "act_dos" => "varchar(255) DEFAULT NULL",
        "act_refcli" => "varchar(255) DEFAULT NULL",
        "act_refchg" => "varchar(255) DEFAULT NULL",
        "act_refliv" => "varchar(255) DEFAULT NULL",
        "act_affret" => "binary(1) DEFAULT NULL",
        "act_affaire" => "varchar(255) DEFAULT NULL",
        "ttrs_code" => "varchar(4) DEFAULT NULL",
        "ttrs_lib" => "varchar(255) DEFAULT NULL",
        "ttemp_code" => "varchar(4) DEFAULT NULL",
        "ttemp_lib" => "varchar(255) DEFAULT NULL",
        "tact_code" => "varchar(4) DEFAULT NULL",
        "tact_lib" => "varchar(255) DEFAULT NULL",
        "natm_code" => "varchar(6) DEFAULT NULL",
        "natm_lib" => "varchar(255) DEFAULT NULL",
        "act_nom_dest" => "varchar(255) DEFAULT NULL",
        "act_pay_dest" => "varchar(255) DEFAULT NULL",
        "act_dep_dest" => "varchar(255) DEFAULT NULL",
        "act_vil_dest" => "varchar(255) DEFAULT NULL",
        "act_nom_exp" => "varchar(255) DEFAULT NULL",
        "act_pay_exp" => "varchar(255) DEFAULT NULL",
        "act_dep_exp" => "varchar(255) DEFAULT NULL",
        "act_vil_exp" => "varchar(255) DEFAULT NULL",
        "act_date_liv" => "date DEFAULT NULL",
        "act_date_liv_reel" => "date DEFAULT NULL",
        "act_date_chg" => "date DEFAULT NULL",
        "act_date_chg_reel" => "date DEFAULT NULL",
        "act_heure_liv" => "time DEFAULT NULL",
        "act_heure_liv_fin" => "time DEFAULT NULL",
        "act_heure_liv_reel" => "time DEFAULT NULL",
        "act_heure_chg" => "time DEFAULT NULL",
        "act_heure_chg_fin" => "time DEFAULT NULL",
        "act_heure_chg_reel" => "time DEFAULT NULL",
        "act_nombre_colis" => "int(10) DEFAULT NULL",
        "act_poids" => "decimal(10,2) DEFAULT NULL",
        "act_palettes" => "int(10) DEFAULT NULL",
        "act_palettes_eur" => "int(10) DEFAULT NULL",
        "act_m3" => "decimal(10,3) DEFAULT NULL",
        "act_plancher" => "decimal(10,2) DEFAULT NULL",
        "act_qte_spec" => "decimal(10,2) DEFAULT NULL",
        "act_unite_spec" => "varchar(50) DEFAULT NULL",
        "edi_code" => "varchar(10) DEFAULT NULL",
        "poin_libelle" => "varchar(255) NOT NULL",
        "poin_date" => "date NOT NULL",
        "act_obs" => "varchar(255) DEFAULT NULL",
        "act_obs_chg" => "varchar(255) DEFAULT NULL",
        "act_obs_liv" => "varchar(255) DEFAULT NULL",
        "act_agence" => "int(11) NOT NULL",
        "act_agence_nom" => "varchar(255) NOT NULL",
        "document_url" => "varchar(255) NOT NULL",
        "fac_infos" => "varchar(500) NOT NULL COMMENT 'format: num_facture|JJ/MM/AA|[num_facture|JJ/MM/AA]'",
        "vte_ht_net" => "decimal(7,2) NOT NULL",
        "ach_tiers_livreur" => "varchar(50) NOT NULL",
        "act_date_creation" => "date DEFAULT NULL"
    ],
    "recep_facture" => [
        "recep_facture_id" => "int(11) NOT NULL AUTO_INCREMENT",
        "act_id" => "int(11) NOT NULL",
        "fac_id" => "int(11) NOT NULL"
    ],
    "societe" => [
        "societe_id" => "int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de la société'",
        "societe_nom" => "varchar(255) DEFAULT NULL COMMENT 'Nom de la société'",
        "societe_logo" => "varchar(1500) DEFAULT NULL COMMENT 'Chemin du logo de la société'",
        "societe_param_facture" => "varchar(255) NOT NULL DEFAULT '0' COMMENT 'Affichage de la recherche des factures'",
        "societe_param_recepisse" => "varchar(255) NOT NULL DEFAULT '0' COMMENT 'Affichage de la recherche des récépissés'"
    ],
    "statistiques" => [
        "id" => "int(11) NOT NULL AUTO_INCREMENT",
        "date" => "datetime NOT NULL DEFAULT '0000-00-00 00:00:00'",
        "page" => "varchar(250) NOT NULL DEFAULT ''",
        "ip" => "varchar(15) NOT NULL DEFAULT ''",
        "host" => "varchar(60) NOT NULL DEFAULT ''",
        "navigateur" => "varchar(255) NOT NULL",
        "referer" => "varchar(250) NOT NULL DEFAULT ''",
        "com_code" => "varchar(25) NOT NULL DEFAULT '0'"
    ],
    "visualisation" => [
        "visu_id" => "int(11) NOT NULL AUTO_INCREMENT",
        "num_action" => "int(11) NOT NULL",
        "code_action" => "varchar(1) NOT NULL",
        "visu_date" => "date NOT NULL",
        "com_code" => "varchar(25) NOT NULL"
    ]
];