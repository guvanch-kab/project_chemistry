<?php
require_once '../../db_files/dbase.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

file_put_contents("log.txt", print_r($_POST, true)); // Gelen veriyi log dosyasına yaz


$id = $_POST["idno"];
$column = $_POST["hidden_input"];
$newValue = $_POST["change_value"];
$index = isset($_POST["index"]) ? intval($_POST["index"]) : null;

// Güvenlik için sadece izin verilen sütunlar
$allowed_columns = ["answers_text", "question_text", "correct_answer"];

if (!in_array($column, $allowed_columns)) {
    echo "❌ Geçersiz sütun adı!";
    exit;
}

// Eğer answers_text ise — dizi gibi işle
if ($column === "answers_text") {
    $stmt = $connect->prepare("SELECT $column FROM questions WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->bind_result($currentText);
    $stmt->fetch();
    $stmt->close();

    $answerArray = array_map('trim', explode("|", $currentText));
    
    $answerArray[$index] = $newValue;
    $updatedText = implode("|", $answerArray);

    $stmt = $connect->prepare("UPDATE questions SET $column = ? WHERE id = ?");
    $stmt->bind_param("si", $updatedText, $id);
} 
// Tekli veri için — doğrudan güncelle
else {
    $stmt = $connect->prepare("UPDATE questions SET $column = ? WHERE id = ?");
    $stmt->bind_param("si", $newValue, $id);
}

if ($stmt->execute()) {
    echo "✅ Güncellendi!";
} else {
    echo "❌ Hata oluştu!";
}
$stmt->close();
$connect->close();
?>
