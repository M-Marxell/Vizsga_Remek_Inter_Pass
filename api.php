<?php
header('Content-Type: application/json; charset=utf-8');

// Kapcsolódás az adatbázishoz (XAMPP alapértelmezés: root jelszó nélkül)
$conn = new mysqli('localhost', 'root', '', 'esemenyek');

if ($conn->connect_error) {
    die(json_encode(["error" => "Sikertelen kapcsolódás"]));
}

$conn->set_charset("utf8mb4");
$result = $conn->query("SELECT * FROM esemeny_lista");

$esemenyek = [];
while($row = $result->fetch_assoc()) {
    $esemenyek[] = $row;
}

echo json_encode($esemenyek);
$conn->close();
?>