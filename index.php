<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Votacion</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <h1>FORMULARIO DE VOTACIÓN:</h1>
    <form  action="conexion.php" method="post">
      <label>
        Nombre y Apellido   
        <input type="text" id="Nombre" name="Nombre"/>
      
      </label>
    
      <label id="Aliasst">Alias <input type="text" id="Alias" name="Alias" /></label>
      <label id="Rutst">Rut <input type="text" id="Rut" name="Rut" /></label>
      <label>
        Email <input type="email" id="Email" name="Email" />
        <span class="error-message" id="emailError"></span>
      </label>
      <label id="Reg"> Región <select id="Región" name="Region" onchange="fetchData()">
         <option value = ""> </option>
         <?php
          $servername ="localhost";
          $username = "Masao";
          $password = "12345678"; 
          $database = "diagnostico";

          $conn = new mysqli($servername, $username, $password, $database);

          if ($conn->connect_error) {
            die("Error de conexion". $conn->connect_error);
          
          }

          $sql = "select id_region, nombre, numero from region";
          $resultado = $conn->query($sql);

          if ($resultado->num_rows > 0) {
            while ($dato = $resultado->fetch_assoc()) {
              echo "<option value ='". $dato["id_region"]. "'>" . $dato["nombre"] ." ". $dato["numero"] ."</option>";
           }
          }else{
            echo "<option value=''>No hay opciones disponibles</option>";
          }
            $conn->close();

         ?>
          </select>
        </label>
      <label id="Com">Comuna<select id="Comuna" name ="Comuna">
        <option value=""></option>
        </select></label>
      <label id="Can">Candidato<select id="Candidato" name="Candidato">
      <option value = "">  </option>
         <?php
          $servername ="localhost";
          $username = "Masao";
          $password = "12345678"; 
          $database = "diagnostico";

          $conn = new mysqli($servername, $username, $password, $database);

          if ($conn->connect_error) {
            die("Error de conexion". $conn->connect_error);
          
          }

          $sql = "select id_candidatos, nombre from candidatos";
          $resultado = $conn->query($sql);

          if ($resultado->num_rows > 0) {
            while ($dato = $resultado->fetch_assoc()) {
              echo "<option value ='". $dato["id_candidatos"]. "'>" . $dato["nombre"] . "</option>";
           }
          }else{
            echo "<option value=''>No hay opciones disponibles</option>";
          }
            $conn->close();

         ?>
        </select></label>
      <label id="Como"><div id="Entero">Como se entero de nosotros</div>
        <label>
          <input type="checkbox" class="opcion" name="Web" value="Web" /> Web
        </label>
        <label>
          <input type="checkbox" class="opcion" name="TV" value="TV" /> TV
        </label>
        <label>
          <input type="checkbox" class="opcion" name="Redes_Sociales" value="Redes_sociales" /> Redes sociales
        </label>
        <label>
          <input type="checkbox" class="opcion" name="Amigo" value="Amigo" /> Amigo
        </label>
      </label>
      <button type="submit" id="Votar" disabled>Votar</button>
    </form>

    <script>
      const Nombre = document.getElementById("Nombre");
      const Alias = document.getElementById("Alias");
      const Rut = document.getElementById("Rut");
      const Email = document.getElementById("Email");
      const Region = document.getElementById("Región");
      const Comuna = document.getElementById("Comuna");
      const Candidato = document.getElementById("Candidato");
      const opciones = document.querySelectorAll(".opcion");
      const boton = document.getElementById("Votar");

      Nombre.addEventListener("input", toggleButton);
      Alias.addEventListener("input", toggleButton);
      Rut.addEventListener("input", toggleButton);
      Email.addEventListener("input", toggleButton);
      Region.addEventListener("input", toggleButton);
      Comuna.addEventListener("input", toggleButton);
      Candidato.addEventListener("input", toggleButton);
      opciones.forEach(opcion =>
        opcion.addEventListener("change", toggleButton)
      );

      function toggleButton() {
        const Campos =
          Nombre.value.trim() !== "" &&
          Alias.value.trim() !== "" &&
          Rut.value.trim() !== "" &&
          Email.value.trim() !== "" &&
          Region.value.trim() !== "" &&
          Comuna.value.trim() !== "" &&
          Candidato.value.trim() !== "";
        const Eleccion = [...opciones].some(opcion => opcion.checked);
        if (Campos && Eleccion) {
          boton.removeAttribute("disabled");
        } else {
          boton.setAttribute("disabled", "disabled");
        }
      }
    </script>
   
   <script>
    function validarRut(rut) {
     
    

    document.getElementById('rut').addEventListener('input', function() {
      const rutInput = this.value.trim();
      const mensajeRut = document.getElementById('mensajeRut');

      if (validarRut(rutInput)) {
        mensajeRut.textContent = 'RUT válido';
        mensajeRut.style.color = 'green';
      } else {
        mensajeRut.textContent = 'RUT inválido';
        mensajeRut.style.color = 'red';
      }
    })};
  </script>

<script>
        function fetchData() {
            // Obtener el valor seleccionado en el primer select
            var value = document.getElementById("Región").value;

            // Realizar una solicitud AJAX al servidor
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "getselect.php?value=" + value, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // Actualizar el contenido del segundo select con las opciones recibidas
                    document.getElementById("Comuna").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
  </body>
</html>
