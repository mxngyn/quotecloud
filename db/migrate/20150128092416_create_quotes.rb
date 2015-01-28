class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :submitter_id
      t.integer :category_id
      t.timestamps
    end
  end
end
