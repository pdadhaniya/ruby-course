require 'pg'

module PuppyBreeder
  module Repositories
    class PurchaseRequestRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'puppy-breeder-db')
      end

      def add_purchase_request(puppy, customer)
        if puppy.id.nil? #change status to unavailable
          false
        else 
          sql = "INSERT INTO purchase_request( puppy, customer, status )
            VALUES ( '#{puppy.id}', '#{customer.id}', 'pending' ) RETURNING *"
          result = @db.exec(sql)
        end
      end

      #def unavailable
      #if puppies table is updated with a puppy with status unavailable, change to pending

      def deny_request(puppy, customer)
        sql = "UPDATE purchase_request SET ( status ) = ( 'denied' ) WHERE puppy='#{puppy.id}' AND customer='#{customer.id}' RETURNING *"
        result = @db.exec(sql)
      end

      def complete_request(puppy, customer)
        sql = "UPDATE purchase_request SET ( status ) = ( 'completed' ) WHERE puppy='#{puppy.id}' AND customer='#{customer.id}' RETURNING *"
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
        sql = "CREATE TABLE purchase_request( id SERIAL, puppy INTEGER REFERENCES puppies ( id ), customer INTEGER REFERENCES customer ( id ), status TEXT, PRIMARY KEY( id ) )"
        result = @db.exec(sql)
      end

    end
  end
end