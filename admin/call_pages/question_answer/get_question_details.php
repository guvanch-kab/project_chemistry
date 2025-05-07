<?php
require_once '../../db_files/dbase.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);

    $sql = "SELECT * FROM questions WHERE id = $id";

    $result = mysqli_query($connect, $sql);
    $row = mysqli_fetch_assoc($result);

    if (!$row) {
        echo json_encode(['status' => 'error', 'message' => 'Sorag tapylmady.']);
        exit;
    }
    $singleImage = !empty($row['question_img']) ? "call_pages/question_answer/surat_yukle/" . $row['question_img'] : null;

    $questionText = $row['question_text'];

    $images = explode(',', $row['options']);
    $imageData = [];
    foreach ($images as $index => $image) {
        $imageData[] = [
            'index' => $index,
            'src' => "call_pages/question_answer/surat_yukle/$image"
        ];
    }
    $answersText = isset($row['answers_text']) ? explode('|', $row['answers_text']) : [];
    $options = json_decode($row['options'], true) ?? [];
    $correctAnswer = $row['correct_answer'];

    echo json_encode([
        'status' => 'success',
        'question_text' => $questionText,
        'single_image' => $singleImage,  // Tekli resim
        'images' => $imageData,
        'options' => $options,
        'answers_text' => $answersText, // metin cevapları
        'correct_answer' => $correctAnswer
    ]);
    $connect->close();
}
?>
