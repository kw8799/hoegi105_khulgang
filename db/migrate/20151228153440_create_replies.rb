class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      
      t.integer :review_id
      t.string :reply_content
      t.string :reply_writer

      t.timestamps null: false
    end
  end
end
