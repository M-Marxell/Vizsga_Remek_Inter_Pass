
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="Login_Page_Style.css">
    <link href='https://cdn.boxicons.com/fonts/basic/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <div class="wrapper">
        <form action="Login_Page_index.php" method="post">
            
            <h1>Login</h1>
            
            <div class="input-box">
                <input type="text" name="username" placeholder="Username" required>
                <i class='bxr  bx-user'  ></i> 
            </div>
            
            <div class="input-box">
                <input type="password" name="password" placeholder="Password" required>
                <i class='bxr  bx-lock'  ></i> 
            </div>
            
            <div class="remember-forgot">
                <label><input type="checkbox">Remember me</label>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="btn">Login</button>
            
            <div class="register-link">
                <p>Dont have an account? <a href="Register_Page_index.php">Register</a></p>
            </div>
        
        </form>
    </div>

    
<script src="Login_Page_Source.js"></script>
</body>
</html>

<?php
session_start();
require 'config.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($username === '' || $password === '') {
        die("Minden mező kötelező.");
    }

    // felhasználó lekérdezése
    $stmt = $conn->prepare("SELECT id, username, jelszo_hash FROM users WHERE username = ?");
    if (!$stmt) {
        die("Hiba a lekérdezés előkészítésekor: " . $conn->$error);
    }

    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows === 1) {
        $stmt->bind_result($id, $db_username, $db_hash);
        $stmt->fetch();

        if (password_verify($password, $db_hash = "")) { // jelszó ellenőrzés[web:38][web:41]
            $_SESSION['user_id'] = $id;
            $_SESSION['username'] = $db_username;
            header("Location: interpasshomepage.html"); // ide mehet a főoldal
            exit;
        } else {
            echo "Hibás jelszó.";
        }
    } else {
        echo "Nincs ilyen felhasználó.";
    }

    $stmt->close();
}
?>
