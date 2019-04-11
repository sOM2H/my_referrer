$( document ).ready(function() {
  $( document.body ).click(function(e) {
    gon.referrer_urls.forEach(function(url) {
      var link = e.target.toString();
      if( link.includes(url.toString())){
        window.open(e.target+"?srv="+gon.referrer);
        event.preventDefault();
      }
    });
  });
});