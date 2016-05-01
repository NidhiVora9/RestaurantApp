function signOut() {
	console.log('Signout called');
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/Restaurant-app/signout',true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	 var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	     console.log('User signed out.');
	    });
	xhr.send();
	location.reload();
  }

function onSignIn(googleUser) {
  var id_token = googleUser.getAuthResponse().id_token;
  
  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/Restaurant-app/tokensignin',true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhr.onload = function() {
	  var res = xhr.responseText;
	  console.log('Signed in as: ' + res);
  };
  xhr.send('idtoken=' + id_token);
}

