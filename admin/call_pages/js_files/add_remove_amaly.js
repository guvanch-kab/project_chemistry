$(document).ready(function () {

    loadBolumler();

    // Bölüm ekle
    $('#add_bolum').click(function () {
        const amaly_no = $('#bolum_input').val();
        var file_data = $("#bolum_input").data("file_data");  // data-file_data özelliğinden değeri al

        alert(amaly_no + file_data);  // Test amaçlı

        if (amaly_no === "") {
            alert("Bölüm ady boş bolmaly däl!");
            return;
        }

        // AJAX isteğini gönder
        $.ajax({
            url: 'call_pages/amaly_handler.php',
            type: 'POST',
            data: { action: 'amaly', amaly_no: amaly_no, file_data: file_data },  // Dinamik file_data ile gönder
            success: function (response) {
               // alert(response); // Test mesajı
                $('#bolum_input').val(''); // Input alanını temizle
                loadBolumler(); // Listeyi güncelle
            }
        });
    });

    // Bölüm sil
    $('#delete_bolum').click(function () {
        const bolum_id = $('#bolum_select').val();
//alert(bolum_id + file_data)
        if (!bolum_id) {
            alert("Pozmak üçin bir bölüm saylaň!");
            return;
        }

        $.ajax({
            url: 'call_pages/amaly_handler.php',
            type: 'POST',
            data: { action: 'delete', id: bolum_id, file_data: file_data },  // Dinamik file_data ile gönder
            success: function (response) {
                loadBolumler(); // Listeyi güncelle
            }
        });
    });

    // Bölüm listesini yükle
    function loadBolumler() {
        var file_data = $("#bolum_input").data("file_data");  // Dinamik file_data değerini al

        $.ajax({
            url: 'call_pages/amaly_handler.php',
            type: 'POST',
            data: { action: 'ishno_al', file_data: file_data },  // Dinamik file_data ile gönder
            success: function (response) {
                try {
                    var data = JSON.parse(response);
                    console.log(data);  // JSON verisini konsolda görüntüle

                    // Verileri işlemeye devam edebilirsiniz
                    // Örneğin, seçenekleri bir select içine eklemek için
                    var options = "";
                    data.forEach(function(item) {
                        options += "<option value='" + item.id + "'>" + item.belgi + "</option>";
                    });
                    $('#bolum_select').html(options);  // Verileri select listesine ekle

                } catch (e) {
                   // console.error("JSON Parsing Error: ", e);
                    //alert("Veri alınırken bir hata oluştu!");
                }
            }
        });
    }
});
