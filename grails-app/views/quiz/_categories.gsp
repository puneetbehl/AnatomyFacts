<div style="display: none">
    <g:select name="categories" from="${categories}" optionKey="id" optionValue="name" multiple="true"/>
</div>
<ul id="sourceCategories" class="droptrue">
    <g:each in="${categories}" var="category">
        <li class="ui-state-default" id="${category?.id}">
            ${category?.name}
        </li>
    </g:each>
</ul>
<ul id="selectedCategories" class="droptrue">

</ul>
<br style="clear: both;"/>

<style>
#sourceCategories, #selectedCategories {
    list-style-type: none;
    margin-left: 5px;
    padding: 0;
    float: left;
    margin-right: 20px;
    background: #eee;
    padding: 5px;
    width: 220px;
}

#sourceCategories li, #selectedCategories li {
    margin: 5px;
    padding: 5px;
    font-size: 1.2em;
    width: 200px;
}
</style>
<script>
    $(function () {
        $("ul.droptrue").sortable({
            connectWith:"ul",
            stop:function () {
                $('#sourceCategories li').each(function () {
                    $(this).attr('class','ui-state-default');
                    var id = $(this).attr('id');
                    $("select[name=categories] option[value=" + id + "]").removeAttr('selected')
                })

                $('#selectedCategories li').each(function () {
                    $(this).attr('class','ui-state-highlight');
                    var id = $(this).attr('id');
                    $("select[name=categories] option[value=" + id + "]").attr('selected', 'true')
                })

            }
        });
        $("#sourceCategories, #selectedCategories").disableSelection();
    });
</script>


