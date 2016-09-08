class CreateStory < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.column :title, :string
      t.column :creator, :string

      t.timestamps
    end
  end
end
