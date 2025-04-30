$(function () {
    // Sayfa yüklendiğinde işlemleri başlat
    $("#update_quest_answer").hide();

    $(".order_questions").on("click", function () {
        $("#question-form, .order_questions").hide();
        $("#update_quest_answer").show();

        // Soru listesini getir
        $.ajax({
            url: 'call_pages/question_answer/get_questions.php',
            method: 'GET',
            success: function (data) {
                $("#question_select").html('<option value="">Soragy sayla</option>' + data);
            },
            error: function () {
                alert("Bir hata oluştu. Lütfen tekrar deneyin.");
            }
        });
    });

    // Soru seçildiğinde detayları getir
    $("#question_select").on("change", function () {
        const questionId = $(this).val();
        
        $("#question_id").val(questionId); // Gizli input'a soru ID'sini ekle
        
        if (!questionId) return;
        
        $.ajax({
            url: 'call_pages/question_answer/get_question_details.php',
            type: 'GET',
            data: { id: questionId },
            success: function (response) {
                try {
                    var result = JSON.parse(response);  
    
                    if (result.status === 'success') {
                        // 1️⃣ **Soru metnini input'a ekleyelim**
                        $("#question_text_data").val(result.question_text);
    
                        // 2️⃣ **Tekli Resmi Göster**
                        if (result.single_image) {
                            $("#single_image_container").html(`
                                <div style="margin-bottom: 20px;">
                                    <img id="single_image" src="${result.single_image}" style="width:150px; height:150px;">
                                    <input type="file" id="single_image_file" onchange="uploadSingleImage()">
                                </div>
                            `);
                        } else {
                            $("#single_image_container").html("<p>Sorag suraty yok.</p>");
                        }
    
                        // 3️⃣ **Çoklu Resimleri Göster**
                        var imageHTML = '';
                        result.images.forEach(function (image, index) {
                            const answerText = result.answers_text && result.answers_text[index] ? result.answers_text[index] : '';
                        
                            imageHTML += `
                                <div style='margin-bottom:20px;'>
                                    <img id='img_${image.index}' src='${image.src}' style='width:150px; height:150px;'>
                                    <input type='file' id='file_${image.index}' onchange='uploadImage(${image.index})'>
                        
                                    <!-- Altına cevap metni -->
                                    <input type='text' class='form-control mt-2 sayla01 answer_text' data-hidden_input="answers_text" name='answer_texts[]' 
                                           value='${answerText}' id='option_${index}_data' placeholder='Jogap metni gir'>
                                </div>
                            `;
                        });
                        $('#image_container').html(imageHTML);
                        
                        // 4️⃣ **Seçenekleri (Cevapları) Göster**
                        var optionsHTML = '';
                        result.options.forEach(function (option, index) {
                            optionsHTML += `
                                <div>
                                    <input type='text' class='form-control option_input ' value='${option}' data-index='${index}'>
                                </div>
                            `;
                        });
                        $('#options_container').html(optionsHTML);                      
                        $('#correct_answer_data').val(result.correct_answer);
    
                    } else {
                        alert(result.message);
                    }    
                } catch (e) {
                    console.error("JSON parse hatası:", e);
                    alert("Veri işlenirken hata oluştu.");
                }
            },
            error: function () {
                alert('Soru detayları getirilirken hata oluştu.');
            }
        });
    });
    
    
    // **Tekli Resim Güncelleme İşlemi**
    window.uploadSingleImage = function () {
        var fileInput = document.getElementById('single_image_file');
        if (!fileInput || !fileInput.files[0]) {
            alert('Lütfen bir dosya seçin.');
            return;
        }

        var file = fileInput.files[0];
        var formData = new FormData();
        formData.append('image', file);
        formData.append('question_id', $('#question_id').val()); // Soru ID'sini gönderiyoruz

        $.ajax({
            url: 'call_pages/question_answer/update_single_image.php', // Tekli resim için PHP dosyası
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                try {
                    var result = JSON.parse(response);
                    if (result.status === 'success') {
                        $('#single_image').attr('src', 'call_pages/question_answer/surat_yukle/' + result.newImage);
                      //  alert('Tekli resim başarıyla güncellendi.');
                    } else {
                        alert(result.message);
                    }
                } catch (e) {
                    alert('Yanıt işlenirken bir hata oluştu.');
                }
            },
            error: function () {
                alert('Resim yüklenirken bir hata meydana geldi.');
            }
        });
    };

    
    // **Çoklu Resim Güncelleme İşlemi**
    window.uploadImage = function (index) {
        var file = $('#file_' + index)[0].files[0];
        if (!file) {
            alert('Lütfen bir dosya seçin.');
            return;
        }
        var formData = new FormData();

        formData.append('image', file);
        formData.append('index', index);
        formData.append('question_id', $('#question_id').val());

        $.ajax({
            url: 'call_pages/question_answer/update.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                try {
                    var result = JSON.parse(response);
                    if (result.status === 'success') {
                        $('#img_' + index).attr('src', 'call_pages/question_answer/surat_yukle/' + result.newImage);
                        //alert('Resim başarıyla güncellendi.');
                    } else {
                        alert(result.message);
                    }
                } catch (e) {
                    alert('Yanıt işlenirken bir hata oluştu.');
                }
            },
            error: function () {
                alert('Resim yüklenirken bir hata meydana geldi.');
            }
        });
    };   


    $(document).on('change', '.sayla01.answer_text', function () {
       // var change_value = $(this).val().replace(/,/g, ''); // virgul yerine hiclik

        var change_value = $(this).val();    
        var id_no = $("#question_id").val();
        var input_id = $(this).attr('id'); // örnek: option_1_data
        var hidden_input = $(this).data('hidden_input'); // örnek: answers_text
    
        // input_id: option_1_data → index: 1
        var index = null;
        var match = input_id.match(/option_(\d+)_data/);
        if (match) {
            index = parseInt(match[1]);
        }
    
        console.log("Gönderilen Veriler:", { 
            change_value: change_value, 
            idno: id_no, 
            hidden_input: hidden_input,
            index: index
        });
    
        $.ajax({
            url: 'call_pages/question_answer/update_question.php',
            method: 'post',
            data: {
                change_value: change_value,                    
                idno: id_no,
                hidden_input: hidden_input,
                index: index // index değeri artık gidiyor
            }, 
            success: function(response) {
                console.log("✅ Sunucu Yanıtı:", response); 
                $("#result_change").html(response);
            },
            error: function(xhr, status, error) {
                console.error("❌ AJAX Hatası:", error);
            }
        });
    });
             
});
