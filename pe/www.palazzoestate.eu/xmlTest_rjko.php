<?php
header('Content-type: text/xml');

include("access_data.php");
$mysqli	= new mysqli($host,$userdb,$passworddb,$namedb);
$query = "SELECT immobili.* ,lang_ru.* FROM immobili JOIN lang_ru ON immobili.id=lang_ru.id_immobile WHERE immobili.id=1609 AND visibilita LIKE '%-%-1'";
$result	= $mysqli->query($query);

$risultati = array();
$num = 0;
while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)){
	array_push($risultati, $row);
	$num++;
}

// HOOK COLONNE DAL DB
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
// *FINE* HOOK COLONNE DAL DB

$headerDoc = '<temp>'.html_entity_decode($description, null, "UTF-8").'</temp>';
$xmlHeader = new SimpleXMLElement($headerDoc);

// XML TEMPLATE PER LE PROPERTIES, CHE NOI CHIAMIAMO IN PARTE 'ACCESSORI'
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

/* i prossimi template sono string perchè non so se si può usare replace()
			su un oggetto XML
*/
// TEMPLATE OBJECT
$template_object = "
<object>
	<id>#id#</id>
	<language_id>#language_id#</language_id>
	<object_id>#object_id#</object_id>
	<type_id>#type_id#</type_id>
	<object_status>#object_status#</object_status>
	<country_id>#country_id#</country_id>

	<region_id>#region_id#</region_id>
	<district_id>#district_id#</district_id>
	<district>#district#</district>
	<address>#address#</address>
	<longitude>#longitude#</longitude>
	<latitude>#latitude#</latitude>

	<currency_id>#currency_id#</currency_id>

 	<price>#price#</price>
	<price_per_meter>#price_per_meter#</price_per_meter>
	<price_day>#price_day#</price_day>
	<price_week>#price_week#</price_week>
	<price_month>#price_month#</price_month>
	<not_show_price>#not_show_price#</not_show_price>

	<rooms>#rooms#</rooms>
	<bedrooms>#bedrooms#</bedrooms>
	<bathrooms>#bathrooms#</bathrooms>

	<square>#square#</square>
	<square_land>#square_land#</square_land>
	<square_land_unit>#square_land_unit#</square_land_unit>

	<floor>#floor#</floor>
	<total_floor>#total_floor#</total_floor>

	<building_type>#building_type#</building_type>
	<building_date>#building_date#</building_date>
	<contact_id>#contact_id#</contact_id>

	<specialtxt>#specialtxt#</specialtxt>
	<description><![CDATA[ #description# ]]></description>

	#properties#
	#images#
	#videos#
";

// TEMPLATE 'PROPERTIES'
$template_properties = "<property>
	<property_id>#property_id#</property_id>
	<property_value_enum>#property_value_enum#</property_value_enum>
	<property_value>#property_value#</property_value>
	<property_value_unit>#property_value_unit#</property_value_unit>
</property>
";

// TEMPLATE 'VIDEO'
$template_video = "<video>
	<filename>#video_filename_url_flv#</filename>
	<middle_filename>#video_moddle_filename#</middle_filename>
</video>";

// TEMPLATE 'IMAGE'
$template_image = "<image>
	<filename>#image_filename#</filename>
	<iorder>#image_iorder#</iorder>
</image>";

// ZONA TEST
$toxml = $template_object;
echo '<root><objects>';
$toxml = str_replace("#id#", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);
$toxml = str_replace("##", , $toxml);


echo '</objects></root>';












//$xml = new SimpleXMLElement($xmlstr);
//echo $xmlstr;
//echo $xml->asXML("palazzo.xml");
//echo $xml;
?>
