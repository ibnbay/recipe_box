class CreateTahapans < ActiveRecord::Migration
  def change
    create_table :tahapans do |t|
      t.text :step
      t.belongs_to :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
