class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :drawing_id
      t.integer :user_id
      t.integer :correct_count

      t.timestamps
    end
  end
end
