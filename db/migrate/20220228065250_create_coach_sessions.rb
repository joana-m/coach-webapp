class CreateCoachSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :coach_sessions do |t|
      t.string :session_name
      t.string :type_of_activity
      t.string :description
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
