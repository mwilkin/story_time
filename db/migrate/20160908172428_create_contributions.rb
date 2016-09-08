class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.column :creator, :string
      t.column :image, :string
      t.column :content, :string
      t.column :story_id, :integer

      t.timestamps
    end
  end
end
