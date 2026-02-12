<?php
    session_start();
?>
    
<?php
if (!isset($_SESSION['username'])) {
    header("Location: Login_Page_index.php");
    exit;
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
    
    <?php
    header("Location: interpasshomepage.html");
    exit;
    ?>
    
</body>
</html>