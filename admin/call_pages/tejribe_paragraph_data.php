<?php
require_once '../db_files/dbase.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $paragraf_no = $connect->real_escape_string($_POST['paragraf_no'] ?? '');
    $paragraf_ady = $connect->real_escape_string($_POST['paragraf_ady'] ?? '');

    $sql = "SELECT id, nomeri, Bolum_ady, Paragraf_no, Paragraf_ady, PDF_file_ady, Surat FROM tejribe_data WHERE Paragraf_ady='$paragraf_ady' ";
    if (!empty($paragraf_no)) {
        $sql .= " AND Paragraf_no = '" . $connect->real_escape_string($paragraf_no) . "'";
    }
    $sql .= " ORDER BY nomeri";

    $result = $connect->query($sql);

    if ($result->num_rows > 0) {
        echo '<form id="updateForm" enctype="multipart/form-data">';
        while ($row = $result->fetch_assoc()) {
            //  echo '<div class="card mb-3 p-3 border rounded bg-light">';
            echo '<div class="card mb-3 p-3 border rounded bg-light" data-id="' . $row['id'] . '">';

            echo '<div class="row g-2">';

            echo '<div class="col-md-2"><label>ID</label><input type="number" name="id_belgi[]" value="' . $row['id'] . '" class="form-control"></div>';
            echo '<div class="col-md-2"><label>Tejribe No</label><input type="text" name="Bolum_belgi[]" value="' . htmlspecialchars($row['nomeri']) . '" class="form-control"></div>';

            // Bölüm Ady -> textarea
            echo '<div class="col-md-4"><label>Bölüm Ady</label><textarea name="Bolum_ady[]" class="form-control" rows="2">' . htmlspecialchars($row['Bolum_ady']) . '</textarea></div>';

            echo '<div class="col-md-2"><label>Paragraf No</label><input type="text" name="Paragraf_no[]" value="' . htmlspecialchars($row['Paragraf_no']) . '" class="form-control"></div>';

            echo '<div class="col-md-12"><label>Paragraf Ady</label><textarea name="Paragraf_ady[]" class="form-control" rows="3">' . htmlspecialchars($row['Paragraf_ady']) . '</textarea></div>';

            // PDF dosyası input + önizleme
            echo '<div class="col-md-6"><label>PDF File</label><input type="file" name="PDF_file_ady[]" class="form-control">';
            if (!empty($row['PDF_file_ady'])) {
                echo '<div class="mt-2"><strong>Önizleme:</strong><br>';
                echo '<iframe src="call_pages/pdf_files/' . htmlspecialchars($row['PDF_file_ady']) . '" width="100%" height="450px"></iframe>';
                echo '</div>';
            }
            echo '</div>';

            echo '<div class="col-md-6"><label>Surat</label><input type="file" name="Surat[]" class="form-control">';
            if (!empty($row['Surat'])) {
                echo '<div class="mt-2"><strong>Önizleme:</strong><br>';
                echo '<img class="card-img-top" src="call_pages/uploads/' . htmlspecialchars($row['Surat']) . '" alt="Surat" style="max-width:100%; max-height:450px;">';
                echo '</div>';
            }
            echo '</div>';

            echo '<div class="col-md-12 mt-2">';

            echo'<div class="updated_success" style="padding:10px 0;">  </div> ';

            echo '<button type="button" class="btn btn-success update-row">Üýtget</button> ';
            echo '<button type="button" class="btn btn-danger delete-row">Poz</button>';
            echo '</div>';

            echo '</div></div>';
        }
        echo '</form>';
    } else {
        echo "Maglumat tapylmady.";
    }

    $connect->close();
}
?>

<script>
    $(function() {
        $(".update-row").click(function() {
            var row = $(this).closest(".card");

            var id_belgi = row.find("input[name='id_belgi[]']").filter(':first').val();
            var bolum_belgi = row.find("input[name='Bolum_belgi[]']").filter(':first').val();
            var bolum_ady = row.find("textarea[name='Bolum_ady[]']").filter(':first').val();
            var paragraf_no = row.find("input[name='Paragraf_no[]']").filter(':first').val();
            var paragraf_ady = row.find("textarea[name='Paragraf_ady[]']").filter(':first').val();

            var pdf_file_input = row.find("input[name='PDF_file_ady[]']").filter(':first')[0];
            var surat_input = row.find("input[name='Surat[]']").filter(':first')[0];

            var formData = new FormData();
            formData.append("Id_belgi", id_belgi);
            formData.append("Bolum_belgi", bolum_belgi);
            formData.append("Bolum_ady", bolum_ady);
            formData.append("Paragraf_no", paragraf_no);
            formData.append("Paragraf_ady", paragraf_ady);
            formData.append("amaly_upd", "tejribe_upd");

            // PDF dosyasının seçili olup olmadığını kontrol et
            if (pdf_file_input && pdf_file_input.files && pdf_file_input.files.length > 0) {
                formData.append("PDF_file_ady", pdf_file_input.files[0]);
            }
            // Surat dosyasının seçili olup olmadığını kontrol et
            if (surat_input && surat_input.files && surat_input.files.length > 0) {
                formData.append("Surat", surat_input.files[0]);
            }

            $.ajax({
                url: "call_pages/update_data.php",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json", // JSON olarak alacağımızı belirtiyoruz
                success: function(response) {
                    
                    if (response.status === "success") {
        // Görseli güncelle (zaten var)
        var surat_file = response.Surat;
        var imgElement = row.find(".card-img-top");
        imgElement.attr("src", "call_pages/uploads/" + surat_file + "?t=" + new Date().getTime());

        // ✨ Güncellenen değerleri sayfada göster ✨
        row.find("input[name='Bolum_belgi[]']").val(response.bolum_belgi);  // nomeri olarak kaydediliyor
        row.find("textarea[name='Bolum_ady[]']").val(response.Bolum_ady);
        row.find("input[name='Paragraf_no[]']").val(response.Paragraf_no);
        row.find("textarea[name='Paragraf_ady[]']").val(response.Paragraf_ady);
        var iframe = row.find("iframe");
if (response.PDF_file_ady) {
    iframe.attr("src", "call_pages/pdf_files/" + response.PDF_file_ady + "?t=" + new Date().getTime());
}      

        $(".updated_success").addClass("alert alert-success")
          .text("Üýtgetme üstünlikli ýerine ýetirildi.") // İsteğe bağlı metin
        //   .fadeIn().delay(5000).fadeOut();

          setTimeout(function () {           
                    var page="call_pages/tejribe_data.php";//amaly_data.php";
                    $(".main_place").empty()
                    $(".main_place").load(page, function () {
                    });
                }, 4000);     
    }

                    else {
                        alert("❌ Hata: " + (response.message || "Bilinmeyen hata oluştu."));
                    }
                },
                error: function(xhr, status, error) {
                    alert("⚠️ Sunucu hatasy: " + error);
                },
            });
        });
        //});

        // });

        $(document).on("click", ".delete-row", function(event) {
            event.preventDefault();

            // if (!confirm("Bu setiri pozmak isleyanizmi?")) return;

            var $button = $(this);
            var $card = $button.closest(".card");
            var id_belgi = $card.data("id"); // data-id’den oku
            var tejribe_delete = "tejribe_data";

            $.ajax({
                url: "call_pages/delete_data.php",
                type: "POST",
                dataType: "json",
                data: {
                    Id_belgi: id_belgi,
                    poz_delete: tejribe_delete
                },
                success: function(response) {
                    if (response.status === "success") {
                    $(this).remove();
                    //window.location.reload();

                    setTimeout(function () {           
                    var page="call_pages/tejribe_data.php";//amaly_data.php";
                    $(".main_place").empty()
                    $(".main_place").load(page, function () {
                    });
                }, 1000);

                    }
                     else {
                        alert("❌ Hata: " + response.message);
                    }
                },
                error: function() {
                    alert("❌ Pozmakda hata yuze çykdy.");
                }
            });
        });

    });
</script>