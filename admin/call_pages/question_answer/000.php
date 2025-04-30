<?php
require_once '../../db_files/dbase.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Gelen POST verilerini alalım
    $id = $_POST['id'];
    $question_text = $_POST['question_text'];
    $correct_answer = $_POST['correct_answer'];

    if (empty($id)) {
        die("❌ ID değeri gelmedi!");
    }

    // Yeni resimler yüklenmişse işleme alalım
    $uploadedFiles = [];
    if (!empty($_FILES['images']['tmp_name'][0])) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $file_name = time() . '_' . uniqid() . '_' . $_FILES['images']['name'][$key]; // Benzersiz dosya adı
            $file_path = 'uploads/' . $file_name;

            if (move_uploaded_file($tmp_name, $file_path)) {
                $uploadedFiles[] = $file_path; // Yüklenen dosyayı listeye ekleyelim
            } else {
                die("❌ Yüklenemedi: " . $_FILES['images']['name'][$key]);
            }
        }
    }

    // Eski resimler zaten mevcutsa ve yeni resimler yüklenmediyse, eski resimleri JSON formatında geri gönderelim
    $finalImages = !empty($uploadedFiles) ? json_encode($uploadedFiles, JSON_UNESCAPED_UNICODE) : null;
    echo "📦 Yeni Resimler JSON: " . ($finalImages ? $finalImages : "Yok") . "<br>";

    // SQL güncelleme sorgusu
    $sql = "UPDATE questions SET question_text = ?, correct_answer = ?, options = ? WHERE id = ?";
    $stmt = $connect->prepare($sql);
    
    if (!$stmt) {
        die("❌ SQL Hata (Prepare): " . $connect->error);
    }
    
    // SQL sorgusunu bağlama
    $stmt->bind_param("sssi", $question_text, $correct_answer, $finalImages, $id);
    
    if ($stmt->execute()) {
        echo "✅ SQL Güncelleme Başarılı!<br>";

        // Veritabanında gerçekten güncellenmiş mi kontrol edelim
        $checkSql = "SELECT options FROM questions WHERE id = ?";
        $checkStmt = $connect->prepare($checkSql);
        $checkStmt->bind_param("i", $id);
        $checkStmt->execute();
        $result = $checkStmt->get_result();
        $row = $result->fetch_assoc();

        echo "🔍 Veritabanındaki Sonuç: " . $row['options']; // Test için eklenen satır
    } else {
        die("❌ SQL Hata (Execute): " . $stmt->error);
    }

    $stmt->close();
    $checkStmt->close();
    $connect->close();
}
?>



/////////////////


<?php
require_once '../../db_files/dbase.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $question_text = $_POST['question_text'];
    $correct_answer = $_POST['correct_answer'];

    $uploadedFiles = [];
    if (!empty($_FILES['images']['tmp_name'][0])) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $file_name = time() . '_' . uniqid() . '_' . $_FILES['images']['name'][$key]; // Benzersiz dosya adı
            $file_path = 'uploads/' . $file_name;

            if (move_uploaded_file($tmp_name, $file_path)) {
                $uploadedFiles[] = $file_path; // Yüklenen dosyayı listeye ekleyelim
            } else {
                die("❌ Yüklenemedi: " . $_FILES['images']['name'][$key]);
            }
        }
    }

    $finalImages = !empty($uploadedFiles) ? json_encode($uploadedFiles, JSON_UNESCAPED_UNICODE) : null;
    echo "📦 Yeni Resimler JSON: " . ($finalImages ? $finalImages : "Yok") . "<br>";

    $sql = "UPDATE questions SET question_text = '$question_text', options = '$finalImages', correct_answer = $correct_answer WHERE id = $id";

    if ($connect->query($sql) === TRUE) {
        echo "Question updated successfully!";
    } else {
        echo "Error updating question: " . $connect->error;
    }

    $connect->close();
}
?>
