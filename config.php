<?php
$host = "localhost";
$user = "root";
$pass = ""; // ha XAMPP alatt nincs jelszó
$dbname = "esemenyek";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Adatbázis hiba: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");
?>
