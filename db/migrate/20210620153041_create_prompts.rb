class CreatePrompts < ActiveRecord::Migration[6.1]
  def change
    create_table :prompts do |t|
      t.text :text
      t.string :image_url

      t.timestamps
    end
  end
end
