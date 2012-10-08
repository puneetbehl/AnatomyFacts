<%@ page import="com.intelligrape.anatomyfacts.Tip" %>

<table class="table table-bordered">
    <tr>
        <td>
            <label for="content">
                <g:message code="tip.content.label" default="Content"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:textArea cols="15" rows="7" name="content" maxlength="200" required="" value="${tip?.content}" class="tip_content"/>
        </td>
    </tr>
    <tr>
        <td>
            <label for="category">
                <g:message code="tip.category.label" default="Category"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:select id="category" name="category.id" from="${com.intelligrape.anatomyfacts.Category.list()}" optionKey="id" required="" value="${tip?.category?.id}"
                      class="many-to-one input-xxlarge"/>
        </td>
    </tr>
</table>

