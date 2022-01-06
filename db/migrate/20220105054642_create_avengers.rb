class CreateAvengers < ActiveRecord::Migration[6.1]
  def change
    create_table :avengers do |t|
      t.string :superhero_name
      t.string :real_name
      t.integer :age
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
