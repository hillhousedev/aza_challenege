class CreateFxTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :fx_transactions do |t|
      t.string :identifier
      t.decimal :input_amount
      t.string :input_currency
      t.decimal :output_amount
      t.string :output_currency
      t.date :date_of_transaction
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
