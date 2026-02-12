<?php
    session_start();
?>
<!--TODO: Ha nem vagy bejelentkezve, akkor hibát dob...javítva ,,,, ennek function hogy egyből a login pagre dobjon. meg van.. interpass home page ide -->
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