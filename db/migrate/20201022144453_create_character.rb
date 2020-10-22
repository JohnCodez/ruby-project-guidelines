class CreateCharacter < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      #name, appearance, pronouns, user_id
      t.string :name
      t.string :appearance
      t.string :pronouns
      t.integer :user_id
    end
  end
end
