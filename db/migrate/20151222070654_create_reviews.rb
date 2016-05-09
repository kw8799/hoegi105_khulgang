class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      
      t.integer :classofhot_id
      t.string :review_content
      t.string :review_writer
      t.integer :_like
      t.integer :_dislike
      t.string :like_clicker
      t.float :eval_star
      t.float :eval_grade
      t.float :eval_easy
      t.float :eval_academic
      t.string :picture

      t.timestamps null: false
    end
  end
end