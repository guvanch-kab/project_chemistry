

$(function () {
    let optionCount =2; // Başlangıç seçeneği sayısı

    $(document).off('click', '#add-option').on('click', '#add-option', function () {
        if (optionCount < 5) {
            optionCount++;
            const newOption = `
                <div class="option-group">
                    <label for="option_${optionCount}" class="form-label">Jogap ${optionCount}</label>
                    <input style="width:80%" type="text" class="form-control subscript-input sayla01" id="question_text${optionCount}" name="answers[]" >
                    <input style="width:20%" type="file" class="form-control" id="option_${optionCount}" name="options[]">
                    <button type="button" class="btn btn-danger remove-option">Poz</button>
                </div>`;
            $('#options-container').append(newOption);
        }
    });

    $(document).off('click', '.remove-option').on('click', '.remove-option', function () {
        if (optionCount > 2) {
            $(this).closest('.option-group').remove();
            optionCount--;
        }
    });
});