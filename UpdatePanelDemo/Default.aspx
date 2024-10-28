<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ScriptManager -->
    <%-- It is already defined in Site.master file --%>
    <%-- <asp:ScriptManager ID="ScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager> --%>

    <!-- ZADANIE 1: UpdatePanel, UpdateMode="Conditional" -->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server" Text="Aktualny czas: "></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Aktualizuj czas" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Aktualizacja obu paneli" OnClick="Button2_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- ZADANIE 2: Second UpdatePanel with Label2, ForeColor set to Red, and Trigger for Button2 -->
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="Label2" runat="server" Text="Aktualizacja obu paneli: " ForeColor="Red"></asp:Label>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <!-- ZADANIE 3: Third UpdatePanel -->
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:DropDownList 
                ID="DropDownList1" 
                runat="server" 
                DataTextField="CategoryName" 
                DataValueField="CategoryID"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" 
                AutoPostBack="True">
            </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="Wybierz kategorię, aby zobaczyć opis."></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>

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
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
