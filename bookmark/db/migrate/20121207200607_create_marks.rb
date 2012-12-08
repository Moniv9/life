class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks , :id=>false do |t|
      t.string :item
      t.string :title
      t.text :url
      t.text :tags
      
    end
    execute "Alter table marks add primary key(item)"
  end
end
