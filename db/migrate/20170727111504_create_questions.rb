class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :author_id
      t.text  :body, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
