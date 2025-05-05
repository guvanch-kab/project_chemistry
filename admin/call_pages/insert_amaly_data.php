<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once '../db_files/dbase.php';

header('Content-Type: text/html'); // Bootstrap uyarısı için HTML çıktısı

// Gelen verileri al
$bolum_belgi = $_POST['bolum_belgi'] ?? null;
$bolum_ady = $_POST['section_name'] ?? null;
$paragraph_no = $_POST['paragraph_no'] ?? null;
$paragraf_ady = $_POST['paragraf_ady'] ?? null;

// Zorunlu alanları kontrol et
if (!$bolum_belgi || !$bolum_ady || !$paragraph_no || !$paragraf_ady) {
   // echo '<div class="alert alert-danger" role="alert">Hökman meýdanlar doldurylmandyr!</div>';
    exit;
}

// Duplicate kontrolü
$checkSql = "SELECT COUNT(*) FROM amaly_data WHERE nomeri = ?";
$checkStmt = $connect->prepare($checkSql);
$checkStmt->bind_param("s", $bolum_belgi);
$checkStmt->execute();
$checkStmt->bind_result($count);
$checkStmt->fetch();
$checkStmt->close();

if ($count > 0) {
    // JSON olarak mesaj gönder
    echo json_encode([
        "status" => "duplicate",
        "message" => "Bu amaly_no ($bolum_belgi) zaten var, başga nomer ulanyň!"
    ]);
    exit;
}


// === PDF Yükleme ===
$uploadDir = "pdf_files/";
if (!is_dir($uploadDir)) {
    if (!mkdir($uploadDir, 0777, true)) {
        echo '<div class="alert alert-danger" role="alert">PDF yükleme klasörü oluşturulamadı!</div>';
        exit;
    }
}

$pdfPath = null;
if (!empty($_FILES['pdfFile']['name'])) {
    $pdfName = uniqid() . "-" . basename($_FILES['pdfFile']['name']);
    $fullPdfPath = $uploadDir . $pdfName;

    if (!move_uploaded_file($_FILES['pdfFile']['tmp_name'], $fullPdfPath)) {
        echo '<div class="alert alert-danger" role="alert">PDF file ýüklenende ýalňyşlyk ýüze çykdy!</div>';
        exit;
    }

    $pdfPath = $pdfName;
}

// === Resim Yükleme ===
$imageUploadDir = "uploads/";
if (!is_dir($imageUploadDir)) {
    if (!mkdir($imageUploadDir, 0777, true)) {
        echo '<div class="alert alert-danger" role="alert">Resim klasörü oluşturulamadı!</div>';
        exit;
    }
}

$imagePaths = [];
if (!empty($_FILES['book_images']['name'][0])) {
    foreach ($_FILES['book_images']['name'] as $key => $name) {
        $tmpName = $_FILES['book_images']['tmp_name'][$key];
        $fileName = uniqid() . "-" . basename($name);
        $filePath = $imageUploadDir . $fileName;

        if (move_uploaded_file($tmpName, $filePath)) {
            $imagePaths[] = $fileName;
        } else {
            echo '<div class="alert alert-danger" role="alert">Resim yüklenirken hata oluştu!</div>';
            exit;
        }
    }
}

$imagePathsString = implode(',', $imagePaths);

// Veritabanına veri ekleme
$sql = "INSERT INTO amaly_data (nomeri, Bolum_ady, Paragraf_no, Paragraf_ady, PDF_file_ady, Surat)
        VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $connect->prepare($sql);
if (!$stmt) {
    echo '<div class="alert alert-danger" role="alert">Talap taýarlanmady: ' . $connect->error . '</div>';
    exit;
}

$stmt->bind_param("ssssss", $bolum_belgi, $bolum_ady, $paragraph_no, $paragraf_ady, $pdfPath, $imagePathsString);

if ($stmt->execute()) {
   

   echo json_encode([
    "status" => "success",
    "message" => "Maglumatlar üstünlikli girizildi."
]);


} else {
    echo '<div class="alert alert-danger" role="alert">Maglumatlar bazasyna goşup bolmady: ' . $stmt->error . '</div>';
}

$stmt->close();
$connect->close();
?>
