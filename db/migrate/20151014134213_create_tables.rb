class CreateTables < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :prelude
      t.string :url
  end

  create_table :links do |t|
    t.integer :from_page_id
    t.integer :to_page_id
  end
end
end
