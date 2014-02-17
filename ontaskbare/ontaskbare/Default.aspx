<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnTaskBare.Default" %>

<%@ Register src="LoginControl.ascx" tagname="LoginControl" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.3.0/forms-min.css"/>   
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.3.0/forms-nr-min.css"/> 
<link href="css/main-grid.css" rel="stylesheet" />
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round"/>
<link href="css/font-awesome.min.css" rel="stylesheet" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
<link href="css/table.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/main.css" rel="stylesheet" />
<title>OnTask Business Solutions</title>

    <style type="text/css">.button { }
        .auto-style1 {
            width: 164px;
            height: 83px;
        }
        </style>
</head>
    <body class="body">
   
         
   <br/>
     <div id="login">
     <h2><i class="fa fa-home"></i>Sign In</h2>
        <fieldset>
            <form id="form1" runat="server" class="pure-form pure-button-primary">
        <uc1:LoginControl ID="LoginControl1" runat="server"/>

        </form> 
   <div align="center"><a href="http://ontaskbusinesssolutions.com/"><img src="Image/Untitled-1.png" class="auto-style1" /> </a></div>      
        </fieldset>
</div>
</body>
    
</html>
