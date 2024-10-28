<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ScriptManager -->
    <%-- It is already defined in Site.master file --%>
    <%-- <asp:ScriptManager ID="ScriptManager" runat="server" EnablePartialRendering="true"></asp:ScriptManager> --%>
         <form id="form1" runat="server">

             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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

    <%-- Zadanie 4: ValidatorCalloutExtender --%>
     <asp:TextBox ID="tbF" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="tbF" ErrorMessage="Pole nie może pozostać pusta!" 
            ValidationGroup="vg1" Display="Dynamic"></asp:RequiredFieldValidator>
        <ajaxToolkit:ValidatorCalloutExtender ID="vcalUserId" runat="server" 
            TargetControlID="RequiredFieldValidator1"></ajaxToolkit:ValidatorCalloutExtender>
        <asp:Button ID="Button3" runat="server" Text="Button" ValidationGroup="vg1"/>

    <%--FilteredTextBoxExtender--%>
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBox1" FilterType="Numbers" ></ajaxToolkit:FilteredTextBoxExtender>
    </div>

    <%-- PasswordStrength --%>
     <div>
        <asp:TextBox ID="Password" runat="server" />
        <ajaxToolkit:PasswordStrength ID="ps1" runat="server" 
            TargetControlID="Password" RequiresUpperAndLowerCaseCharacters="true" 
            MinimumNumericCharacters="1" MinimumSymbolCharacters="1" 
            PreferredPasswordLength="8" DisplayPosition="RightSide" 
            StrengthIndicatorType="Text" />
     </div>


    <%-- PopupControlExtender --%>
      <div>
        Wyjazd: <asp:TextBox ID="tbDeparture" runat="server" />
        Przyjazd: <asp:TextBox ID="tbReturn" runat="server" />
    </div>
    <asp:Panel ID="pnlCalendar" runat="server">
      <asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>
          <asp:Calendar ID="c1" runat="server" />
        </ContentTemplate>
      </asp:UpdatePanel>
    </asp:Panel>

    <ajaxToolkit:PopupControlExtender ID="pce1" runat="server"
      TargetControlID="tbDeparture" PopupControlID="pnlCalendar" Position="Bottom" />
    <ajaxToolkit:PopupControlExtender ID="pce2" runat="server"
      TargetControlID="tbReturn" PopupControlID="pnlCalendar" Position="Bottom" />



    <div>
      <asp:TextBox ID="Name" runat="server" />
      <asp:RequiredFieldValidator ID="rfv1" ControlToValidate="Name" Text="*" InitialValue="&lt;Twoje ImiÄ™&gt;" Display="Dynamic" runat="server" />
      <asp:RequiredFieldValidator ID="rfv2" ControlToValidate="Name" Text="*" Display="Dynamic" runat="server" />
      <br /><asp:Button ID="btn" runat="server" Text="Submit" OnClick="btn_Click" /><br />
      <asp:Label ID="lbl" runat="server" />
    </div>
    <ajaxToolkit:TextBoxWatermarkExtender ID="tbwe" runat="server" TargetControlID="Name" WatermarkText="&lt;Your Name&gt;" />

    </form>

</asp:Content>
