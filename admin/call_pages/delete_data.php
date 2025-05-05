<?php

require_once '../db_files/dbase.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_belgi = $_POST['Id_belgi'] ?? '';
    $poz_delete = $_POST['poz_delete'] ?? ''; // gelen tablo adı

    // Güvenli tablo adlarını tanımlıyoruz (whitelist)
    $allowed_tables = [
        'nazary_data',
        'amaly_data',
        'tejribe_data',
        'meseleler_data'        
    ];

    // Geçerli ve güvenli tablo adı mı?
    if (!empty($id_belgi) && in_array($poz_delete, $allowed_tables)) {
        // Tablo adını güvenli şekilde yerleştiriyoruz
        $sql = "DELETE FROM `$poz_delete` WHERE id = ?";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("i", $id_belgi);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success"]);
        } else {
            echo json_encode(["status" => "error", "message" => $connect->error]);
        }

        $stmt->close();
    } else {
        echo json_encode(["status" => "error", "message" => "Geçersiz ID veya tablo adı."]);
    }

    $connect->close();
}



// require_once '../db_files/dbase.php';

// if ($_SERVER['REQUEST_METHOD'] === 'POST') {
//     $id_belgi = $_POST['Id_belgi'] ?? '';
//     $poz_delete = $_POST['poz_delete'] ?? '';

//     if (!empty($id_belgi) && $poz_delete === 'amaly_poz') {
//         $sql = "DELETE FROM amaly_data WHERE id = ?";
//         $stmt = $connect->prepare($sql);
//         $stmt->bind_param("i", $id_belgi);

//         if ($stmt->execute()) {
//             echo json_encode(["status" => "success"]);
//         } else {
//             echo json_encode(["status" => "error", "message" => $connect->error]);
//         }

//         $stmt->close();
//     } else {
//         echo json_encode(["status" => "error", "message" => "Gecersiz ID veya islem."]);
//     }

//     $connect->close();
// }
?>
