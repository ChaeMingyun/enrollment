// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .
if(!window.jQuery)
{
   var script = document.createElement('script');
   script.type = "text/javascript";
   script.src = "https://code.jquery.com/jquery-1.12.4.min.js";

   document.getElementsByTagName('head')[0].appendChild(script);
setTimeout(function(){
  var script2 = document.createElement('script');
  script2.type = "text/javascript";
  script2.src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-ujs/1.2.2/rails.min.js";

  document.getElementsByTagName('head')[0].appendChild(script2);
},1000)
}
else if(!$.rails)
{
   var script = document.createElement('script');
   script.type = "text/javascript";
   script.src = "https://cdnjs.cloudflare.com/ajax/libs/jquery-ujs/1.2.2/rails.min.js";

   document.getElementsByTagName('head')[0].appendChild(script);
}
