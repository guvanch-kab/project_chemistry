<?php

require_once '../../db_files/dbase.php';

if (isset($_POST['Id_belgi'])) {
    $id_belgi = intval($_POST['Id_belgi']); // Güvenlik için tam sayıya çevir
    $caryek_belgi = $_POST['caryek_belgi']; 
    $caryek_sene = $_POST['caryek_senesi']; 


    $query = "DELETE FROM exam_result WHERE user_id = ? AND caryek=? ";
    $stmt = mysqli_prepare($connect, $query);
    mysqli_stmt_bind_param($stmt, "is", $id_belgi, $caryek_belgi);

    if (mysqli_stmt_execute($stmt)) {
        echo "success"; // Başarı mesajı gönder
    } else {
        echo "error"; // Hata mesajı gönder
    }

    mysqli_stmt_close($stmt);
    mysqli_close($connect);
} else {
    echo "no_id"; // ID gelmezse hata mesajı döndür
}