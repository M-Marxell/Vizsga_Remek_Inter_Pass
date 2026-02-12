<?php
    session_start();
?>
<!--TODO: Ha nem vagy bejelentkezve, akkor hibát dob-->
<?php
if (!isset($_SESSION['username'])) {
    die("Hiba: Nem vagy bejelentkezve!");
}
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>BEJELENTKEZTÉL!!!</h1>
    <?php
    echo $_SESSION['username'];

    ?>
    
</body>
</html>