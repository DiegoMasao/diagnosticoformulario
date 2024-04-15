<?php
$servername = "localhost";
$username = "Masao";
$password = "12345678";
$database = "diagnostico";




  function validarRut($rut) {
 
    if (!preg_match('/^\d{1,8}-[\dkK]$/', $rut)) {
        return false;
    }

 
    list ($rutCompleto, $digitoVerificador) = explode('-', $rut);
    $rutNumeros = str_replace('.', '', $rutCompleto);

   
    $suma = 0;
    $multiplicador = 2;
    for ($i = strlen($rutNumeros) - 1; $i >= 0; $i--) {
        $suma += intval($rutNumeros[$i]) * $multiplicador;
        $multiplicador = $multiplicador === 7 ? 2 : $multiplicador + 1;
    }
    $resto = $suma % 11;
    $dvEsperado = $resto === 0 ? 0 : 11 - $resto;

  
    $dv = strtolower($digitoVerificador) === 'k' ? 10 : intval($digitoVerificador);
    return $dv === $dvEsperado;

   
    
  }
  
  $rutValido = "12345678-9";
  $rutInvalido = '12345678-0';

  var_dump(validarRut($rutValido)); //devuelve true
  var_dump(validarRut($rutInvalido)); //devuelve false


try { 
  
  $conn = new PDO("mysql:host=$servername;dbname=$database;charset=utf8", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
  

 

  
  $nombre_apellido = $_POST["Nombre"];
  $alias = $_POST["Alias"];
  $rut = $_POST["Rut"];
  $email = $_POST["Email"];
  $region = $_POST["Region"];
  $comuna = $_POST["Comuna"];
  $candidato = $_POST["Candidato"];$web = isset($_POST['Web']) ? 1 : 0;
  $tv = isset($_POST['TV']) ? 1 : 0;
  $redes_sociales = isset($_POST['Redes_Sociales']) ? 1 : 0;
  $amigo = isset($_POST['Amigo']) ? 1 : 0;
  error_log ("\nmensaje de error\n", 3, 'archivo.log');


  
  
  if(!validarRut($rut)) {
    die("Error: El Rut ingresado no es valido");
  }
  
  $consulta_rut = "select * from votacion where rut = '$rut'";
  $resultado_rut = $conn -> query($consulta_rut);
  
  
  if($resultado_rut -> rowCount() > 0){
    die("Error: el Rut ya esta ingresado");
    
  }
  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      die("Error:El correo ingresado no es valido");
  } 
      
  
  
  
  $consulta_email = "select * from votacion where email = '$email'";
  $result_email = $conn -> query($consulta_email);
  
  if($result_email->rowCount()> 0 ){
     die("Error: el Email ya esta ingresado");
 
    }
    $sql = "INSERT INTO votacion (nombre_apellido, alias, rut, email, region, comuna, candidato, web, tv, redes, amigo)
    VALUES ('$nombre_apellido', '$alias', '$rut', '$email', '$region', '$comuna', '$candidato', '$web', '$tv', '$redes_sociales', '$amigo')";;

$conn->query($sql);

  }catch (PDOException $e) {
 
}


$conn = null;

header("Location: index.php");

