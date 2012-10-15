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
};
$(document).ready(function () {
    $('.pagination').children().wrapAll('<ul>');
    $('.pagination ul').children().wrap('<li>');

    $('.option').bind('click', function () {
        $(this).parent().siblings().children('.option').attr('checked', false);
    });

    $('.tags').tagsInput({
        'width':'530px',
        autocomplete_url:urls.tags_autocomplete_url

    });
    $('.tip_content').css('width', '530px');
    $('.tip_form').css('margin', '0px 0px');

    $('div.questions').hide();
    if($('div.questions').length)   {
        $('div#0').show().addClass('active');
    }
    $('li.previous').hide();
});

function nextQuestion() {
    var divId = parseInt($('div.active').attr('id'), 10)
    $('div#' + divId).hide().removeClass('active');
    divId += 1;
    $('div#' + divId).show().addClass('active');
    showHideButton();
}

function prevQuestion() {
    var divId = parseInt($('div.active').attr('id'), 10)
    $('div#' + divId).hide().removeClass('active');
    divId -= 1;
    $('div#' + divId).show().addClass('active');
    showHideButton();
}

function getSimilarTagsFromDB() {
    $.ajax({
        url:urls.tags_autocomplete_url,
        data:$('tags').val(),
        success:function (result) {
            $('.tags').tagsInput({
                autocomplete_url:result
            });
        }
    });
}
function showHideButton() {
    $('ul.pager li').show()
    if(parseInt($('div.active').attr('id'),10) == 0) {
        $('li.next').show();
        $('li.previous').hide();
    }
    if(parseInt($('div.active').attr('id'),10) == $('div.questions').length-1) {
        $('li.next').hide();
        $('li.previous').show();

    }
}