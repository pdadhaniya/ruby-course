require 'pg'

module Songify
  module Repositories
    class ArtistsRepo
      attr_reader :all_artists

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end

      def save_artist(artist)
        if artist.id.nil?
          command = <<-SQL
          INSERT INTO artists ( name )
          VALUES ( '#{artist.name}')
          RETURNING *;
          SQL
          result = @db.exec(command).first
          artist.instance_variable_set("@id", (result["id"]).to_i)
          result
        else
          command = <<-SQL
          UPDATE artists SET ( name ) = ( '#{artist.name}')
          WHERE id='#{artist.id.to_i}'
          RETURNING *; 
          SQL
          result = @db.exec(command).first
        end
      end

      def delete_artist(artist)
        command = <<-SQL
        DELETE FROM artists WHERE id='#{artist.id}';
        SQL
        result = @db.exec(command)
      end

      def get_artist_id(name)
        command = <<-SQL
        SELECT * FROM artists WHERE name='#{name}'
        SQL
        result = @db.exec(command).first
        x = result["id"].to_i
      end

      def get_artist(id)
        command = <<-SQL
        SELECT * FROM artists WHERE id='#{id}';
        SQL
        result = @db.exec(command).first
      end

      def get_all_artists
        command = <<-SQL
        SELECT * FROM artists;
        SQL
        result = @db.exec(command).entries
        @all_artists = []
        result.each do |artist_hash|
          @all_artists << artist_hash["name"]
        end
        result
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS artists (id SERIAL PRIMARY KEY, name TEXT);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE artists CASCADE;
        SQL
        result = @db.exec(command)
      end

    end
  end
end