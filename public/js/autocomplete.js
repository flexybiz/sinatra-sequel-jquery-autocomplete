$(function() {
  $( "input#search" ).autocomplete({
    source: function( request, response ) {
      $.ajax({
        type: "POST",
        url: "/autocomplete",
        data: "search=" + $("input#search").val(),
        success: function( data ) {
          var parsed = JSON.parse(data);
          response( parsed );
        }
      });
    },
    minLength: 1,
    select: function( event, ui ) {
      $("#message").text( ui.item ?
        "Selected: " + ui.item.label :
        "Nothing selected, input was " + this.value);
    },
    open: function() {
      $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
    },
    close: function() {
      $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
    }
  });
})