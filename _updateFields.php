<?php

$baseTable = include $_POST["structure"];
$sqlQuery = explode(";\r", file_get_contents("db_new_site.sql"));
$host = $_POST["host"];
$user = $_POST["user"];
$pass = $_POST["pass"];
$name = $_POST["name"];
$port = $_POST["port"];
$response = "";

$server = new mysqli($host, $user, $pass, $name, $port);

if ($server->connect_errno) {
    exit(json_encode([
        "success" => false,
        "error" => $server->connect_error,
        "data" => null
    ]));
}

// Initialisation de l'encode pour éviter les problèmes d'accent dans la base
$server->set_charset('utf8');

// Récupérer le schema des tables de la base $name
$query = "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$name'";

$resQuery = $server->query($query);

if (is_bool($resQuery)) {
    exit(json_encode([
        "success" => false,
        "error" => $server->error,
        "data" => null
    ]));
}

$tablesTmp = $resQuery->fetch_all(MYSQLI_ASSOC);
$resQuery->free();
$tables = [];
foreach ($tablesTmp as $index => $fields) {
    $tables[$fields["TABLE_NAME"]] = $fields["ENGINE"];
}

// Si aucune table n'est présente dans la base
if (count($tables) == 0) {
    foreach ($sqlQuery as $index => $queryFile) {
        if (substr_count($queryFile, "CREATE") > 0) {
            //echo $table." ".substr_count($queryFile,$table). " | " . $queryFile;
            $resQuery = $server->query($queryFile);
            if (!$resQuery) {
                exit(json_encode([
                    "success" => false,
                    "error" => $server->error . " | " . $queryFile,
                    "data" => null
                ]));
            }
            // On récupère le nom de la table
            $nomTable = explode("`", $queryFile)[1];
            $response .= "Création de la table '$nomTable' et de ses champs<br/>";
        }
    }
    exit(json_encode([
        "success" => true,
        "error" => null,
        "data" => $response
    ]));
}

$i = 0;
// On parcour toutes les tables du fichier strucure
foreach ($baseTable as $table => $champs) {

    // Si on ne trouve pas la table
    if (!array_key_exists($table, $tables)) {
        foreach ($sqlQuery as $index => $queryFile) {
            if (substr_count($queryFile, $table) > 0) {
                //echo $table." ".substr_count($queryFile,$table). " | " . $queryFile;
                $resQuery = $server->query($queryFile);
                if (!$resQuery) {
                    exit(json_encode([
                        "success" => false,
                        "error" => $server->error . " | " . $queryFile,
                        "data" => null
                    ]));
                }
                $response .= "Création de la table '$table' et de ses champs<br/>";
                break;
            }
        }
        // Sinon on vérifie les champs de la table
    } else {
        $query = "SHOW FULL COLUMNS FROM $table";
        $resQuery = $server->query($query);
        if (is_bool($resQuery)) {
            exit(json_encode([
                "success" => false,
                "error" => $server->error . " | " . $query,
                "data" => null
            ]));
        }
        $champsBaseTmp = $resQuery->fetch_all(MYSQLI_ASSOC);
        $champsBase = [];
        foreach ($champsBaseTmp as $item => $value) {
            $champsBase[$value["Field"]] = $value["Type"];
        }
        $resQuery->free();

        // On recherche si le champ existe sur la table de la base
        $i2 = 0;
        foreach ($champs as $champ => $type) {
            //var_dump($champsBase,$champ);
            if (!array_key_exists($champ, $champsBase)) {
                $query = "ALTER TABLE $table ADD $champ $type";
                $resQuery = $server->query($query);
                if (!$resQuery) {
                    exit(json_encode([
                        "success" => false,
                        "error" => $server->error . " | " . $query,
                        "data" => null
                    ]));
                }
                $response .= "$table -> $champ -> $type<br/>";
            }
            $i2++;
        }
    }
    $i++;
}
exit(json_encode([
    "success" => true,
    "error" => null,
    "data" => $response
]));