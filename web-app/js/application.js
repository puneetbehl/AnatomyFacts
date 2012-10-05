if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
                $(this).fadeOut();
            });
    })(jQuery);
}
$(document).ready(function () {
    $('.pagination').children().wrapAll('<ul>')
    $('.pagination ul').children().wrap('<li>')
    $('input[name=tags]').typeahead({
        source:['one', 'two', 'three'],
        items:3,
        minLength:2

    });

    $('.option').bind('click', function () {
        $(this).parent().siblings().children('.option').attr('checked', false)
    });
});


var urls = {
    tags_autocomplete_url:""
}