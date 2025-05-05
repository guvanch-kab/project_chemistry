<?php
require_once '../db_files/dbase.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    $id_belgi = $_POST['Id_belgi'] ?? '';
    $bolum_belgi = $_POST['Bolum_belgi'] ?? '';
    $bolum_ady = $_POST['Bolum_ady'] ?? '';
    $paragraf_no = $_POST['Paragraf_no'] ?? '';
    $paragraf_ady = $_POST['Paragraf_ady'] ?? '';
    $amaly_upd = $_POST['amaly_upd'] ?? '';

    $pdf_file_ady = null;
    $surat_file = null;

    // Dinamik tablo adları için bir dizi oluşturuluyor
    $valid_tables = ['nazary_upd' => 'nazary_data', 'amaly_upd' => 'amaly_data','tejribe_upd'=>'tejribe_data','meseleler_upd'=>'meseleler_data'];

    // Eğer gelen amaly_upd parametresi dizide varsa, doğru tabloyu seçiyoruz
    if (!in_array($amaly_upd, array_keys($valid_tables))) {
        echo json_encode(["status" => "error", "message" => "Geçersiz işlem türü."]);
        exit;
    }

    // Doğru tablo adı seçildi
    $table_name = $valid_tables[$amaly_upd];

    // Eğer dosya yüklendiyse, PDF ve Surat dosyasını yükle
    if (isset($_FILES['PDF_file_ady']) && $_FILES['PDF_file_ady']['error'] == UPLOAD_ERR_OK) {
        $pdf_file_ady = basename($_FILES['PDF_file_ady']['name']);
        move_uploaded_file($_FILES['PDF_file_ady']['tmp_name'], "pdf_files/" . $pdf_file_ady);
    }

    if (isset($_FILES['Surat']) && $_FILES['Surat']['error'] == UPLOAD_ERR_OK) {
        $surat_file = uniqid() . "_" . basename($_FILES['Surat']['name']);
        move_uploaded_file($_FILES['Surat']['tmp_name'], "uploads/" . $surat_file);
    }

    // Veritabanındaki mevcut dosyaları al
    $sql_select = "SELECT PDF_file_ady, Surat FROM $table_name WHERE id = ?";
    $stmt_select = $connect->prepare($sql_select);
    $stmt_select->bind_param("i", $id_belgi);
    $stmt_select->execute();
    $stmt_select->bind_result($existing_pdf, $existing_surat);
    $stmt_select->fetch();
    $stmt_select->close();

    // Yüklenen dosyalar yoksa, mevcut dosyaları koru
    $pdf_file_ady = $pdf_file_ady ?? $existing_pdf;
    $surat_file = $surat_file ?? $existing_surat;

    // Veritabanını güncelle
    $sql_update = "UPDATE $table_name SET 
        nomeri = ?, 
        Bolum_ady = ?, 
        Paragraf_no = ?, 
        Paragraf_ady = ?, 
        PDF_file_ady = ?, 
        Surat = ? 
        WHERE id = ?";
    
    $stmt_update = $connect->prepare($sql_update);
    $stmt_update->bind_param("ssssssi", $bolum_belgi, $bolum_ady, $paragraf_no, $paragraf_ady, $pdf_file_ady, $surat_file, $id_belgi);

    if ($stmt_update->execute()) {
        $response = [
            "status" => "success",
            "PDF_file_ady" => $pdf_file_ady,
            "Surat" => $surat_file,
            "Bolum_ady" => $bolum_ady,
            "Paragraf_no" => $paragraf_no,
            "Paragraf_ady" => $paragraf_ady,
            "id_belgi" => $id_belgi
        ];
    } else {
        $response = [
            "status" => "error",
            "message" => "Update failed: " . $connect->error
        ];
    }

    $stmt_update->close();
    $connect->close();

    echo json_encode($response);
}
?>
