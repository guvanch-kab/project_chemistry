<?php
require_once '../../db_files/dbase.php';

if (isset($_FILES['image']['name']) && isset($_POST['index']) && isset($_POST['question_id'])) {
    $index = intval($_POST['index']);
    $id = intval($_POST['question_id']);
    $targetDir = "surat_yukle/";

    // Mevcut resimleri al
    $sql = "SELECT options FROM questions WHERE id = $id";
    $result = mysqli_query($connect, $sql);
    $row = mysqli_fetch_assoc($result);
    $images = explode(',', $row['options']);

    // Yeni dosya adı
    $fileName = uniqid() . '_' . basename($_FILES['image']['name']);
    $targetFile = $targetDir . $fileName;

    if (move_uploaded_file($_FILES['image']['tmp_name'], $targetFile)) {
        // Eski resmi sil
        if (!empty($images[$index]) && file_exists($targetDir . $images[$index])) {
            unlink($targetDir . $images[$index]);
        }

        // Diziyi güncelle
        $images[$index] = $fileName;
        $newImages = implode(',', $images);

        // Veritabanını güncelle
        $update = "UPDATE questions SET options = '$newImages' WHERE id = $id";
        if (mysqli_query($connect, $update)) {
            echo json_encode(['status' => 'success', 'newImage' => $fileName]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Veritabanı güncelleme hatası.']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Dosya yükleme hatası.']);
    }
}
?>