<?php 

//desabilita o limite de memória
ini_set('memory_limit', '-1');

$mysqli = new mysqli("localhost", "root", "", "georreferenciamento");

// Verifica a conexão
if (mysqli_connect_errno()) {
  echo "Erro ao conectar com o MySQL: " . mysqli_connect_error();
}

//  @param: $id_usuario -> id do usuário âncora
$id_usuario = $_GET['id_usuario_ancora'];

//  @param: $alcance  -> variável em KM que deseja que a busca alcance
$alcance = 10;  //10 km

//  @param: selectRaw  -> variável que armazenará a query de geo-referencia
$selectRaw = '';

// @param: havingRaw -> variável que armazenará a query ' having ',
//que selecionará os usuários com base no @param: $alcance
$havingRaw = '';

//  aqui capturo a latitude e longitude do usuário âncora
$sql = "SELECT * 
    FROM usuarios
    INNER JOIN cadastros ON usuarios.id = cadastros.id_usuario
    WHERE usuarios.id = " . $id_usuario;

$query1 = $mysqli->query($sql);
$cadastro = $query1->fetch_assoc();

$latitude = (float)$cadastro['latitude'];
$longitude = (float)$cadastro['longitude'];

// populo o @param: $selectRaw com a query de geo-referencia
// esta query retorna um alias: distancia_km ( Double )
// retorna distancia do usuário âncora em relação ao referente usuário da row
$selectRaw .= '
     ( ROUND( ( ( (
        acos(
           sin( (cadastros.latitude * pi() / 180) ) * sin( (' . $latitude . ' * pi() / 180) )
           +
           cos( (cadastros.latitude * pi() / 180) ) * cos( (' . $latitude . ' * pi() / 180) )
           *
           cos( ( (cadastros.longitude - ' . $longitude . ') * pi () / 180 ) )
       )
   )  *  180 / pi() ) * 60 * 1.853159616 ), 4) ) AS distancia_km
   ,
';

// populo o @param: $havingRaw com a query having
// ela faz um IF que veriica se o usuário da row
// está dentro do raio de alcance @param: $alcance
$havingRaw .= '
     HAVING (
           if (
                distancia_km <= "' . $alcance . '",
                true,
                false
           )
      )
';

//  @param: queryAlcance -> variável que armazenará a query geral
//  está query une todos os @param para trazer os usuários corretos
//  com base nos usuários presentes no raio de X Km

$sql2 = '
        SELECT
        ' . $selectRaw . '
        cadastros.*, usuarios.*
        FROM cadastros
        INNER JOIN usuarios ON usuarios.id = cadastros.id_usuario
        WHERE
        usuarios.id  !=  ' . $id_usuario . '
       ' . $havingRaw  . '';

$query2 = $mysqli->query($sql2);

// obs.:  o trecho da query:
// usuarios.id  !=  ' . $id_usuario . '
// exclui da listagem o próprio usuário âncora

// captura o total de usuários encontrados na geo-referencia
$queryAlcance = $query2->fetch_all();
$totalAlcance = ($queryAlcance) ? count($queryAlcance) : 0;

if  ( $totalAlcance  > 0 ) {

  //mosta o array com os usuários encontrados
  $resultado = array();

  echo json_encode($queryAlcance);

} else  {
  echo 'Nenhum usuário encontrado.';
}

mysqli_close($mysqli);

?>