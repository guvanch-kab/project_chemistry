$(function () {

    /*   Sorulari ve resimleri gonder, insert et */
    $('#question-form').on('submit', function (e) {
        e.preventDefault();

       // 🔁 Cevapları | ile birleştir
    let cevaplar = [];
    $('input[name="answers[]"]').each(function () {
        cevaplar.push($(this).val().trim());
    });
        var formData = new FormData(this);
        var caryekler = $("#bolum_caryek option:selected").data('name');
        formData.append('caryekler', caryekler);
        formData.append('answers_text', cevaplar.join('|')); // 👉 "|" ile birleştirilmiş string olarak ekle

        $.ajax({
            url: 'call_pages/question_answer/submit_question.php',
            type: 'POST',
            data: formData,
            contentType: false, // Bu ayar, form verisinin doğru şekilde gönderilmesini sağlar
            processData: false, // Form verilerinin işlenmesini engeller

            success: function (response) {
                $('#response-message').html(
                    `<div class="alert alert-success">${response}</div>`
                );
                $('#question-form')[0].reset();
                $('#options-container').html(''); // Seçenekleri temizle
                optionCount = 2;
                // setTimeout(() => window.location.reload(), 6000); // Sayfayı yenile
            },

            error: function () {
                $('#response-message').html(
                    '<div class="alert alert-danger">Bir hata oluştu. Lütfen tekrar deneyin.</div>'
                );
            }
        });
    });

});
