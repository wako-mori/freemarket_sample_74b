class CreatePreparationDays < ActiveRecord::Migration[5.0]
  def change
    create_table :preparation_days do |t|

      t.string :preparation_day,	null: false

      t.timestamps
    end
  end
end
