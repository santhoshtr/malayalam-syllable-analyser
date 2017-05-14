$("#syllabalize").click(function() {
    var result, content, $error;

    $error=$('.error');
    content = $(".content").val();
    try {
        result = malayalamSyllableParser.parse(content);
        showResults(result);
        $error.empty();
    } catch (error) {
        $error.html(error.message);
    }
});

function showResults(result) {
    var $result = $(".result").empty();
    for (var i = 0; i < result.length; i++) {
        $result.append($("<span>").addClass("chip").text(result[i]));
    }
}
