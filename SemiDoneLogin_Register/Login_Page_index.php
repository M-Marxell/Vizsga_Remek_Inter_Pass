<?php
session_start();
require 'config.php';

$error_message = ""; // Ebben tároljuk a hibákat

if (isset($_POST['login_btn'])) {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($username === '' || $password === '') {
        $error_message = "Minden mezőt töltsön ki.";
    } else {
        // felhasználó lekérdezése
        $stmt = $conn->prepare("SELECT id, username, jelszo_hash, tipus, aktiv FROM users WHERE username = ?");
        
        if (!$stmt) {
            $error_message = "Hiba a lekérdezés előkészítésekor.";
        } else {
            $stmt->bind_param("s", $username);
            $stmt->execute();
            $stmt->store_result();

            if ($stmt->num_rows === 1) {
                $stmt->bind_result($id, $db_username, $db_hash, $db_tipus, $db_aktiv);
                $stmt->fetch();

                if($db_aktiv == 0){
                    $error_message = "Ez a fiók törölve vagy felfüggesztve lett.";
                }
                else if (password_verify($password, $db_hash)) { // jelszó ellenőrzés
                    $_SESSION['user_id'] = $id;
                    $_SESSION['username'] = $db_username;
                    $_SESSION['user_type'] = $db_tipus;

                    if($db_tipus == "admin"){
                        header("Location: AdminFelulet/adminPage.php"); //admin oldal
                    }
                    else{
                        header("Location: interpasshomepage.html"); // ide mehet a főoldal
                    }
                    exit;
                }
                else {
                    $error_message = "Hibás jelszó.";
                }
            } else {
                $error_message = "Nincs ilyen felhasználó.";
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
    <title>Login</title>
    <link rel="stylesheet" href="Login_Page_Style.css">
    <link href='https://cdn.boxicons.com/fonts/basic/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <div class="wrapper">
        <form action="Login_Page_index.php" method="post">
        
            
            <h1> <img class="logo" src="logo_and_text.png" alt="Logó">Login</h1>
            
            <?php if (!empty($error_message)): ?>
                <div class="error-msg">
                    <p><?php echo $error_message; ?></p>
                </div>
            <?php endif; ?>
            
            <div class="input-box">
                <input type="text" name="username" placeholder="Username" >
                <i class='bx bx-user'></i> 
            </div>
            
            <div class="input-box">
                <input type="password" name="password" placeholder="Password">
                <i class='bx bx-lock'></i> 
            </div>
            
            <button type="submit" name="login_btn" class="btn">Login</button>
            
            <div class="register-link">
                <p>Don't have an account? <a href="Register_Page_index.php">Register</a></p>
            </div>
        
        </form>
    </div>

</body>
</html>