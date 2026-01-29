<?php
/* * NullSector - Data Collection Gate
 * Operator: GhostByte
 */

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

// Gelen veriyi yakala
$data = file_get_contents('php://input');
$decoded = json_decode($data, true);

if ($decoded) {
    $log_entry = "[" . date("Y-m-d H:i:s") . "] Sector: " . $decoded['status'] . " | IP: " . $_SERVER['REMOTE_ADDR'] . "\n";
    
    // Gelen veriyi logs.txt dosyasına kaydet
    file_put_contents("logs.txt", $log_entry, FILE_APPEND);
    
    echo json_encode(["status" => "success", "message" => "Data synchronized to 85.111.76.66"]);
} else {
    echo json_encode(["status" => "error", "message" => "No sector data received"]);
}
?>
