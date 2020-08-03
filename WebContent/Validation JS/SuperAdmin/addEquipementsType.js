var spotFlag = true;

 var xmlObject;
 function getObject()
 {
     try {
         xmlObject = new XMLHttpRequest();
     }
     catch (err1)
     {
         try {
             xmlObject = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (err2) {
             xmlObject = new ActiveXObject("Msxml2.XMLHTTP");
         }
     }
     return xmlObject;
 }
     
     
     function getEquipementsType()
     {
         xmlObject	 = getObject();
         var loading1 = document.getElementById("loading1");
         loading1.style.display = "block";
         var msg1 = document.getElementById("equipementsTypeloc1");
         var msgs1 = document.getElementById("equipementsTypeloc");
         var equipementsType = document.getElementById("equipementsType").value;
         var url = "getEquipementsType?equipementsType=" + equipementsType;
         xmlObject.onreadystatechange = function ()
         {
             if (xmlObject.readyState == 4 && xmlObject.status == 200)
             {

                 var result = xmlObject.responseText.trim();
                 if (result == "Valid")
                 {
                      loading1.style.display = "none";
                     msg1.style.display = "none";
                     spotFlag = true;
                     addEquipementsType();
                     msgs1.style.display = "block";
                     
                   
                 }
                 else
                 {
                	 spotFlag = false;
                	 addEquipementsType();
                     msg1.style.display = "block";
                     loading1.style.display = "none";
                     msgs1.style.display = "none";
                 }
             }
         };
         xmlObject.open("GET", url, true);
         xmlObject.send(null);
     } 


function addEquipementsType()
     {
        var equipementsType = document.frm.equipementsType.value;
         
         if (equipementsType=="")
         {
             document.getElementById("equipementsType").focus();
             document.getElementById("equipementsTypeloc").innerHTML = "Please enter equipements Type";
             return false;
         }
         else if (!spotFlag)
         {
             document.getElementById("equipementsType").focus();
             document.getElementById("equipementsTypeloc").innerHTML = "";
             document.getElementById("equipementsTypeloc1").innerHTML = "equipements Type already Exists";
             return false;
         }
         else
         {
             document.getElementById("equipementsTypeloc").innerHTML = "";
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