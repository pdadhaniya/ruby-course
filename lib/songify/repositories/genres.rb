require 'pg'

module Songify
  module Repositories
    class GenresRepo
      attr_reader :all_genres

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
          WHERE id='#{genre.id}'
          RETURNING *;
          SQL
          result = @db.exec(command).first
        end
      end

      def get_genre_id(type)
        command = <<-SQL
        SELECT * FROM genres WHERE type='#{type}'
        SQL
        result = @db.exec(command).first
        x = result["id"].to_i
      end      

      def delete_genre(genre)
        command = <<-SQL
        DELETE FROM genres WHERE  id='#{genre.id}';
        SQL
        result = @db.exec(command)
      end

      def get_genre(id)
        command = <<-SQL
        SELECT * FROM genres WHERE id='#{id}';
        SQL
        result = @db.exec(command).first
      end

      def get_all_genres
        command = <<-SQL
        SELECT * FROM genres;
        SQL
        result = @db.exec(command).entries
        @all_genres = []
        result.each do |genre_hash|
          @all_genres << genre_hash["type"]
        end
        result
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS genres (id SERIAL PRIMARY KEY, type TEXT);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE genres CASCADE;
        SQL
        result = @db.exec(command)
      end




    end
  end
end