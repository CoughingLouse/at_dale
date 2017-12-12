<?php
header('Content-type: text/xml');

include("access_data.php");
$mysqli 	= new mysqli($host,$userdb,$passworddb,$namedb);
$query = "SELECT immobili.* ,lang_ru.* FROM immobili JOIN lang_ru ON immobili.id=lang_ru.id_immobile WHERE immobili.id = 1609 AND visibilita LIKE '%-%-1'";
$result 	= $mysqli->query($query);
$risultati = array();
$num = 0;

while ($row = mysqli_fetch_array($result,MYSQLI_BOTH)) {
	array_push($risultati, $row);
	$num++;
}

$id = array_column($risultati,'id');
$cod_rif = array_column($risultati,'cod_rif');
$titolo = array_column($risultati,'titolo');
$tipo_immobile = array_column($risultati,'tipo_immobile');
$sottotipo_immobile = array_column($risultati,'sottotipo_immobile');
$regione = array_column($risultati,'regione');
$citta = array_column($risultati,'citta');
$descrizione = array_column($risultati,'descrizione');
$prezzo_min = array_column($risultati,'prezzo_min');
$prezzo_max = array_column($risultati,'prezzo_max');
$prezzo_richiesta = array_column($risultati,'prezzo_richiesta');
$bagni = array_column($risultati,'bagni');
$camere = array_column($risultati,'camere');
$superficie = array_column($risultati,'superficie');
$superficie_terreno = array_column($risultati,'superficie_terreno');
$condizioni = array_column($risultati,'condizioni');
$classe_energetica = array_column($risultati,'classe_energetica');
$accessori = array_column($risultati,'accessori');
$visualizzazione = array_column($risultati,'visualizzazione');
$territorio = array_column($risultati,'territorio');
$gmap = array_column($risultati,'gmap');
$link_video = array_column($risultati,'link_video');

$distanze = array_column($risultati,'distanze');

$description = preg_replace('/<[^>]*>/', '', $descrizione[0]);



$headerDoc = '<temp>' . html_entity_decode($description,null, "UTF-8") . '</temp>';
$xmlHeader = new SimpleXMLElement($headerDoc);


$xmlstr = <<<XML
<?xml version='1.0' standalone='yes'?>
<Properties>
 <Property>
  <title>$titolo[0]</title>
  <region>$regione[0]</region>
  <description>$xmlHeader</description>
 </Property>
</Properties>
XML;

//$xml = new SimpleXMLElement($xmlstr);
echo $xmlstr;
//echo $xml->asXML("palazzo.xml");
//echo $xml;
?>
