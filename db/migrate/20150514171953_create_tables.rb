class CreateTables < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cuisine
      t.timestamps
    end

    create_table :recipes do |t|
      t.string :name
      t.string :instruction
      t.integer :rating
      t.integer :amount
      t.timestamps
    end
    create_table :ingredients do |t|
      t.string :name

      t.timestamps
    end

    create_table :categories_recipes do |t|
      t.belongs_to :category, index:true
      t.belongs_to :recipe, index:true
    end

    create_table :ingredients_recipes do |t|
      t.belongs_to :recipe, index:true
      t.belongs_to :ingredient, index:true
    end

  end
end
