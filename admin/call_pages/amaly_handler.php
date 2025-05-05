<?php
require_once '../db_files/dbase.php';

// Geçerli tablo isimlerini belirleyelim
$allowed_tables = ['amaly_data_bolum', 'nazary_data_bolumler', 'tejribe_data_bolum', 'meseleler_data_bolum'];

// İstek türüne göre işlem yap
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $action = $_POST['action'];
    $file_data = $_POST['file_data'] ?? '';  // Dinamik tablo ismi

    // Eğer gelen tablo ismi geçerli değilse, işlem yapma
    if (!in_array($file_data, $allowed_tables)) {
        echo json_encode(["status" => "error", "message" => "Geçersiz tablo adı!"]);
        exit;
    }

    if ($action == 'amaly') {
        $bolum = $_POST['amaly_no'];

        // SQL injection'dan korunmak için, tablo ismini kontrol ettikten sonra kullanıyoruz
        $stmt = $connect->prepare("INSERT INTO $file_data (belgi) VALUES (?)");
        $stmt->bind_param("s", $bolum);

        if ($stmt->execute()) {
            echo "Bölüm başarılı bir şekilde eklendi!";
        } else {
            echo "Bölüm eklenirken bir hata oluştu!";
        }

        $stmt->close();
    } elseif ($action == 'delete') {
        $id = $_POST['id'];

        // SQL injection'dan korunmak için, tablo ismini kontrol ettikten sonra kullanıyoruz
        $stmt = $connect->prepare("DELETE FROM $file_data WHERE id = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo "Bölüm başarıyla silindi!";
        } else {
            echo "Bölüm silinirken hata oluştu!";
        }

        $stmt->close();
    } elseif ($action == 'ishno_al') {
        // Dinamik tablodan veri çek
        $sql = "SELECT * FROM $file_data";
        $result = $connect->query($sql);
        $data = [];

        while ($row = $result->fetch_assoc()) {
            $data[] = [
                'id' => $row['id'],
                'belgi' => $row['belgi']
            ];
        }

        // JSON formatında veriyi döndürüyoruz
        echo json_encode($data);
    }
}

$connect->close();
?>
