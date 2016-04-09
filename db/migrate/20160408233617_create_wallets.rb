class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.integer :game_id
      t.integer :wallet, default: 0
    end
  end
end
