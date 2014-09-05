require 'pg'

module PuppyBreeder
  module Repositories
    class PurchaseRequestRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
      end

      def add_purchase_request(breed, customer)
        breed_id = PuppyBreeder.breeds_repo.get_breed_id(breed) 
        sql = "INSERT INTO purchase_request( breed_id, customer_id, status )
          VALUES ( '#{breed_id}', '#{customer.id}', 'pending' ) RETURNING *"
        result = @db.exec(sql)
      end

      #def unavailable
      #if puppies table is updated with a puppy with status unavailable, change to pending




      def deny_request(breed, customer)
        breed_id = PuppyBreeder.breeds_repo.get_breed_id(breed)
        sql = "UPDATE purchase_request SET ( status ) = ( 'denied' ) WHERE breed_id='#{breed_id}' AND customer_id='#{customer.id}' RETURNING *"
        result = @db.exec(sql)
      end

      def complete_request(breed, customer)
        breed_id = PuppyBreeder.breeds_repo.get_breed_id(breed)
        sql = "UPDATE purchase_request SET ( status ) = ( 'completed' ) WHERE breed_id='#{breed_id}' AND customer_id='#{customer.id}' RETURNING *"
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
        sql = "CREATE TABLE purchase_request( id SERIAL, breed_id INTEGER REFERENCES breeds ( id ), customer_id INTEGER REFERENCES customer ( id ), status TEXT, PRIMARY KEY( id ) )"
        result = @db.exec(sql)
      end

    end
  end
end