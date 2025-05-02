<?php
require_once '../db_files/dbase.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_belgi = $_POST['Id_belgi'] ?? '';
    $bolum_belgi = $_POST['Bolum_belgi'] ?? '';
    $bolum_ady = $_POST['Bolum_ady'] ?? '';
    $paragraf_no = $_POST['Paragraf_no'] ?? '';
    $paragraf_ady = $_POST['Paragraf_ady'] ?? '';
    $amaly_upd = $_POST['amaly_upd'] ?? '';

echo '<hr>'. $id_belgi;

    // Dosya yükleme işlemleri
    $pdf_file_ady = null;
    $surat_file = null;

    if(empty($amaly_upd)){

    if (isset($_FILES['PDF_file_ady']) && $_FILES['PDF_file_ady']['error'] == UPLOAD_ERR_OK) {
        $pdf_file_ady = basename($_FILES['PDF_file_ady']['name']);
        move_uploaded_file($_FILES['PDF_file_ady']['tmp_name'], "pdf_files/" . $pdf_file_ady);
    }

    if (isset($_FILES['Surat']) && $_FILES['Surat']['error'] == UPLOAD_ERR_OK) {
        $surat_file = basename($_FILES['Surat']['name']);
        move_uploaded_file($_FILES['Surat']['tmp_name'], "../uploads/" . $surat_file);
    }

    // Veritabanında mevcut değerleri kontrol etmek için SELECT sorgusu
    $sql_select = "SELECT PDF_file_ady, Surat FROM nazary_data WHERE Bolum_belgi = ?";
    $stmt_select = $connect->prepare($sql_select);
    $stmt_select->bind_param("s", $bolum_belgi);
    $stmt_select->execute();
    $stmt_select->bind_result($existing_pdf, $existing_surat);
    $stmt_select->fetch();
    $stmt_select->close();

    // Eğer yeni dosya yüklenmediyse, mevcut değerleri koruyun
    $pdf_file_ady = $pdf_file_ady ?? $existing_pdf;
    $surat_file = $surat_file ?? $existing_surat;

    // Güncelleme sorgusu
    $sql_update = "UPDATE nazary_data SET 
    Bolum_belgi=?,
    Bolum_ady = ?, 
    Paragraf_no = ?, 
    Paragraf_ady = ?, 
    PDF_file_ady = ?, 
    Surat = ? 
        WHERE id = ?";
$stmt_update = $connect->prepare($sql_update);
$stmt_update->bind_param("ssssssi", $bolum_belgi, $bolum_ady, $paragraf_no, $paragraf_ady, $pdf_file_ady, $surat_file, $id_belgi);

if ($stmt_update->execute()) {
    if ($stmt_update->affected_rows > 0) {
        echo "Başarıyla güncellendi.";
    } else {
        echo "Hiçbir satır güncellenmedi. ID doğru mu kontrol edin.";
    }
} else {
    echo "Güncelleme hatası: " . $connect->error;
}

    }

                                        /*      eger amaly_data ucin bolsa        */

                                        if (isset($_POST['amaly_upd']) && $_POST['amaly_upd'] === 'amaly_upd') {

                                            if (isset($_FILES['PDF_file_ady']) && $_FILES['PDF_file_ady']['error'] == UPLOAD_ERR_OK) {
                                                $pdf_file_ady = basename($_FILES['PDF_file_ady']['name']);
                                                move_uploaded_file($_FILES['PDF_file_ady']['tmp_name'], "pdf_files/" . $pdf_file_ady);
                                            }
                                        
                                            if (isset($_FILES['Surat']) && $_FILES['Surat']['error'] == UPLOAD_ERR_OK) {
                                                $surat_file = uniqid() . "_" . basename($_FILES['Surat']['name']);
                                                $upload_path = "uploads/" . $surat_file;
                                            
                                                if (move_uploaded_file($_FILES['Surat']['tmp_name'], $upload_path)) {
                                                    echo "✅ Resim başarıyla yüklendi: $surat_file";
                                                } else {
                                                    echo "❌ Resim YÜKLEME HATASI! $upload_path dizinine taşınamadı.";
                                                }
                                            } else {
                                                echo "⚠️ Resim dosyası seçilmedi veya yükleme hatası oluştu.";
                                            }
                                            
                                        
                                            // Veritabanında mevcut değerleri kontrol etmek için SELECT sorgusu
                                            $sql_select = "SELECT PDF_file_ady, Surat FROM amaly_data WHERE amaly_no = ?";
                                            $stmt_select = $connect->prepare($sql_select);
                                            $stmt_select->bind_param("s", $bolum_belgi);
                                            $stmt_select->execute();
                                            $stmt_select->bind_result($existing_pdf, $existing_surat);
                                            $stmt_select->fetch();
                                            $stmt_select->close();
                                        
                                            // Eğer yeni dosya yüklenmediyse, mevcut değerleri koruyun
                                            $pdf_file_ady = $pdf_file_ady ?? $existing_pdf;
                                            $surat_file = $surat_file ?? $existing_surat;
                                        
                                            // Güncelleme sorgusu
                                            $sql_update = "UPDATE amaly_data SET 
                                            amaly_no=?,
                                            Bolum_ady = ?, 
                                            Paragraf_no = ?, 
                                            Paragraf_ady = ?, 
                                            PDF_file_ady = ?, 
                                            Surat = ? 
                                                WHERE id = ?";
                                        $stmt_update = $connect->prepare($sql_update);
                                        $stmt_update->bind_param("ssssssi", $bolum_belgi, $bolum_ady, $paragraf_no, $paragraf_ady, $pdf_file_ady, $surat_file, $id_belgi);
                                        
                                        if ($stmt_update->execute()) {
                                            if ($stmt_update->affected_rows > 0) {
                                                echo "ustunlikli tazelndi.";
                                            } else {
                                                echo "Hic bir setir tazelenmedi. ID dogrumy, kontrol edin.";
                                            }
                                        } else {
                                            echo "tazelenme hatasy: " . $connect->error;
                                        }
                                        
                                            }


    $stmt_update->close();
    $connect->close();
}
