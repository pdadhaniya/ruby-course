require 'pg'

module PuppyBreeder
  module Repositories
    class PurchaseRequestRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
      end
        #result = @db.exec(sql).entries returns array of hashes

      def add_purchase_request(breed, customer)
        breed.map! do |a_breed|
          PuppyBreeder.breeds_repo.get_breed_id(a_breed)
        end


        command = <<-SQL
        INSERT INTO purchase_request( customer_id, status )
        VALUES ( '#{customer.id}', 'pending' )
        RETURNING *;
        SQL
        result = @db.exec(command).entries

        breed.each do |x|
          PuppyBreeder.breeds_request_repo.update_breeds_request(result[-1]["id"], x)
        end
        return result

      end



      def deny_request(breed, customer)
        sql = "UPDATE purchase_request SET ( status ) = ( 'denied' ) WHERE customer_id='#{customer.id}' RETURNING *"
        result = @db.exec(sql)
      end

      def complete_request(breed, customer)
        sql = "UPDATE purchase_request SET ( status ) = ( 'completed' ) WHERE customer_id='#{customer.id}' RETURNING *"
        result = @db.exec(sql)
      end

      def view_pending
        sql = "SELECT * FROM purchase_request WHERE status='pending'"
        result = @db.exec(sql)
      end

      def drop_tables
        sql = "DROP TABLE purchase_request"
        result = @db.exec(sql)
        result
      end

      def create_tables
        sql = "CREATE TABLE purchase_request( id SERIAL, customer_id INTEGER REFERENCES customer ( id ), status TEXT, PRIMARY KEY( id ) )"
        result = @db.exec(sql)
      end

    end
  end
end