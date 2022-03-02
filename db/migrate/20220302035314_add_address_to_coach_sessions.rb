class AddAddressToCoachSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :coach_sessions, :address, :string
  end
end
