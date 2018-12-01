<%@ Page Title="Главная страница" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VKR._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Виды схем термостабилизации</h1>
    <div class="row" style="text-align: center">
        <div class="col-md-3">
            <a href="BaseBiasForm.aspx"><img src="Resources/BaseBiasPrev.png" /></a>
            <br />
            <a href="BaseBiasForm.aspx" style="color: #000000">Схема базовой стабилизации</a>
        </div>
        <div class="col-md-3">
            <a href="VoltageFeedbackBiasForm.aspx"><img src="Resources/VFBPrev.png" /></a>
            <br />
            <a href="VoltageFeedbackBiasForm.aspx">Схема коллекторной стабилизации</a>
        </div>
        <div class="col-md-3">
            <a href="VoltageFeedbackCurrentSourceForm.aspx"><img src="Resources/VFBISourcePrev.png" /></a>
            <br />
            <a href="VoltageFeedbackCurrentSourceForm.aspx">Комбинированная схема смещения</a>
        </div>
        <div class="col-md-3">
            <a href="VoltageFeedbackVoltageSourceForm.aspx"><img src="Resources/VFBVSourcePrev.png" /></a>
            <br />
            <a href="VoltageFeedbackVoltageSourceForm.aspx">Схема с фиксированным напряжением база-эмиттер</a>
        </div>
        <div class="col-md-3">
            <a href="EmitterFeedbackForm.aspx"><img src="Resources/EmitterFBPrev.png" /></a>
            <br />
            <a href="EmitterFeedbackForm.aspx">Схема эмиттерной стабилизации</a>
        </div>
    </div>
</asp:Content>
