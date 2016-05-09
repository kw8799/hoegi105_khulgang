class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      
      t.string :major_code
      t.string :major_title
      
      t.timestamps null: false
    end
  end
end
