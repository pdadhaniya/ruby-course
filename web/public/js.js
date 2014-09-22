var $artiste = $('.artiste');

var addArtist = function() {
  $artiste.append("<label for='artist'>Artist:</label><input name='artist-name[]' id='artist' type='text'><br>");
}

$(document).on('click', '.fa', function(){
  addArtist();
});
