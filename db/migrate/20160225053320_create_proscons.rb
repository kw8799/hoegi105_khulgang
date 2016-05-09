class CreateProscons < ActiveRecord::Migration
  def change
    create_table :proscons do |t|
      
      t.integer :review_id
      t.string :agree_user
      t.string :disagree_user
      

      t.timestamps null: false
    end
  end
end
