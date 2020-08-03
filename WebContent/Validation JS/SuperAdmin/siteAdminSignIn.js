 var emailFlag = true;

 var numberFlag = true;
 
     
     function siteAdminSignIn()
     {
    	 
         var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;
         var email = document.frm.email.value;
         var password =document.frm.password.value;
         
         if (email == '' || email == null)
         {
             document.getElementById("email").focus();
             document.getElementById("emailloc").innerHTML = "Please Enter Email";
             return false;
         }
         else if (!emailRegex.test(email))
         {
             document.getElementById("email").focus();
             document.getElementById("emailloc").innerHTML = "Please Enter Valid Email";
             return false;
         }
         else
         {
             document.getElementById("emailloc").innerHTML = "";
         }
         
        if (password == '')
         {
             document.getElementById("password").focus();
             document.getElementById("passwordloc").innerHTML = "Please Enter Password ";
             return false;
         }
         else if (password.length < 5)
         {
             document.getElementById("password").focus();
             document.getElementById("passwordloc").innerHTML = "Password Must Be Of Atleast 5 Characters";
             return false;
         }
         else
         {
             document.getElementById("passwordloc").innerHTML = "";
         }
         
         
         return true;

     }
     
     window.addDashes = function addDashes(f) {
         var r = /(\D+)/g,
                 npa = '',
                 nxx = '',
                 last4 = '';
         f.value = f.value.replace(r, '');
         npa = f.value.substr(0, 3);
         nxx = f.value.substr(3, 3);
         last4 = f.value.substr(6, 4);
         f.value = npa + '-' + nxx + '-' + last4;
     }