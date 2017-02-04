$(function() {
  $(".reply").on('click', function() {
    $(this).next().show();
  });
  $(".reply_show").on('click', function() {
    $.ajax ({
      type: 'GET',
      url: '/replys',
      dataType: 'json',
    })
    .done(function(data) {
      $.each(data, function(i, ele) {
        var html = createHTML(ele)
        $(".user_articles__results").append(html[0])
      });
    })
    .fail(function(data) {
      window.alert("エラー");
    });
  });
});
