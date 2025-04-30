<?php
require_once '../../db_files/dbase.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $caryekler = isset($_POST['caryekler']) ? $_POST['caryekler'] : '';
    $question_text = isset($_POST['question_text']) ? $_POST['question_text'] : '';
    $question_img = isset($_FILES['question_img']) ? $_FILES['question_img'] : null;

    $correct_answer = isset($_POST['correct_answer']) ? intval($_POST['correct_answer']) : 0;

    $answers_text = isset($_POST['answers']) ? $_POST['answers'] : []; // ← TEXT input
    $options = isset($_FILES['options']) ? $_FILES['options'] : null;


//     echo "<pre>";
// print_r($answers_text);
// echo "</pre>";


    // Verileri kontrol et
    if (empty($question_text) || empty($correct_answer)) {
        echo "Lütfen tüm alanları doldurun.";
        exit;
    }

    $upload_dir = 'surat_yukle/';

    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0777, true);
    }

    // Soru görselini yükle
    $question_img_path = null;
    if ($question_img && $question_img['error'] == 0) {
        $question_img_name = time() . "_" . basename($question_img['name']);
        $question_img_path = $question_img_name;
        move_uploaded_file($question_img['tmp_name'], $upload_dir . $question_img_name);
    }

    // Seçenek görsellerini işle
    $option_paths = [];
    if ($options) {
        for ($i = 0; $i < count($options['name']); $i++) {
            if ($options['error'][$i] == 0) {
                $option_name = time() . "_" . basename($options['name'][$i]);
                $option_path = $upload_dir . $option_name;
                move_uploaded_file($options['tmp_name'][$i], $option_path);
                $option_paths[] = $option_name;
            }
        }
    }

    // Yazılı cevapları virgül ile birleştir
    $new_val = implode("|", $answers_text);
    

    // Görsel seçenekleri de virgül ile birleştir
    $options_string = implode(",", $option_paths);

    // Veritabanına ekle
    $stmt = $connect->prepare("INSERT INTO questions (question_text, options, answers_text, correct_answer, caryek, question_img) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssiss", $question_text, $options_string, $new_val, $correct_answer, $caryekler, $question_img_path);

    if ($stmt->execute()) {
        echo "Soru başarıyla eklendi!";
    } else {
        echo "Hata: " . $stmt->error;
    }

    $stmt->close();
    $connect->close();
}
?>
