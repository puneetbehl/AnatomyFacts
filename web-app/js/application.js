if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
                $(this).fadeOut();
            });
    })(jQuery);
}
var urls = {
    tags_autocomplete_url:""
}
$(document).ready(function () {
    $('.pagination').children().wrapAll('<ul>');
    $('.pagination ul').children().wrap('<li>');

    $('.option').bind('click', function () {
        $(this).parent().siblings().children('.option').attr('checked', false)
    });

    $('.tags').tagsInput({
        'width':'530px',
        autocomplete_url:urls.tags_autocomplete_url
    })
});