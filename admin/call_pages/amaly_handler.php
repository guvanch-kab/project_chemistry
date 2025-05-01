
<?php
require_once '../db_files/dbase.php';

// İstek türüne göre işlem yap
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $action = $_POST['action'];

    if ($action == 'amaly') {
        $bolum = $_POST['amaly_no'];
        $stmt = $connect->prepare("INSERT INTO amaly_data_bolum (amaly_no) VALUES (?)");
        $stmt->bind_param("s", $bolum);

        if ($stmt->execute()) {
            echo "Bölüm ustunlikli gosuldy!";
        } else {
            echo "Bölüm gosulanda bir yalnyslyk boldy!";
        }

        $stmt->close();
    } elseif ($action == 'delete') {
        $id = $_POST['id'];
        $stmt = $connect->prepare("DELETE FROM amaly_data_bolum WHERE id = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo "Bölüm ustunlikli pozuldy!";
        } else {
            echo "Bölüm pozulanda hata meydana geldi!";
        }

        $stmt->close();
    } elseif ($action == 'ishno_al') {
        $result = $connect->query("SELECT * FROM amaly_data_bolum");
        $options = "";

        while ($row = $result->fetch_assoc()) {
            $options .= "<option value='" . $row['id'] . "'>" . $row['amaly_no'] . "</option>";
        }

        echo $options;
    }
}

$connect->close();
?>
