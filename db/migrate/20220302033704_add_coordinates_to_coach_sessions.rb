class AddCoordinatesToCoachSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :coach_sessions, :latitude, :float
    add_column :coach_sessions, :longitude, :float
  end
end
