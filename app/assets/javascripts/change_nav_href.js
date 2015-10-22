$(document).ready(function(){

  $('.navbar-nav').find('a.page-scroll').attr("href", function(i, val) {
    new_href = val.substr(1);
    return new_href;
  });
});
