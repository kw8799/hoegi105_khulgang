class CreateClassofhotsMajors < ActiveRecord::Migration
  def change
    create_table :classofhots_majors, id: false do |t|
      
      t.belongs_to :classofhot, index: true
      t.belongs_to :major, index: true

      t.timestamps null: false
    end
  end
end
