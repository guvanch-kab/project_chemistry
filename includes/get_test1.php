<style>
.options-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  padding: 10px;
}

.option-label {
  flex: 1 1 calc(50% - 20px);
  max-width: calc(50% - 20px);
  box-sizing: border-box;
  border: 1px solid #ddd;
  padding: 10px;
  border-radius: 6px;
  background-color: #f9f9f9;
  cursor: pointer;
  overflow: hidden; /* Kapsayıcıdan taşmayı engeller */
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.option-label img {
  width: 100%;
  height: auto;
  display: block;
  object-fit: contain;
  border-radius: 6px;
}

.question-img {
  width: 100%;
  max-width: 600px;
  height: auto;
  display: block;
  margin: 10px auto;
  object-fit: contain;
  border-radius: 6px;
  box-sizing: border-box;
}


.question-image-wrapper {
  max-width: 600px;
  margin: 10px auto;
  background-color: #f9f9f9;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 10px;
  box-sizing: border-box;
  text-align: center;
}

.question-image-wrapper img {
  width: 100%;
  height: auto;
  object-fit: contain;
  border-radius: 6px;
}



@media (max-width: 600px) {
  .option-label {
    flex: 1 1 100%;
    max-width: 100%;
  }
}
</style>


<div id="login-section" class="container mt-5">
    <!-- login_user.php buraya yüklenecek -->
</div>

<div id="test-container" class="quiz-container" style="display: none;">
    <form id="question-form">
        <div class="progress-bar">
            <div id="progress-fill" style="width: 0%;"></div>
        </div>

        <div id=""
            style="text-align: right; font-weight: 600; padding:8px 8px; color:#f9f9f9; 
            border-bottom: 1px solid #b8b8b8; background-color: #ababab;">
            <span>Talyp:</span>
            <span id="username-display"></span>            
        </div>

        <div id=""
            style="font-weight: 600; padding:8px 8px; border-bottom: 1px solid #cee08f; background-color: #fff;">
            <div class="" style="display: flex; justify-content: center;">
            <span id="bolumText">*lar</span>
            <span style="padding: 0 5px;">ucin soraglar</span>
            </div>

        <input type="hidden" id="user_id">
        <input type="hidden" id="user_student_name">
        <p id="question-indicator" style="padding: 5px 0;" class="question-indicator"></p>
  
       <p id="question-text01" class=" question-text" style=" padding: 5px 15px;"> </p>

        </div>

       <div class="options-container question-text" id="question-text"></div>

        <hr>
        <div id="options" class="options-container">
            <!-- Seçenekler buraya yüklenecek -->
        </div>
        <button type="button" id="next-button" class="next-button" disabled>Indiki</button>
    </form>
</div>

<script>
    $(document).ready(function () {
        let currentQuestion = 0; // Şu anki sorunun indeksi
        let questions = []; // Sorular dizisi
        let correctAnswers = 0; // Doğru cevap sayısı
        let incorrectAnswers = 0; // Yanlış cevap sayısı

       
        $("#test-container").hide();

        // login_user.php dosyasını yükle
        
        $("#login-section").load("includes/login_form/login_user.php", function () {
            console.log("Login form loaded.");


            $("#loginForm").on("submit", function (e) {
                e.preventDefault();
                $.ajax({
                    url: "includes/login_form/login.php",
                    type: "POST",
                    data: $(this).serialize(), 
                    success: function (response) {
                        if (response === "success") {
                            // Başarılı girişte login formunu gizle ve testi göster
                            $("#login-section").fadeOut(function () {
                                $("#test-container").fadeIn(); // Test sayfasını aç
                                loadQuestions(); // Test sorularını yükle

                                // Kullanıcı bilgilerini oturumdan al

                                $.get("includes/login_form/get_user.php", function (response) {
                                    const data = JSON.parse(response);

                                    if (data.status === "success") {
                                        const userId = data.user_id;
                                        const username = data.user_name;
                                        const bolumText = data.bolumText;

                                        //alert(bolumText)

                                        // Kullanıcı adını ve ID'sini UI'de göster
                                        $("#username-display").text(username);
                                        $("#user_id").val(userId);
                                        $("#user_student_name").val(username);
                                        $("#bolumText").text(bolumText);
                                        loadQuestions(bolumText);

                                    } else {
                                        console.error(data.message);
                                        $("#username-display").text("Giriş başa barmady.");
                                    }
                                });


                            });
                        } else {

                            $("#loginResult").html('<div class="text-danger">' + response + '</div>');
                        }
                    }
                });
            });
        });
     
       function loadQuestions() {
   
    const bolumText = $('#bolum_caryek :selected').text(); 
    
    if (!bolumText || bolumText === "Caryek sayla") {
        console.error("Caryek seçilmedi.");
        $("#test-container").html("<div class='text-danger'>Caryek seçilmedi.</div>");
        return; // Devam etme
    }

    $.get("includes/load_questions1.php", { bolumText: bolumText }, function (response) {
        console.log("PHP'den gelen cevap:", response); // PHP'den gelen cevabı kontrol edin
        const data = JSON.parse(response);
        if (data.status === "error") {
            $("#test-container").html(data.message);
        } else if (data.status === "success") {

            console.log("Soru listesi:", data.data);
        data.data.forEach((question, index) => {
            console.log(`Soru ${index + 1}:`, question);
            console.log("Resimler:", question.question_img);
        });

            questions = data.data;
            loadQuestion(currentQuestion);
            updateProgress();
            updateIndicator();
        }
    });
}

function loadQuestion(index) { 
    if (index < questions.length) {
        let questionData = questions[index];
        
        $("#question-text01").text(questionData.question);
        $("#options").empty();
        $("#question-text").empty();

        if (questionData.question_img.length > 0) {
            questionData.question_img.forEach(imgUrl => {
                let imgElement = `<img src="${imgUrl}" class="question-img" style="max-width:400px; display: block; margin: 10px auto;">`;
                $("#question-text").append(imgElement);
            });
        }
        questionData.options.forEach((option, i) => {
  let isImage = option.match(/\.(jpeg|jpg|png|gif)$/i);
  let answerText = questionData.answers && questionData.answers[i] ? questionData.answers[i] : "";

  let optionHtml = isImage 
    ? `<label class="option-label">
         <input type="radio" class="radio_answers" name="answer" value="${i + 1}">
         <img src="admin/call_pages/question_answer/surat_yukle/${option}" class="question-img" alt="Seçenek ${i + 1}" style="max-width: 300px; display: block; margin: 10px auto;">
         <div class="answer-text">${answerText}</div>
       </label>`
    : `<label class="option-label">
         <input type="radio" class="radio_answers" name="answer" value="${i + 1}"> ${option}
         <div class="answer-text">${answerText}</div>
       </label>`;

  $("#options").append(optionHtml);
});


        $("#next-button").prop("disabled", true);
        updateIndicator();
    } else {
        showResults();
    }
}




        function showResults() {
    const score = Math.round((correctAnswers / questions.length) * 100); // Skor hesaplama
    const userId = $("#user_id").val(); // Kullanıcı ID'si
    const studentName = $("#user_student_name").val(); // Öğrenci adı
    const caryekal=$("#bolumText").text();

    //alert(caryekal)


    // Veritabanına sonuçları kaydet
    $.post("includes/save_results.php", {
        user_id: userId,
        student_name: studentName,
        score: score,
        correct_answers: correctAnswers,
        incorrect_answers: incorrectAnswers,
        caryekal:caryekal
    }, function (response) {
        console.log("Sonuçlar kaydedildi: ", response);
    }).fail(function () {
        console.error("Sonuçlar kaydedilemedi.");
    });

    // Sonuçları kullanıcıya göster
    $("#test-container").html(`
        <div class="result-container">
            <h3 id="user_name" class="ulanyjy"> Okuwçy : ${studentName}</h3> 
            <h5>Siziň bahaňyz: ${score}/100</h5>
            <p>Dogry sany: ${correctAnswers}</p>
            <p>Ýalňyş sany: ${incorrectAnswers}</p>
            <p>Quiz - synag üçin sagboluň!</p>
        </div>
    `);
}


        // İlerlemenin güncellenmesi
        function updateProgress() {
            const progress = ((currentQuestion + 1) / questions.length) * 100;
            $("#progress-fill").css("width", progress + "%");
        }

        // Göstergeyi güncelleme
        function updateIndicator() {
            const current = currentQuestion + 1;
            const total = questions.length;
            $("#question-indicator").text(`Sorag: ${current}/${total}`);
           
        }

        $("#options").on("change", "input[name='answer']", function () {
            const selectedAnswer = $("input[name='answer']:checked").val();
            const correctAnswer = questions[currentQuestion].correct_answer;

            $(".option-label").removeClass("bg-success bg-danger text-white");
            $(".option-label .feedback-icon").remove(); // Önceki simgeleri kaldır

            // Doğru cevabı yeşil yap
            $(`input[name='answer'][value='${correctAnswer}']`)
                .closest("label")
                .addClass("bg-success text-white")
                .append('<span class="feedback-icon">😊</span>'); // Gülen yüz ekle

            // Yanlış cevap seçilmişse kırmızı yap
            if (parseInt(selectedAnswer) !== parseInt(correctAnswer)) {
                incorrectAnswers++;
                $("input[name='answer']:checked")
                    .closest("label")
                    .addClass("bg-danger text-white")
                    .append('<span class="feedback-icon">😢</span>'); // Üzgün yüz ekle
            } else {
                correctAnswers++;
            }

            $("input[name='answer']").prop("disabled", true);
            $("#next-button").prop("disabled", false);
        });

        // Sonraki soruya geçiş
        $("#next-button").click(function () {
            const selectedAnswer = $("input[name='answer']:checked").val();
            const userId = $("#user_id").val(); // user_id'yi formdan alıyoruz
            const studentName = $("#user_student_name").val(); // user_id'yi formdan alıyoruz
            $.post("includes/save_answer.php", {
                question_id: questions[currentQuestion].id,
                answer: selectedAnswer,
                user_id: userId,
                user_student:studentName

            }, function (response) {
                currentQuestion++;
                loadQuestion(currentQuestion);
                updateProgress();
            });
        });
    });

</script>


