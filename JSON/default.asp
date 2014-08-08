<%
    Response.ContentType = "application/json"
    Response.Write "{""ip"":"""
    Response.Write Request.ServerVariables("REMOTE_ADDR")
    Response.Write """}"
%>