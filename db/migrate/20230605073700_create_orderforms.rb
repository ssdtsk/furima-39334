class CreateOrderforms < ActiveRecord::Migration[6.0]
  def change
    create_table :orderforms do |t|

      t.timestamps
    end
  end
end
