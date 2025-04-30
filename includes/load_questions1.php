<?php
require_once '../admin/db_files/dbase.php';

$bolumText = isset($_GET['bolumText']) ? $_GET['bolumText'] : null;

if (empty($bolumText)) {
    echo json_encode([
        "status" => "error",
        "message" => "<div class='alert alert-warning text-center' role='alert'>
                        <strong>Warning!</strong> Caryek seçilmedi.
                      </div>"
    ]);
    exit;
}

$stmt = $connect->prepare("SELECT * FROM questions WHERE caryek = ? ORDER BY RAND()");
$stmt->bind_param("s", $bolumText);
$stmt->execute();
$result = $stmt->get_result();

$questions = [];

while ($row = $result->fetch_assoc()) {
    $question_img = trim($row["question_img"]);

    if (!empty($question_img)) {
        $question_img = ["admin/call_pages/question_answer/surat_yukle/" . $question_img];
    } else {
        $question_img = [];
    }

    // options sütununu diziye çevir
    $options = explode(',', $row["options"]);
    $options = array_map('trim', $options);

    // answers_text sütununu diziye çevir
    $answers = explode('|', $row["answers_text"]);
    $answers = array_map('trim', $answers);

    $question = [
        "id" => $row["id"],
        "question" => $row["question_text"],
        "correct_answer" => $row["correct_answer"],
        "options" => $options,
        "answers" => $answers,
        "question_img" => $question_img
    ];

    $questions[] = $question;
}

if (empty($questions)) {
    echo json_encode([
        "status" => "error",
        "message" => "<div class='alert alert-warning text-center' role='alert'>
                        <strong>Warning!</strong> Bu Caryek üçin sorag tapylmady.
                      </div>"
    ]);
} else {
    echo json_encode([
        "status" => "success",
        "data" => $questions
    ]);
}

$stmt->close();
$connect->close();
?>
