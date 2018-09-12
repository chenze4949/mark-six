class CreateDrawings < ActiveRecord::Migration[5.2]
  def change
    create_table :drawings do |t|
      t.string :type
      t.datetime :drawing_on

      t.timestamps
    end
  end
end
