require 'pg'

module Songify
  module Repositories
    class SongsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end

      def save_song(song)
        if song.id.nil?
          command = <<-SQL
          INSERT INTO songs ( name )
          VALUES ( '#{song.name}' )
          RETURNING *;
          SQL
          result = @db.exec(command).first
          song.instance_variable_set("@id", (result["id"]).to_i)
          result
        end
      end

      def delete_song(song)
        command = <<-SQL
        DELETE FROM songs WHERE id='#{song.id}'
        SQL
        result = @db.exec(command)
      end

      def get_song(song)
        command = <<-SQL
        SELECT * FROM songs WHERE id='#{song.id}'
        SQL
        result = @db.exec(command).first
      end

      

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS songs (id SERIAL PRIMARY KEY, name TEXT)
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE songs
        SQL
        result = @db.exec(command)
      end

    end
  end
end