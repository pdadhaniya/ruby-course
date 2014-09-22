require 'pg'

module Songify
  module Repositories
    class SongsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end

      def save_song(song)
        if song.id.nil?
          genre_id = Songify::genres_repo.get_genre_id(song.genre)
          @songs_artists_all = song.artist
          command = <<-SQL
          INSERT INTO songs ( title, genre )
          VALUES ( '#{song.title}', '#{genre_id}' )
          RETURNING *;
          SQL
          result = @db.exec(command).first
          song.instance_variable_set("@id", (result["id"]).to_i)
          result
        else
          genre_id = Songify::genres_repo.get_genre_id(song.genre)
          @songs_artists_all = song.artist
          command = <<-SQL
          UPDATE songs SET ( title, genre ) = ( '#{song.title}', '#{genre_id}' )
          WHERE id='#{song.id.to_i}'; 
          SQL
          result = @db.exec(command).first
        end

        @songs_artists_all.map! do |artist|
          Songify.artists_repo.get_artist_id(artist)
        end

        @songs_artists_all.each do |artist_id|
          Songify.songs_artists_repo.update_songs_artists(song, artist_id)
        end

        return result
      end

      def delete_song(song)
        command = <<-SQL
        DELETE FROM songs WHERE id='#{song.id}';
        SQL
        result = @db.exec(command)
      end

      def get_song(id)
        command = <<-SQL
        SELECT * FROM songs WHERE id='#{id}';
        SQL
        result = @db.exec(command).first
      end

      def get_song_id(title)
        command = <<-SQL
        SELECT * FROM songs WHERE title='#{title}'
        SQL
        result = @db.exec(command).first
        x = result["id"].to_i
      end

      def get_all_songs
        command = <<-SQL
        SELECT * FROM songs
        SQL
        result = @db.exec(command).entries
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS songs (id SERIAL PRIMARY KEY, title TEXT, genre INTEGER REFERENCES genres (id));
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE songs CASCADE;
        SQL
        result = @db.exec(command)
      end

    end
  end
end