<?php
$dsn = 'mysql:host=localhost;dbname=diagnostico';
$username = "Masao";
$password = "12345678";


try {
    $conn= new PDO($dsn, $username, $password);
   


$region_id = $_GET['value'];


$sql = "SELECT id_comuna, nombre FROM comuna WHERE id_region = :value";


$stmt = $conn->prepare($sql);
$stmt->bindParam(':value', $region_id);
$stmt->execute();


    $options = "<option value=''></option>";
    while ($dato = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $options .= "<option value='" . $dato['id_comuna'] . "'>" . $dato['nombre'] . "</option>";
    }

    echo $options;
} catch (PDOException $e) {
    die("Error al obtener las comunas: " . $e->getMessage());
}

$conn = null;