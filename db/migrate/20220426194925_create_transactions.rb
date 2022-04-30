class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_id
      t.integer :customer_id
      t.decimal :input_amt, precision: 10, scale: 2
      t.string :input_currency
      t.decimal :output_amt, precision: 10, scale: 2
      t.string :output_currency
      t.text :comment
      t.boolean :is_active

      t.timestamps
    end
  end
end
