<?php
header('Content-Type: application/json; charset=utf-8');


$host = 'localhost';
$db   = 'esemenyek';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Adatbázis hiba: ' . $e->getMessage()]);
    exit;
}

// Ebben a példában feltételezzük, hogy a 2-es ID-jű felhasználó (pl. demo1) van bejelentkezve
$bejelentkezett_user_id = 2; 


// Lekérjük a felhasználó saját jegyeit és az események adatait
$stmt = $pdo->prepare("
    SELECT e.alkalom_neve, e.datum 
    FROM jegyek j 
    JOIN esemenyek e ON j.esemeny_id = e.id 
    WHERE j.user_id = ?
");
$stmt->execute([$bejelentkezett_user_id]);
$sajat_jegyek = $stmt->fetchAll();


// Lekérjük a jövőbeni eseményeket, dátum szerint sorbarendezve (legközelebbi van elöl)
$stmt = $pdo->query("
    SELECT alkalom_neve, datum 
    FROM esemenyek 
    WHERE datum >= NOW() 
    ORDER BY datum ASC 
    LIMIT 3
");
$kozelgo = $stmt->fetchAll();


// Lekérünk véletlenszerű eseményeket (RAND()), amiket ajánlunk a felhasználónak
$stmt = $pdo->query("
    SELECT alkalom_neve, datum 
    FROM esemenyek 
    ORDER BY RAND() 
    LIMIT 3
");
$ajanlott = $stmt->fetchAll();

// A kinyert adatokat összecsomagoljuk és elküldjük JSON formátumban
echo json_encode([
    'sajat_jegyek' => $sajat_jegyek,
    'kozelgo' => $kozelgo,
    'ajanlott' => $ajanlott
]);
?>
