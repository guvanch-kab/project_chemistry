<?php
header('Content-Type: text/html; charset=utf-8');
require_once '../../db_files/dbase.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $action_caryek = isset($_POST['caryek']) ? trim($_POST['caryek']) : '';
    $get_Date = isset($_POST['tarih_al']) ? trim($_POST['tarih_al']) : '';

    echo'<pre';
    echo $_POST['tarih_al'];
    echo'</pre>';

    // Temel SQL sorgusu
    $query = "SELECT * FROM exam_result WHERE 1=1";

    // Caryek varsa
    if (!empty($action_caryek)) {
        $query .= " AND caryek = '" . mysqli_real_escape_string($connect, $action_caryek) . "'";
    }

    // Tarih varsa
    if (!empty($get_Date)) {
        $query .= " AND DATE(exam_date) = '" . mysqli_real_escape_string($connect, $get_Date) . "'";
    }

    $result = mysqli_query($connect, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        echo '<table class="table table-bordered" style="background-color:#fff;">
            <thead>
                <tr>
                    <th>Ulanyjy ID</th>
                    <th>Okuwcy Ady</th>
                    <th>Synag senesi</th>
                    <th>Netije</th>
                    <th>Dogru sany</th>
                    <th>Yalňyş sany</th>
                    <th>Çarýek</th>
                    <th>Poz</th>
                </tr>
            </thead>
            <tbody>';

        while ($row = mysqli_fetch_assoc($result)) {
            echo '<tr>
                    <td>' . htmlspecialchars($row['user_id']) . '</td>
                    <td>' . htmlspecialchars($row['student_name']) . '</td>
                    <td>' . htmlspecialchars($row['exam_date']) . '</td>
                    <td>' . htmlspecialchars($row['result']) . '</td>
                    <td>' . htmlspecialchars($row['correct_count']) . '</td>
                    <td>' . htmlspecialchars($row['incorrect_count']) . '</td>
                    <td>' . htmlspecialchars($row['caryek']) . '</td>
                    <td><button type="button" class="btn btn-danger delete-row"
                        data-exam_date="' . htmlspecialchars($row['exam_date']) . '"
                        data-caryek="' . htmlspecialchars($row['caryek']) . '"
                        data-id="' . htmlspecialchars($row['user_id']) . '">Poz</button></td>
                </tr>';
        }

        echo '</tbody></table>';
    } else {
        echo '<p>Maglumat tapylmady.</p>';
    }
}

mysqli_close($connect);
?>



<script>
$(document).ready(function () {
    $(".delete-row").click(function () {
        if (!confirm("Bu setiri pozmak isleyanizmi?")) {
            return;
        }

        var row = $(this).closest("tr"); // Silinecek satırı belirle
        var id_belgi = $(this).data("id"); // Butonun data-id değerini al
        var caryek_belgi = $(this).data("caryek"); // Butonun data-id değerini al
        
        var caryek_senesi = $(this).data("exam_date"); // Butonun data-id değerini al

        $.ajax({
            url: 'call_pages/question_answer/delete_row_exam.php',
            type: "POST",
            data: { Id_belgi: id_belgi, caryek_belgi:caryek_belgi, caryek_senesi:caryek_senesi }, // ID'yi gönder
            success: function (response) {
                if (response.trim() === "success") {
                    alert("Setir üstünlikli pozuldy");
                    row.remove(); // Tablo satırını kaldır
                } else {
                    alert("Silme işlemi başarısız: " + response);
                }
            },
            error: function () {
                alert("Silme sırasında bir hata oluştu.");
            },
        });
    });
});
</script>
