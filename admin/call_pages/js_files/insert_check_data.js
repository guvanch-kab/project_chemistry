$(document).ready(function () {
    // Uyarı mesajını gizle (linklere tıklanınca)
    $(document).on("click", "a", function () {
        $("#response").html("");
    });
    $("#add_Product").on("submit", function (e) {
        e.preventDefault();
        var file_data = $("#dosya_adi").data("file_data");  // data-file_data özelliğinden değeri al

        var dosya_adi=$("#dosya_adi").val();
      //  alert(file_data)

        var formData = new FormData(this);
        var bolum_belgi = $("#bolum_select option:selected").text() || "Bilinmiyor";
        formData.append("bolum_belgi", bolum_belgi);

        $.ajax({
            url: "call_pages/"+dosya_adi,
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                console.log("Response:", response);

                // Response JSON ise parse et, değilse HTML gibi göster
                let json;
                try {
                    json = JSON.parse(response);
                } catch (e) {
                    // Response zaten Bootstrap alert içeren HTML
                    $("#response").html(response);
                    return;
                }

                // Sadece JSON mesaj için devam et
                let alertType = json.status === "success" ? "success" :
                                json.status === "duplicate" ? "danger" : "warning";

                const alertMessage = `<div class="alert alert-${alertType}" role="alert">
                                        ${json.message}
                                      </div>`;
                $("#response").html(alertMessage);
                if (json.status === "success") {                    
                    $("#add_Product")[0].reset();
                  /*  amaly_data.php sahypasyna yza don, refresh page */
                   setTimeout(function () {
                    var page="call_pages/"+file_data+".php";//amaly_data.php";
                    $(".main_place").empty()
                    $(".main_place").load(page, function () {
                    });
                }, 2000);
                }
            },
            error: function () {
                $("#response").html(`<div class="alert alert-danger">Sunucu hatası oluştu.</div>`);
            }
        });
    });
});
