<?php

error_reporting(-1);

include 'config.php';

$sql = "select * from markers";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->query($sql);  
	$markers= $stmt->fetchAll(PDO::FETCH_OBJ);
	$dbh = null;
	//echo '{"markers":'. json_encode($markers) .'}'; 
    
   // echo '{"connor":'. json_encode($markers) .'}'; 
    
    $result = array( 'markers' => $markers, 'connor' => $markers );
    
    echo json_encode( $result );
    
    
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}


?>