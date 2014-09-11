require 'pg'

module Songify
  module Repositories
    class GenresRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end





      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS genres (id SERIAL PRIMARY KEY, type TEXT);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE genres;
        SQL
        result = @db.exec(command)
      end




    end
  end
end