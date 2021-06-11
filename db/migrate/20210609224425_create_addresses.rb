class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer    :postal_code,      null: false
      t.integer    :prefecture_id,     null: false
      t.integer    :city,           null: false
      t.integer    :house_number,   null: false
      t.integer    :building,   null: false
      t.string    :phone_number,   null: false
      t.references    :sell_item, foreign_key: true
      t.references    :user,  foreign_key: true
      t.timestamps
    end
  end
end


