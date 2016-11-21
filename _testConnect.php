<?php

$host = $_POST["host"];
$user = $_POST["user"];
$pass = $_POST["pass"];
$name = $_POST["name"];
$port = $_POST["port"];

try{

    $server = new mysqli($host,$user,$pass,$name,$port);

} catch (Exception $e){

    exit(json_encode([
        "success" => false,
        "error" => $e->getMessage(),
        "data" => null
    ]));

}

if ($server->connect_errno){
    exit(json_encode([
        "success" => false,
        "error" => $server->connect_error,
        "data" => null
    ]));
}

exit(json_encode([
    "success" => true,
    "error" => null,
    "data" => null
]));