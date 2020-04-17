<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IconoAlerta._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
         <ul class="nav navbar-nav">
         <li class="active"><a href="#">Tijuana</a></li>
            <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown">Site Select<span class="caret"></span></a>
      <ul class="dropdown-menu" id="projectSelectorDropdown">
      </ul>
    </li>         
  </ul>
        

    </div>
    
    <script>
        var j = 1;
        $(document).ready(function (e) {
            $("#lista").click(function () {
                $("#notificationContainer").fadeToggle(300);
                $("#notification_count").fadeOut("slow");
                return false;
            });

            //Document Click hiding the popup 
            $(document).click(function () {
                $("#notificationContainer").hide();
            });

            //Popup on click
            $("#notificationContainer").click(function () {
                return false;
            });
    
            var obj;
            obj = <%=Alertajs%>;
            
            
            for (var i = 0; i < Object.keys(obj).length; i++) {


                $("#notificationsBody").append('<div class="alert alert-light alert-dismissible fade show role="alert" id="divurl" <a href="' + obj[i].urll + '"></a> <span class="glyphicon glyphicon-bell" style="color:red"></span>' + obj[i].notificacion + '</a><button type="button" id="' + i + '" class="close" data-dismiss="alert" aria-label="Close" value="' + obj[i].notificacion + '"><span aria-hidden="true">&times;</span ></button></div>');
                
                $(".alert").alert();
                
            }
            $("button").click(function (event) {

                $(this).alert('close');
                var atributo = $(this).attr("value");
                CambiarEstadoI(atributo);
            });
            function CambiarEstadoI(notificacion) {
                
                $.ajax({
                    type: "POST",
                    url: "Cambiar.asmx/CambiarEstado2020",
                    contentType: "application/json; charset=utf-8",
                    data: '{"notificacion":"' + notificacion + '"}',
                    dataType: "json",
                    success: function (response) {
                        
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                    }
                });
            }

           
            $(".alert").dblclick(function (event) {

                var link = $(this).attr('href');
                $(location).attr('href', link);
               

            });

            $.notify({
                // options
                icon: 'glyphicon glyphicon-warning-sign',
                message: 'Tienes ' + Object.keys(obj).length+' notificaciones nuevas'
            }, {
                // settings
                type: 'success'
            });
        });

        
       
        window.onload = function () {
            
        }
        

    </script>
    
    
</asp:Content>
