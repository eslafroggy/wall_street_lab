class CreatePortfoliosStocks < ActiveRecord::Migration
  def change
    create_table :portfolios_stocks, id: false do |t|
      t.integer :portfolio_id
      t.integer :stock_id
    end
    add_index :portfolios_stocks, [:portfolio_id, :stock_id], :unique => true
  end
end
