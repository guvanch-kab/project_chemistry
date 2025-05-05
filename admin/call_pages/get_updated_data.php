<?php
require_once '../db_files/dbase.php';

$paragraf_no = $_POST['paragraf_no'] ?? '';
$paragraf_ady = $_POST['paragraf_ady'] ?? '';

$stmt = $connect->prepare("SELECT * FROM amaly_data WHERE paragraf_no = ? AND paragraf_ady = ?");
$stmt->bind_param("ss", $paragraf_no, $paragraf_ady);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
?>

    <!-- Bu form zaten mevcut formunun aynısı olacak -->
    <form id="updateForm">
        <input type="text" name="paragraf_no" value="<?= htmlspecialchars($row['paragraf_no']) ?>">
        <input type="text" name="paragraf_ady" value="<?= htmlspecialchars($row['paragraf_ady']) ?>">
        <textarea name="paragraf_text"><?= htmlspecialchars($row['paragraf_text']) ?></textarea>
        <button type="submit">Güncelle</button>
    </form>

<?php
} else {
    echo "<p>Veri bulunamadı.</p>";
}
?>