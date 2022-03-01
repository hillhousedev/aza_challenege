class AddUniquenessContraintsToFxTransactions < ActiveRecord::Migration[7.0]
  def change
    add_index :fx_transactions, :identifier, unique: true, name: 'unique_identifier'
  end
end

