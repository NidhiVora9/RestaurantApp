function signOut() {
	console.log('Signout called');
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/Restaurant-app/signout',true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {
		  var res = xhr.responseText;
		  if(res == "200")
			  location.reload();
	  };
	xhr.send();
	
	var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(
	    		function () {
	     console.log('User signed out.');
	    });
	xhr.send();
  }

function onSignIn(googleUser) {
  var id_token = googleUser.getAuthResponse().id_token;
  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/Restaurant-app/tokensignin',true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhr.onload = function() {
	  var res = xhr.responseText;
	  console.log('Signed in as: ' + res);
	  if(res == "200")
	  {
		  opener.location.reload()
		  window.close();
	  }
  };
  xhr.send('idtoken=' + id_token);

}
function onOrder(id) {
	  
	  var xhr = new XMLHttpRequest();
	  xhr.open('POST', '/Restaurant-app/ordersession',true);
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	  xhr.onload = function() {
		  var res = xhr.responseText;
		  if(res != "-1")
			  console.log('Order' + res + "has been added");
	  };
	  xhr.send('id=' + id);
	}

function order_change(id){
	//alert("order has been changed");
	var xhr = new XMLHttpRequest();
	  xhr.open('POST', '/Restaurant-app/orderchange',true);
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	  xhr.onload = function() {
		  var res = xhr.responseText;
		  if(res == "200")
			  location.reload();
	  };
	  xhr.send('orderid=' + id);
}

function submitOrder(){
	window.location.href="/Restaurant-app/billing.jsp"
}