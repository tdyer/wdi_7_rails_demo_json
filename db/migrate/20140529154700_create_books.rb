class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.decimal :price
      t.references :author, index: true

      t.timestamps
    end
  end
end
