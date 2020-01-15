<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@include file="/WEB-INF/jsp/common/common.jsp"%>
<script type="text/javascript">
    $(document).ready(function () {
        $('#nif').focus();
        $('#buttonAdd').click(function () {
            document.location.href = '${ctxAdministracion}/usuarioEdit.htm';
        });
        $('#buttonSearch').click(function () {
            $('form').submit();
        });
        $('#confirmDelete').on('show.bs.modal', function (event) {
            $(this).find('.btn-ok').attr('href', $(event.relatedTarget).data('href'));
        });
        $('.date').datepicker({
            autoclose: true,
            todayHighlight: true,
            language: "es"
        });
    });
</script>
<div class="row row-heading-app">
    <div class="col-md-9">
        <h4 class="text-primary text-uppercase"><fmt:message key="header.administracion"/> <small><fmt:message key="header.usuarios"/></small></h4>
    </div>
    <div class="col-md-3 text-right">
        <button id="buttonAdd" type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-plus"></span> <fmt:message key="button.nuevo.usuario"/>
        </button>
    </div>
</div>
<jsp:include page="/WEB-INF/jsp/common/messages-error.jsp" flush="true">
    <jsp:param name="beanName" value="usuarioSearchCommand"/>
</jsp:include>
<jsp:include page="/WEB-INF/jsp/common/messages-check.jsp"/>
<div class="panel panel-info panel-table">
    <div class="panel-heading">
        <a data-toggle="collapse" href="#collapseSearchCriteria"></a>
        <fmt:message key="panel.header.search"/>
        <button id="buttonSearch" class="btn btn-xs btn-default pull-right"><span class="glyphicon glyphicon-search"></span> <fmt:message key="button.buscar"/></button>
    </div>	
    <div id="collapseSearchCriteria" class="panel-collapse collapse in">
        <div class="panel-body">
            <form:form role="form" action="${ctxAdministracion}/usuarioSearch.htm" commandName="usuarioSearchCommand">	
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group form-group-sm">
                            <label for="nif" class="control-label"><fmt:message key="label.nif"/></label>
                            <form:input path="nif" maxlength="9" size="8" class="form-control input-sm" />
                        </div>
                    </div>
                    <div class="col-md-6">					  			
                        <div class="form-group form-group-sm">
                            <label for="nombre" class="control-label"><fmt:message key="label.nombre"/></label>
                            <form:input path="nombre" maxlength="50" size="50" class="form-control input-sm"/>
                        </div>	
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group form-group-sm">
                            <label for="apellido1" class="control-label"><fmt:message key="label.apellido1"/></label>
                            <form:input path="apellido1" maxlength="50" size="50" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group form-group-sm">
                            <label for="apellido2" class="control-label"><fmt:message key="label.apellido2"/></label>
                            <form:input path="apellido2" maxlength="50" size="50" class="form-control input-sm"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group form-group-sm">
                            <label for="rol" class="control-label"><fmt:message key="label.rol"/></label>
                            <form:select path="rol" class="form-control input-sm">
                                <form:option value="" label="${maskSelect}"/>
                                <form:options items="${roles}" itemValue="idRol" itemLabel="rol"/>
                            </form:select>
                        </div>	
                    </div>
                </div>      
            </form:form>
        </div>
    </div>
</div>
<c:if test="${usuarioList != null}">
    <div class="panel panel-info">
        <div class="panel-heading">
            <a data-toggle="collapse" href="#collapseSearchResult"></a>
            <fmt:message key="panel.header.result"/>
        </div>
        <div id="collapseSearchResult" class="panel-collapse collapse in">
            <div class="panel-body">
                <c:if test="${not empty usuarioList}">
                    <table class="table table-bordered table-striped table-hover table-condensed table-app">
                        <thead class="bg-primary">
                            <tr>
                                <th width="60px"><fmt:message key="table.head.label.nif"/></th>
                                <th><fmt:message key="table.head.label.nombre"/></th>
                                <th><fmt:message key="table.head.label.apellido1"/></th>
                                <th><fmt:message key="table.head.label.apellido2"/></th>
                                <th width="100px"><fmt:message key="table.head.label.rol"/></th>
                                <th width="90px"><fmt:message key="table.head.label.fechaAlta"/></th>
                                <th width="90px">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${usuarioList}" var="usuario" varStatus="status">
                                <tr>
                                    <td><c:out value="${usuario.nif}"/></td>   	
                                    <td><c:out value="${usuario.nombre}"/></td>
                                    <td><c:out value="${usuario.apellido1}"/></td>
                                    <td><c:out value="${usuario.apellido2}"/></td>
                                    <td><c:out value="${usuario.rol.rol}"/></td>
                                    <td><fmt:formatDate value="${usuario.fechaAlta}" pattern="${patternDate}"/></td>
                                    <td class="text-center">
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-xs btn-default" href="${ctxAdministracion}/usuarioEdit.htm?idUsuario=${usuario.idUsuario}" title="<fmt:message key='icon.usuario.edit.title'/>"><span class="glyphicon glyphicon-edit"/></a>
                                            <a class="btn btn-xs btn-default" data-toggle="modal" data-backdrop="static" href="#confirmDelete" data-href="${ctxAdministracion}/usuarioDelete.htm?idUsuario=${usuario.idUsuario}" title="<fmt:message key='icon.usuario.delete.title'/>"><span class="glyphicon glyphicon-trash"/></a>
                                            <a class="btn btn-xs btn-default" href="${ctxAdministracion}/usuarioView.htm?idUsuario=${usuario.idUsuario}" title="<fmt:message key='icon.usuario.view.title'/>"><span class="glyphicon glyphicon-eye-open"/></a>
                                        </div>	
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty usuarioList}">
                    <div class="alert alert-warning"><fmt:message key="info.message.notfound.usuario"/></div>	   
                </c:if>
            </div>
        </div>		
    </div>
</c:if>
<!-- Modal Confirm Delete -->
<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title" id="modalLabel"><fmt:message key="info.message.remove.usuario.dialog.title"/></h5>
            </div>
            <div class="modal-body">
                <p><fmt:message key="info.message.remove.usuario.dialog.message"/></p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary btn-ok"><fmt:message key="button.si"/></a>
                <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="button.no"/></button>
            </div>
        </div>
    </div>
</div>