require 'pg'

module Songify
  module Repositories
    class GenresRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'songify-db')
      end

      def save_genre(genre)
        if genre.id.nil?
          command = <<-SQL
          INSERT INTO genres ( type )
          VALUES ('#{genre.type}')
          RETURNING *;
          SQL
          result = @db.exec(command).first
          genre.instance_variable_set("@id", (result["id"]).to_i)
          result
        else
          command = <<-SQL
          UPDATE genres SET ( type ) = ( '#{genre.type}' )
          WHERE id='#{genre.id}';
          SQL
          result = @db.exec(command).first
        end
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