class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email_address
      t.string :phone_number
      t.string :avatar

      t.timestamps
    end
  end
end
