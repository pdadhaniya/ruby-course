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
          # song.instance_variable_set("@id", (result[0]["id"]).to_i)
        end
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