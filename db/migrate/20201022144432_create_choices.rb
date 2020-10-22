class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      # char_id, story_id, choice
      t.integer :char_id
      t.integer :story_id
      t.string :choice
    end
  end
end
