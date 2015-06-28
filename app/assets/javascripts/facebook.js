
window.fbAsyncInit = function() {
  FB.init({
    appId      : '797808610327082',
    xfbml      : true,
    // cookie     : true, // enable cookies to allow the server to access the session
    version    : 'v2.3'
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  // FB.getLoginStatus(function(response) {
  //   statusChangeCallback(response);
  // });
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));



$(document).ready(function() {
    console.log("ypoooo");
    var provider = $('.input-provider').val();
    if (provider === "facebook") {
      hideInput();
    }
    // if $('.input-provider').val() == "facebook" {
    //   hideInput();
    // }

    $('.fb_btn_signup').on("click", function() {
      console.log("click facebook button");
      FB.login(function(response) {
        console.log(response);

        if (response.status === 'connected') {
          getCurrentUserInfo(response);
          // Logged into your app and Facebook.
        } else if (response.status === 'not_authorized') {

          // The person is logged into Facebook, but not your app.
        } else {
          // The person is not logged into Facebook, so we're not sure if
          // they are logged into this app or not.
        }
      }, {scope: 'public_profile,email'});;
    });
});

function getCurrentUserInfo(response) {
  FB.api('/me', function(userInfo) {
    console.log(userInfo.name + ': ' + userInfo.email +  " "+ response.authResponse.userID);
    
    setupUI(userInfo.email, userInfo.name, response.authResponse.userID);
  });
}

function setupUI(email, name, uid) {
  $('.check-icon').addClass("green");
  $('.form-grup-email').addClass("hidden");
  $('.form-grup-password').addClass("hidden");
  $('.form-grup-fbnickname').addClass("hidden");

  $('.fb_success_message').html("已綁定Facebook，請填完以下表單並送出，完成註冊。");

  $('.input-email').val(email);
  $('.input-fbnickname').val(name);
  $('.input-uid').val(uid);
  $('.input-provider').val('facebook');
  
}

function hideInput() {
  console.log("hideInput");
  $('.check-icon').addClass("green");
  $('.form-grup-email').addClass("hidden");
  $('.form-grup-password').addClass("hidden");
  $('.form-grup-fbnickname').addClass("hidden");

  $('.fb_success_message').html("已綁定Facebook，請填完以下表單並送出，完成註冊。");
}


// This is called with the results from from FB.getLoginStatus().
// function statusChangeCallback(response) {
//   console.log('statusChangeCallback');
//   console.log(response);
//   // The response object is returned with a status field that lets the
//   // app know the current login status of the person.
//   // Full docs on the response object can be found in the documentation
//   // for FB.getLoginStatus().
//   if (response.status === 'connected') {
//     // Logged into your app and Facebook.
//     testAPI();
//   } else if (response.status === 'not_authorized') {
//     // The person is logged into Facebook, but not your app.
//     document.getElementById('status').innerHTML = 'Please log ' +
//       'into this app.';
//   } else {
//     // The person is not logged into Facebook, so we're not sure if
//     // they are logged into this app or not.
//     document.getElementById('status').innerHTML = 'Please log ' +
//       'into Facebook.';
//   }
// }


// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
// function checkLoginState() {
//   FB.getLoginStatus(function(response) {
//     statusChangeCallback(response);
//   });
// }


// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
// function testAPI() {
//   console.log('Welcome!  Fetching your information.... ');
//   FB.api('/me', function(response) {
//     console.log('Successful login for: ' + response.name);
//     document.getElementById('status').innerHTML =
//       'Thanks for logging in, ' + response.name + '!';
//   });
// }