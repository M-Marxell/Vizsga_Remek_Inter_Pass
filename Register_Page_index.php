<?php
require 'config.php';

$error_message = ""; // Ebben tároljuk a hibákat

if (isset($_POST['register_btn'])) {
    $username = trim($_POST['username'] ?? '');
    $email    = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($username === '' || $email === '' || $password === '') {
        $error_message = "Minden mező kötelező.";
    } else {
        // jelszó hash
        $hash = password_hash($password, PASSWORD_DEFAULT);

        // prepared statement az SQL injection ellen
        $stmt = $conn->prepare("INSERT INTO users (username, email, jelszo_hash) VALUES (?, ?, ?)");
        
        if (!$stmt) {
            $error_message = "Hiba a lekérdezés előkészítésekor: " . $conn->error;
        } else {
            $stmt->bind_param("sss", $username, $email, $hash);

            // Itt a változás: Try-Catch blokkba tesszük a végrehajtást
            try {
                $stmt->execute();
                
                // Ha eljut ide, akkor sikeres volt a regisztráció -> irány login
                header("Location: Login_Page_index.php");
                exit;
                
            } catch (mysqli_sql_exception $e) {
                // Ha hiba történik, itt "elkapjuk"
                if ($e->getCode() == 1062) {
                    $error_message = "A felhasználónév vagy az email cím már foglalt.";
                } else {
                    $error_message = "Hiba történt az adatbázisban: " . $e->getMessage();
                }
            }

            $stmt->close();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="Register_Page_style.css">
    <link href='https://cdn.boxicons.com/fonts/basic/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <div class="wrapper">
        <form action="Register_Page_index.php" method="post">
            
            <h1> <img class="logo" src="logo_and_text.png" alt="Logó">Register</h1>
            
            <?php if (!empty($error_message)): ?>
                <div class="error-msg">
                    <p><?php echo $error_message; ?></p>
                </div>
            <?php endif; ?>
            
            <div class="input-box">
                <input type="text" name="username" placeholder="Username">
                <i class='bx bx-user'></i> 
            </div>
            
            <div class="input-box">
                <input type="email" name="email" placeholder="Email">
                <i class='bx bx-paper-plane'></i>
             </div>
            
            <div class="input-box">
                <input type="password" name="password" placeholder="Password">
                <i class='bx bx-lock'></i> 
            </div>
            
            <div class="remember-forgot">
                <label><input type="checkbox">Remember me</label>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" name="register_btn" class="btn">Register</button>
            
            <div class="register-link">
                <p>Already have an account? <a href="Login_Page_index.php">Login</a></p>
            </div>
        
        </form>
    </div>

</body>
</html>