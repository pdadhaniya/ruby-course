require 'pg'

module Songify
  module Repositories
    class SongsArtistsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end

      def update_songs_artists(song, artists_id)
        command = <<-SQL
        INSERT INTO songs_artists( song_id, artist_id )
        VALUES ( '#{song.id}', '#{artists_id}' )
        RETURNING *;
        SQL
        result = @db.exec(command)
      end

      def view_songs_artists
        command = <<-SQL
        SELECT * FROM songs_artists;
        SQL
        result = @db.exec(command).entries
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS songs_artists (id SERIAL PRIMARY KEY, song_id INTEGER REFERENCES songs ( id ) ON DELETE CASCADE, artist_id INTEGER REFERENCES artists ( id ) ON DELETE CASCADE);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE songs_artists CASCADE;
        SQL
        result = @db.exec(command)
      end


    end
  end
end