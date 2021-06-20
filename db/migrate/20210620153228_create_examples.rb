class CreateExamples < ActiveRecord::Migration[6.1]
  def change
    create_table :examples do |t|
      t.integer :user_id
      t.integer :prompt_id
      t.string :word
      t.text :sentence

      t.timestamps
    end
  end
end
