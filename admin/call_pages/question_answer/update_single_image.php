<?php
require_once '../../db_files/dbase.php';



if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['image'])) {
    $questionId = intval($_POST['question_id']);
    $uploadDir = 'surat_yukle/';

    $fileName = basename($_FILES['image']['name']);
    $targetFilePath = $uploadDir . $fileName;

    if (move_uploaded_file($_FILES['image']['tmp_name'], $targetFilePath)) {
        // ❌ HATA: `$conn` tanımlı değil → ✅ `$connect` kullan!
        $sql = "UPDATE questions SET question_img='$fileName' WHERE id=$questionId";

        if (mysqli_query($connect, $sql)) { // `$conn` yerine `$connect`
            echo json_encode(['status' => 'success', 'newImage' => $fileName]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Veritabanı hatası: ' . mysqli_error($connect)]);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Resim yükleme başarısız!']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Geçersiz istek!']);
}

