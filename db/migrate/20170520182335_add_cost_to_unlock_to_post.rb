class AddCostToUnlockToPost < ActiveRecord::Migration[5.0]
  def change
    add_monetize :posts, :price, amount: {null: false, default: 99}
  end
end
