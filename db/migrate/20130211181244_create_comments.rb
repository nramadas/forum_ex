class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :body
      t.integer :author_id

      t.timestamps
    end
  end
end
