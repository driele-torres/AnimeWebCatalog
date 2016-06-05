      var XMLHttpRequestObject = false;

      if (window.XMLHttpRequest) {
        XMLHttpRequestObject = new XMLHttpRequest();
      } else if (window.ActiveXObject) {
        XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
      }

      function getData(datasource, divID) {
       if (XMLHttpRequestObject) {
         var obj = document.getElementById(divID);
         XMLHttpRequestObject.open("GET", datasource);
         XMLHttpRequestObject.onreadystatechange = function()
         {
            if (XMLHttpRequestObject.readyState == 4
                && XMLHttpRequestObject.status == 200) {
              obj.innerHTML = XMLHttpRequestObject.responseText;
            }
          }
         XMLHttpRequestObject.send(null);
       }
     }
     
     
     
var xmlhttp;                // global XMLHttpRequest obj
var jItem;               // current help item
var jObj = new Object(); // cached help items
var posX;var posY;

// setup tooltip event
function addTooltip(ttObj) {
   aaManageEvent(ttObj,"mouseover",show);
   aaManageEvent(ttObj,"mouseout",hide);
}

// attach tooltip events to objects
aaManageEvent(window,"load",function() {
   var items = document.getElementsById('targetDIV')
   for (var i = 0; i < items.length; i++) {
      addTooltip(items[i]);
   }
   for(j=0; j<34; j++){
   addTooltip(document.getElementById(j));
   }
   
});


