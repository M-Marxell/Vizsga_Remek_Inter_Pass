<?php
session_start();

// 1. Biztonsági ellenőrzés
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'admin') {
    header("Location: ../login.php");
    exit;
}

require '../config.php';

$error_message = "";

// 2. Esemény lekérése az URL-ben lévő ID alapján
if (!isset($_GET['id'])) {
    header("Location: adminPage.php");
    exit;
}
$event_id = (int)$_GET['id'];

// 3. Űrlap elküldésének feldolgozása (UPDATE)
if (isset($_POST['update_event_btn'])) {
    $nev = trim($_POST['nev']);
    $rovid_leiras = trim($_POST['rovid_leiras']);
    $tipus = $_POST['tipus'];
    $hely = trim($_POST['hely']);
    $idopont = $_POST['idopont']; // Ezt át kell alakítani a HTML formátumból MySQL formátumba
    $korhatar = $_POST['korhatar'];
    $jegy_forgalmazo = trim($_POST['jegy_forgalmazo']);
    $jegy_ara = (int)$_POST['jegy_ara'];

    // Dátum formázása: a HTML 'datetime-local' T betűvel választja el az időt, a MySQL szóközzel kéri
    $idopont_mysql = date('Y-m-d H:i:s', strtotime($idopont));

    if (empty($nev) || empty($hely) || empty($idopont)) {
        $error_message = "A csillaggal jelölt mezők kitöltése kötelező!";
    } else {
        $update_query = "UPDATE esemeny_lista SET nev=?, rovid_leiras=?, tipus=?, hely=?, idopont=?, korhatar=?, jegy_forgalmazo=?, jegy_ara=? WHERE id=?";
        $stmt = $conn->prepare($update_query);
        $stmt->bind_param("sssssssii", $nev, $rovid_leiras, $tipus, $hely, $idopont_mysql, $korhatar, $jegy_forgalmazo, $jegy_ara, $event_id);
        
        if ($stmt->execute()) {
            header("Location: adminPage.php");
            exit;
        } else {
            $error_message = "Hiba történt a frissítés során!";
        }
        $stmt->close();
    }
}

// 4. Eredeti adatok lekérése a form feltöltéséhez
$stmt = $conn->prepare("SELECT * FROM esemeny_lista WHERE id = ?");
$stmt->bind_param("i", $event_id);
$stmt->execute();
$eredmeny = $stmt->get_result();

if ($eredmeny->num_rows === 0) {
    header("Location: adminPage.php");
    exit;
}
$event = $eredmeny->fetch_assoc();
$stmt->close();

// A datetime-local input mezőhöz speciális formátum kell: YYYY-MM-DDThh:mm
$form_idopont = date('Y-m-d\TH:i', strtotime($event['idopont']));
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <title>Esemény Szerkesztése</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); max-width: 600px; margin: auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        input[type="text"], input[type="number"], input[type="datetime-local"], select, textarea { 
            width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; 
        }
        .btn { padding: 10px 15px; text-decoration: none; color: white; border-radius: 4px; border: none; cursor: pointer; }
        .btn-save { background-color: #28a745; }
        .btn-cancel { background-color: #6c757d; margin-left: 10px; }
        .error { color: red; font-weight: bold; }
    </style>
</head>
<body>

<div class="container">
    <h2>Esemény Szerkesztése</h2>
    
    <?php if ($error_message) echo "<p class='error'>$error_message</p>"; ?>

    <form method="POST" action="">
        <div class="form-group">
            <label>Esemény neve *</label>
            <input type="text" name="nev" value="<?php echo htmlspecialchars($event['nev']); ?>" required>
        </div>

        <div class="form-group">
            <label>Rövid leírás</label>
            <textarea name="rovid_leiras" rows="3"><?php echo htmlspecialchars($event['rovid_leiras']); ?></textarea>
        </div>

        <div class="form-group">
            <label>Típus</label>
            <select name="tipus">
                <?php
                $tipusok = ['Sport', 'Színház', 'Mozi', 'Fesztivál', 'Koncert', 'Rendezvények', 'Egyéb'];
                foreach ($tipusok as $t) {
                    $selected = ($event['tipus'] == $t) ? 'selected' : '';
                    echo "<option value='$t' $selected>$t</option>";
                }
                ?>
            </select>
        </div>

        <div class="form-group">
            <label>Helyszín *</label>
            <input type="text" name="hely" value="<?php echo htmlspecialchars($event['hely']); ?>" required>
        </div>

        <div class="form-group">
            <label>Időpont *</label>
            <input type="datetime-local" name="idopont" value="<?php echo $form_idopont; ?>" required>
        </div>

        <div class="form-group">
            <label>Korhatár</label>
            <select name="korhatar">
                <?php
                $korhatarok = ['/e', '+6', '+12', '+16', '+18'];
                foreach ($korhatarok as $k) {
                    $selected = ($event['korhatar'] == $k) ? 'selected' : '';
                    echo "<option value='$k' $selected>$k</option>";
                }
                ?>
            </select>
        </div>

        <div class="form-group">
            <label>Jegy forgalmazó</label>
            <input type="text" name="jegy_forgalmazo" value="<?php echo htmlspecialchars($event['jegy_forgalmazo']); ?>">
        </div>

        <div class="form-group">
            <label>Jegy ára (Ft)</label>
            <input type="number" name="jegy_ara" value="<?php echo $event['jegy_ara']; ?>" min="0">
        </div>

        <div style="margin-top: 20px;">
            <button type="submit" name="update_event_btn" class="btn btn-save">Változtatások mentése</button>
            <a href="adminPage.php" class="btn btn-cancel">Mégse</a>
        </div>
    </form>
</div>

</body>
</html>