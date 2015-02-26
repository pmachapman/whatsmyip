<%
	' Declare Variables
	Dim sIpAddress

	' Get the IP address depending on whether we are behind a proxy, or not
	If Request.ServerVariables("HTTP_X_FORWARDED_FOR") <> "" Then
		' We are behind a proxy, so get the forwarded IP address
		sIpAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
		' If there are multiple IP addresses, get just the first one
		sIpAddress = Split(sIpAddress, ",")(0)
		' If a port was included, strip that off the end
		sIpAddress = Split(sIpAddress, ":")(0)
	ElseIf Request.ServerVariables("REMOTE_ADDR") <> "" Then
		' Get the remote IP address
		sIpAddress = Request.ServerVariables("REMOTE_ADDR")
	Else
		' We have no idea what the IP address is
		sIpAddress = "Unknown"
	End If

	' Return the IP address
    Response.ContentType = "application/json"
    Response.Write "{""ip"":"""
    Response.Write sIpAddress
    Response.Write """}"
%>