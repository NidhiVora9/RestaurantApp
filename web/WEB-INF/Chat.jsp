<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
<title>My Chat</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript">
var webSocket;
var messages = document.getElementById("messages");
var newConnect = '';
var ip = document.getElementById("serverIP");

window.onload = function () { openSocket();; }

function openSocket()
{

if(webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED)
{
writeResponse("WebSocket is already opened.");
return;
}

var ip = document.getElementById("serverIP").value;
webSocket = new WebSocket("ws://" + ip + ":8080/chat/chatserver");

webSocket.onopen = function(event) {
var user = document.getElementById("thisUser").value;
var image = document.getElementById("img").value;
newConnect = '<li class="media">' +
'<div class="media-body">' +
'<div class="media">' +
'<a class="pull-left" href="#">' +
'<img class="media-object img-circle " style="max-height:40px;" src="assets/img/' + image + '.png" />' +
'</a>' +
'<div class="media-body" >' +
'<h5>' + user + '| User </h5>' +
'<small class="text-muted">' + new Date() + '</small>' +
'</div>' +
'</div>' +
'</div>' +
'</li>';

var users = document.getElementById("connectedusers");
users.innerHTML = users.innerHTML + "<br/><li>" + newConnect + "<li>";
if(event.data === undefined)
return; };
webSocket.onmessage = function(event)
{
// Determine if MSSG or CONN message
var mssg = event.data;
if (mssg.startsWith('MSSG'))
{
mssg = mssg.substring(5); // simple mssg
writeResponse(mssg);
}
else if (mssg.startsWith('CONN'))
{
mssg = mssg.substring(5); // new connection
var users = document.getElementById("connectedusers");
users.innerHTML = users.innerHTML + "<br/><li>" + mssg + "<li>";
}};
Part IX - Java Web Applications - 2016
The JSP Chat Page (with Websockets)
webSocket.onclose = function(event)
{
writeResponse("Connection closed");
alert("Connection closed");
};
} // openSocket
function send()
{
var text = document.getElementById("mytext").value;
var user = document.getElementById("thisUser").value;
var image = document.getElementById("img").value;
if (text =="")
{
alert("no message!");
return;
}
var fullmssg = 'MSSG:<li class="media">' +
'<div class="media-body">'+
'<div class="media">' +
'<a class="pull-left" href="#">' +
'<img class="media-object img-circle " src="assets/img/' +
image + '.png" />' +
'</a>' +
'<div class="media-body" >' +
text +
'<br />' +
'<small class="text-muted">' +
user +
' | ' + new Date() + '</small>' +
'<hr />' + '</div>' + '</div>' + '</div>' +
'</li>';
// send to all others via the Server Endpoint
webSocket.send(fullmssg);
// send mssg to yourself
writeResponse(fullmssg.substring(5)); }

function closeSocket()
{
webSocket.close();
}
function writeResponse(theMessage)
{
var mssg = document.getElementById("messages");
var text = theMessage;
mssg.innerHTML = "<br/><li>" + text + "<li>" + mssg.innerHTML;
document.getElementById("mytext").value = "";
}
</script>

</head>
<body style="font-family: Verdana">
	<input type="hidden" id="thisUser" value="${param.user}">
	<input type="hidden" id="img" value="${param.img}">
	<input type="hidden" id="serverIP" value="${param.ip}">
	<div class="container">
		<div class="row " style="padding-top: 40px;">
			<h3 class="text-center">My Chat: ${param.user}</h3>
			<br /> <br />
			<div class="col-md-8">
				<div class="panel panel-info">
					<div class="panel-heading">RECENT CHAT HISTORY</div>
					<div class="panel-body">
						<ul id="messages" class="media-list">
							<li class="media">
								<div class="media-body">
									<div class="media">
										<a class="pull-left" href="#"> <img
											class="media-object img-circle "
											src="assets/img/${param.img}.png" />
										</a>
										<div class="media-body">
											Online <br /> <small class="text-muted">
												${param.user} | <%=new java.util.Date()%></small>
											<hr />
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="mytext" type="text" class="form-control"
								placeholder="Enter Message" /> <span class="input-group-btn">
								<button class="btn btn-info" type="button" onClick="send()">SEND</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-primary">
					<div class="panel-heading">ONLINE USERS</div>
					<div class="panel-body">
						<ul id="connectedusers" class="media-list">
							<!-- new users go here -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>