/* 구글  */
function checkLoginStatus(){
	var loginBtn = document.querySelector('#loginBtn');
	if(gauth.isSignedIn.get()){
		console.log('logined');
		var google_name = gauth.currentUser.get().getBasicProfile().getName();
		var data = { "google_name": google_name };
		$.ajax({
			url:"googlelogin.do",
			type:'GET',
			data: data,
			success:function(data){
				var gdata = data;
				if(gdata != ""){
					 window.location.reload()
				}
			},
			error:function(){
				alert("구글로그인 실패ㅜㅜ") ;
			}
		}); 
		loginBtn.value = 'Logout';
	} else {
		console.log('logouted');
		loginBtn.value = 'Login';
	}
}


function init() {
	gapi.load('auth2', function() {
	
		window.gauth = gapi.auth2.init({
			client_id:'280265674654-1dvded6q2daokt54rmif098cno7cc0o6.apps.googleusercontent.com'
			})
			
		console.log('client_id')
		
		gauth.then(function(){
			console.log('googleAuth success');
			checkLoginStatus();
		}, function(){
			console.log('googleAuth fail');
		});
	});
}

		/* 페북 */
		var checkFacebookStatus = function(response){
			console.log(response);
		
			if(response.status === 'connected'){
				 FB.api('/me', function(response) {
			          console.log('Successful login for: ' + response.name);
			          var data = { "fb_name": response.name };
			          $.ajax({
			        	  url:"fblogin.do",
			        	  type:'GET',
			        	  data: data,
			        	  success:function(data){
			        		  var adata = data;
			        		  if(adata != ""){
			        			  window.location.reload()
			        		  }
			        	  },
			        	  error:function(){
			        		  alert("페북로그인 실패ㅜㅜ") ;
			        	  }
			          }); 
				 });
				 document.querySelector('#authBtn').value = "Logout";
			} else {
				console.log(response);
				document.querySelector('#authBtn').value = "Login";
			}
		}
		window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '2249209242030240',
		      cookie     : true,  // enable cookies to allow the server to access 
		      xfbml      : true,  // parse social plugins on this page
		      version    : 'v3.2' // use graph api version 2.8
		    });
		    FB.getLoginStatus(checkFacebookStatus);
		  };
		
		// Load the SDK asynchronously
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "https://connect.facebook.net/en_US/sdk.js";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));


function logincheck(){
	FB.login(function(response){
			console.log('login =>', response);
			
			checkFacebookStatus(response);
		});
}


/* 로그아웃 */
function signOut() {
	gauth.signOut().then(function(){
			console.log('gauth.signOut');
			checkLoginStatus();
		});
	
	FB.logout(function(response){
		console.log('logout =>', response);
		
		checkFacebookStatus(response);
		});

}