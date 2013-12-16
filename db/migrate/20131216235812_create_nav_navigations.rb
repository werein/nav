class CreateNavNavigations < ActiveRecord::Migration
  def change
    create_table :nav_navigations do |t|
      t.string :name
      t.string :title
      t.string :subtitle
      t.string :locale
      t.string :ancestry
      t.integer :position
      t.string :permalink

      t.timestamps
    end
  end
end
