getQuote();

$(document).ready(function() {
  $("#getMessage").on("click", function(){
    getQuote();
    });
});

function getQuote() {
  $.getJSON("https://api.forismatic.com/api/1.0/?method=getQuote&format=jsonp&lang=en&jsonp=?", function(data) {
  $('#quote').html(data.quoteText);
  $('#author').html(data.quoteAuthor);
  $('#tweetQuote').attr('href', 'https://twitter.com/intent/tweet?text=' + data.quoteText + '- ' + data.quoteAuthor).attr('target','_blank');
  })
}