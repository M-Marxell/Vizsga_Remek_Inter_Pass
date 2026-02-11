<?php
    session_start();
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