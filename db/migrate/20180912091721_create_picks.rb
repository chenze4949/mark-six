class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.integer :ticket_id
      t.integer :ball_number

      t.timestamps
    end
  end
end
