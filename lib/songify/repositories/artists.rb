require 'pg'

module Songify
  module Repositories
    class ArtistsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end


      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS artists (id SERIAL PRIMARY KEY, name TEXT);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE artists;
        SQL
        result = @db.exec(command)
      end

    end
  end
end