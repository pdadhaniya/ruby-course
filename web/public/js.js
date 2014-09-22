var $artiste = $('.artiste');

var addArtist = function() {
  $artiste.append("<div class='artistfield'><label for='artist'>Artist:</label><input name='artist-name[]' id='artist' type='text'></div<br>");
}

var removeArtist = function() {
  $('.artiste .artistfield:last-child').remove();
}

$(document).on('click', '.add', function(){
  addArtist();
});

$(document).on('click', '.subtract', function(){
  removeArtist();
});