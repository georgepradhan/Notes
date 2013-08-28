$(document).ready(function() {

  $('#create_new').on('click', function(e){
    e.preventDefault();
    $.ajax({
      type: 'get',
      url: '/new'
    }).done(function(server_response){
      $('.container').append(server_response)
    }).fail(function(){
      console.log('#create_new click fail');
    });
  });

  $('.container').on('submit', '#new', function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/",
      data: $("#new").serialize()
    }).done(function(server_response){
      $('#notes').append("<li><a href='/" + server_response.id + "'>" + server_response.title + "</a></li>");
      $('#partial_new').remove()
    }).fail(function(){
      console.log('fail');
    });
  });

  $('#notes').on('click', 'a', function(e){
    e.preventDefault();
    var url = {href: this["href"]};
    $.ajax({
      type: "get",
      url: url.href
    }).done(function(server_response){
      $('.view_note').remove();
      $('.container').append(server_response)
    }).fail(function(){
      console.log('view note click fail');
    });
  });

  $(document).on('click', '.view_note a', function(e){
    e.preventDefault();
    var url = {href: this["href"]};
    $.ajax({
      type: "get",
      url: url.href
    }).done(function(server_response){
      $('.view_note').remove();
      $('.container').append(server_response)
    }).fail(function(){
      console.log('view note click fail');
    });
  });

});
