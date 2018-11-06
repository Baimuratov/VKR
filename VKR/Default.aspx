<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VKR._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h1>Типы смещений транзисторов</h1>
        <p style="text-align: left>
            <a href="BaseBiasForm.aspx"><img src="Resources/BaseBiasM.png" /></a>
            <a href="BaseBiasForm.aspx" style="color: #000000">Смещение с общей базой</a>
        </p>
        <p style="text-align: left">
            <a><img src="Resources/CollectorFBM.png" /></a>
            <a>Смещение с обратным коллектором</a>
        </p>
        <p style="text-align: left">
            <a><img src="Resources/V-FB I-SourceM.png" /></a>
            <a>Смещение с обратным напряжением с источником тока</a>
        </p>
        <p style="text-align: left">
            <a><img src="Resources/V-FB V-SourceM.png" /></a>
            <a>Смещение с обратным напряжением с источником напряжения</a>
        </p>
        <p style="text-align: left">
            <a><img src="Resources/EmitterFBM.png" /></a>
            <a>Смещение с обратным эмиттером</a>
        </p>
    </div>
    
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
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
