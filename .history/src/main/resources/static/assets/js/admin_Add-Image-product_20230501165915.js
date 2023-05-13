

function chooseFile(fileInput) {
    if (fileInput.files
            && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#image1').attr('src',
                    e.target.result);
        }
        reader
                .readAsDataURL(fileInput.files[0]);
    }
}
function chooseFile2(fileInput) {
    if (fileInput.files
            && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#image2').attr('src',
                    e.target.result);
        }
        reader
                .readAsDataURL(fileInput.files[0]);
    }
}
function chooseFile3(fileInput) {
    if (fileInput.files
            && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#image3').attr('src',
                    e.target.result);
        }
        reader
                .readAsDataURL(fileInput.files[0]);
    }
}
function chooseFile4(fileInput) {
    if (fileInput.files
            && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#image4').attr('src',
                    e.target.result);
        }
        reader
                .readAsDataURL(fileInput.files[0]);
    }
}
function chooseFileInfo(fileInput) {
    if (fileInput.files
            && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#image').attr('src',
                    e.target.result);
        }
        reader
                .readAsDataURL(fileInput.files[0]);
    }
}
					