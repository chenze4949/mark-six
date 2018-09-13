class FixDrawingColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :drawings do |t|
      t.string :title
      t.rename :type, :drawing_type
    end
  end
end
