
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="Register_Page_style.css">
    <link href='https://cdn.boxicons.com/fonts/basic/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <div class="wrapper">
        <form action="Register_Page_index.php" method="post">
            
            <h1>Register</h1>
            
            <div class="input-box">
                <input type="text" name="username" placeholder="Username" required>
                <i class='bxr  bx-user'  ></i> 
            </div>
            
            <div class="input-box">
                <input type="text" name="email" placeholder="Email" required>
                <i class='bxr  bx-paper-plane'  ></i>
             </div>
            
            <div class="input-box">
                <input type="password" name="password" placeholder="Password" required>
                <i class='bxr  bx-lock'  ></i> 
            </div>
            
            <div class="remember-forgot">
                <label><input type="checkbox">Remember me</label>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="btn">Register</button>
            
            <div class="register-link">
                <p>Already have an account?<a href="Login_Page_index.php"> Login</a></p>
            </div>
        
        </form>
    </div>

    
</body>
</html>
<?php
require 'config.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = trim($_POST['username'] ?? '');
    $email    = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($username === '' || $email === '' || $password === '') {
        die("Minden mező kötelező.");
    }

    // jelszó hash
    $hash = password_hash($password, PASSWORD_DEFAULT); // jelszo_hash mezőhöz[web:38][web:41]

    // prepared statement az SQL injection ellen
    $stmt = $conn->prepare(
        "INSERT INTO users (username, email, jelszo_hash) VALUES (?, ?, ?)"
    );
    if (!$stmt) {
        die("Hiba a lekérdezés előkészítésekor: " . $conn->error);
    }

    $stmt->bind_param("sss", $username, $email, $hash);

    if ($stmt->execute()) {
        // sikeres regisztráció -> irány login
        header("Location: Login_Page_index.php");
        exit;
    } else {
        if ($conn->errno == 1062) {
            echo "Felhasználónév vagy email már létezik.";
        } else {
            echo "Hiba történt: " . $conn->error;
        }
    }

    $stmt->close();
}
?>
