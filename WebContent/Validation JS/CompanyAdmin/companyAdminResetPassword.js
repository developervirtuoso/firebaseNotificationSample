     function companyAdminResetPass()
     {
         var old1password = document.getElementById("old1password").value;
         var old2password = document.getElementById("old2password").value;
         var newpassword = document.getElementById("newpassword").value;
         var confirmnewpassword = document.getElementById("confirmnewpassword").value;
         
        
         
         if (old2password == '' || old2password == null)
         {
             document.getElementById("old2password").focus();
             document.getElementById("old2passwordloc").innerHTML = "Please Enter Password";
             return false;
         }
         else if (old1password != old2password)
         {
             document.getElementById("old2password").focus();
             document.getElementById("old2passwordloc").innerHTML = "Please Enter Valid Password";
             return false;
         }
         else
         {
             document.getElementById("old2passwordloc").innerHTML = "";
         }
         
        if (newpassword == '')
         {
             document.getElementById("newpassword").focus();
             document.getElementById("newpasswordloc").innerHTML = "Please Enter Password ";
             return false;
         }
         else
         {
             document.getElementById("newpasswordloc").innerHTML = "";
         }
        
        if (confirmnewpassword == '' || confirmnewpassword == null)
        {
            document.getElementById("confirmnewpassword").focus();
            document.getElementById("confirmnewpasswordloc").innerHTML = "Please Enter Password";
            return false;
        }
        else if (confirmnewpassword != newpassword)
        {
            document.getElementById("confirmnewpassword").focus();
            document.getElementById("newpasswordloc").innerHTML = "Password does't match";
            return false;
        }
        else
        {
            document.getElementById("confirmnewpasswordloc").innerHTML = "";
        }
         
         
         return true;

     }
