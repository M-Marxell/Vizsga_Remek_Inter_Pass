<?php
session_start();

// 1. BIZTONSÁGI ELLENŐRZÉS: Csak admin léphet be!
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'admin') {
    header("Location: ../login.php"); 
    exit;
}

require '../config.php'; 

// ==========================================
// 2. MŰVELETEK KEZELÉSE (Aktiválás / Törlés)
// ==========================================

// Felhasználó aktiválás/deaktiválás
if (isset($_GET['action']) && $_GET['action'] == 'toggle_aktiv' && isset($_GET['id'])) {
    $target_id = (int)$_GET['id'];
    
    if ($target_id === $_SESSION['user_id']) {
        $error_msg = "Saját magadat nem deaktiválhatod!";
    } else {
        $stmt = $conn->prepare("SELECT aktiv FROM users WHERE id = ?");
        $stmt->bind_param("i", $target_id);
        $stmt->execute();
        $stmt->bind_result($jelenlegi_aktiv);
        $stmt->fetch();
        $stmt->close();

        $uj_allapot = ($jelenlegi_aktiv == 1) ? 0 : 1;

        $update_stmt = $conn->prepare("UPDATE users SET aktiv = ? WHERE id = ?");
        $update_stmt->bind_param("ii", $uj_allapot, $target_id);
        $update_stmt->execute();
        $update_stmt->close();

        header("Location: adminPage.php");
        exit;
    }
}

// Esemény törlése (Végleges törlés az adatbázisból)
if (isset($_GET['action']) && $_GET['action'] == 'delete_event' && isset($_GET['id'])) {
    $event_id = (int)$_GET['id'];
    
    $del_stmt = $conn->prepare("DELETE FROM esemeny_lista WHERE id = ?");
    $del_stmt->bind_param("i", $event_id);
    $del_stmt->execute();
    $del_stmt->close();

    header("Location: adminPage.php");
    exit;
}

// ==========================================
// 3. ADATOK LEKÉRDEZÉSE A MEGJELENÍTÉSHEZ
// ==========================================
$users_eredmeny = $conn->query("SELECT id, username, email, tipus, aktiv, letrehozva FROM users ORDER BY id DESC");
$esemeny_eredmeny = $conn->query("SELECT * FROM esemeny_lista ORDER BY idopont DESC");
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <title>Admin Vezérlőpult</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div style="margin-bottom: 20px; overflow: hidden;">
        <a href="../logout.php" class="btn btn-logout">Kijelentkezés</a>
        <p style="margin: 0; font-size: 18px;">Üdvözöllek, <strong><?php echo htmlspecialchars($_SESSION['username']); ?></strong>!</p>
    </div>

    <?php if (isset($error_msg)) echo "<p class='error'>$error_msg</p>"; ?>

    <div class="container">
        <h2 class="section-title">Felhasználók Kezelése</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Felhasználónév</th>
                    <th>Email</th>
                    <th>Típus</th>
                    <th>Állapot</th>
                    <th>Regisztrált</th>
                    <th>Műveletek</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $users_eredmeny->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['id']; ?></td>
                        <td><?php echo htmlspecialchars($row['username']); ?></td>
                        <td><?php echo htmlspecialchars($row['email']); ?></td>
                        <td>
                            <span class="<?php echo $row['tipus'] == 'admin' ? 'badge-admin' : 'badge-user'; ?>">
                                <?php echo $row['tipus']; ?>
                            </span>
                        </td>
                        <td>
                            <?php echo $row['aktiv'] ? '<span style="color:green;">Aktív</span>' : '<span style="color:red;">Felfüggesztve</span>'; ?>
                        </td>
                        <td><?php echo $row['letrehozva']; ?></td>
                        <td>
                            <?php if ($row['id'] !== $_SESSION['user_id']): ?>
                                <?php if ($row['aktiv'] == 1): ?>
                                    <a href="adminPage.php?action=toggle_aktiv&id=<?php echo $row['id']; ?>" class="btn btn-deactivate">Deaktiválás</a>
                                <?php else: ?>
                                    <a href="adminPage.php?action=toggle_aktiv&id=<?php echo $row['id']; ?>" class="btn btn-activate">Aktiválás</a>
                                <?php endif; ?>
                            <?php else: ?>
                                <em>Saját fiók</em>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>

    <div class="container">
        <h2 class="section-title">Események Kezelése</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Név</th>
                    <th>Típus</th>
                    <th>Helyszín</th>
                    <th>Időpont</th>
                    <th>Korhatár</th>
                    <th>Ár (Ft)</th>
                    <th>Műveletek</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($erow = $esemeny_eredmeny->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $erow['id']; ?></td>
                        <td><strong><?php echo htmlspecialchars($erow['nev']); ?></strong></td>
                        <td><?php echo htmlspecialchars($erow['tipus']); ?></td>
                        <td><?php echo htmlspecialchars($erow['hely']); ?></td>
                        <td><?php echo date('Y. m. d. H:i', strtotime($erow['idopont'])); ?></td>
                        <td><?php echo htmlspecialchars($erow['korhatar']); ?></td>
                        <td><?php echo $erow['jegy_ara'] > 0 ? number_format($erow['jegy_ara'], 0, ',', ' ') . ' Ft' : 'Ingyenes'; ?></td>
                        <td>
                        <a href="editEvent.php?id=<?php echo $erow['id']; ?>" class="btn btn-edit">Szerkesztés</a>
                        <a href="adminPage.php?action=delete_event&id=<?php echo $erow['id']; ?>" class="btn btn-delete" onclick="return confirm('Biztosan törölni szeretnéd ezt az eseményt? Ez nem vonható vissza!');">Törlés</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>

</body>
</html>