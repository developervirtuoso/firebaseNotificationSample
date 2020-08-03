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
     
     
     function getEquipementsBrand()
     {
    	 
    	 
         xmlObject	 = getObject();
         var loading1 = document.getElementById("loading1");
         loading1.style.display = "block";
         var msg1 = document.getElementById("equipementsBrandloc1");
         var msgs1 = document.getElementById("equipementsBrandloc");
         var equipementsType = document.getElementById("equipementType").value;
         var equipementsBrand = document.getElementById("equipementsBrand").value;
         var url = "getEquipementsBrand?equipementsType=" + equipementsType + "&equipementsBrand="+equipementsBrand;
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
                     addEquipementsBrand();
                     msgs1.style.display = "block";
                     
                   
                 }
                 else
                 {
                	 spotFlag = false;
                	 addEquipementsBrand();
                     msg1.style.display = "block";
                     loading1.style.display = "none";
                     msgs1.style.display = "none";
                 }
             }
         };
         xmlObject.open("GET", url, true);
         xmlObject.send(null);
     } 


function addEquipementsBrand()
     {
	
	
        var equipementType = document.frm.equipementType.value;
        var equipementsBrand = document.frm.equipementsBrand.value;
        
         if (equipementType=="empty")
         {
             document.getElementById("equipementType").focus();
             document.getElementById("equipementTypeloc").innerHTML = "Please select equipements Type";
             return false;
         }
         else
         {
             document.getElementById("equipementTypeloc").innerHTML = "";
         }
         
         
         if (equipementsBrand=="")
         {
             document.getElementById("equipementsBrand").focus();
             document.getElementById("equipementsBrandloc").innerHTML = "Please enter equipements brand";
             return false;
         }
         else if (!spotFlag)
         {
             document.getElementById("equipementsBrand").focus();
             document.getElementById("equipementsBrandloc").innerHTML = "";
             document.getElementById("equipementsBrandloc1").innerHTML = "equipements brand already Exists";
             return false;
         }
         else
         {
             document.getElementById("equipementsBrandloc").innerHTML = "";
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