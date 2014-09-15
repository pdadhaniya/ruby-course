require 'pg'

module Songify
  module Repositories
    class SongsArtistsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end

      def update_songs_artists(song, artists)
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS songs_artists (id SERIAL PRIMARY KEY, song_id INTEGER REFERENCES songs ( id ), artist_id INTEGER REFERENCES artists ( id ));
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE songs_artists CASCADE
        SQL
        result = @db.exec(command)
      end


    end
  end
end