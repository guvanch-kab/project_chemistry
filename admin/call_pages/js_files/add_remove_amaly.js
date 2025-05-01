$(document).ready(function () {

    loadBolumler();

    // Bölüm ekle
    $('#add_bolum').click(function () {
        const amaly_no = $('#bolum_input').val();

        if (amaly_no === "") {
            alert("Bölüm ady boş bolmaly däl!");
            return;
        }
        $.ajax({
            url: 'call_pages/amaly_handler.php',
            type: 'POST',
            data: { action: 'amaly', amaly_no: amaly_no },
            success: function (response) {
                alert(response); // bunu test et
                $('#bolum_input').val(''); // Input alanını temizle
                loadBolumler(); // Listeyi güncelle
            }
        });
    });

    // Bölüm sil
    $('#delete_bolum').click(function () {
        const bolum_id = $('#bolum_select').val();
        
        if (!bolum_id) {
            alert("Pozmak üçin bir bölüm saylaň!");
            return;
        }

        $.ajax({
            url: 'call_pages/amaly_handler.php',
            type: 'POST',
            data: { action: 'delete', id: bolum_id },
            success: function (response) {
                //alert(response); // Sunucudan gelen mesaj
                loadBolumler(); // Listeyi güncelle
            }
        });
    });

    // Bölüm listesini yükle
    function loadBolumler() {
        $.ajax({
            url: 'call_pages/amaly_handler.php',
            type: 'POST',
            data: { action: 'ishno_al' },
            success: function (data) {
                $('#bolum_select').html('<option selected disabled value="">Sayla</option>' + data);
            }
        });
    }
});
