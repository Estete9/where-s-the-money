class CreateJoinTableActivityCategory < ActiveRecord::Migration[7.1]
  def change
    create_join_table :categories, :activities do |t|
    end

    add_index :activities_categories, :category_id
    add_index :activities_categories, :activity_id
  end
end
