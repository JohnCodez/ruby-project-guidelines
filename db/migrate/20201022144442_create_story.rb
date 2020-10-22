class CreateStory < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      #text, choice1, choice2 
      t.string :text
      t.string :choice1
      t.string :choice2
    end
  end
end
