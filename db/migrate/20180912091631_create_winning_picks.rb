class CreateWinningPicks < ActiveRecord::Migration[5.2]
  def change
    create_table :winning_picks do |t|
      t.integer :drawing_id
      t.integer :ball_number

      t.timestamps
    end
  end
end
