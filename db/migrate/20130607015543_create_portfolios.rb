class CreatePortfolios < ActiveRecord::Migration
 def change                                 # decided to use "change" instead of "up"/"down" methods.
     create_table :portfolios do |t|
     t.string :name
     t.integer :client_id
   end
 end
end
