<?php
require_once '../../db_files/dbase.php';



$options = ""; // HTML içeriği oluşturmak için

if (isset($_GET['degeri'])) {
    $degeri = intval($_GET['degeri']);

    $sql = "SELECT * FROM questions WHERE caryek = $degeri";
    $result = $connect->query($sql);

    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $options .= "<option value='{$row['id']}'>{$row['question_text']}</option>";
        }
    } else {
        // Eğer sonuç yoksa mesaj göster
        $options = "<option disabled selected> Degisli maglumat tapylmady</option>";
    }
}

echo $options;
$connect->close();

?>
