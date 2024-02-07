class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name,   null: false, default: ""
      t.string :icon, null: false, default: ""

      t.timestamps
    end
  end
end
