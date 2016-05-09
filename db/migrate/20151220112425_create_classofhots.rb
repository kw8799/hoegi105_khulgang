class CreateClassofhots < ActiveRecord::Migration
  def change
    create_table :classofhots do |t|
      
      t.string :lecture_code
      t.string :lecture_title
      t.string :professor_name
      t.string :typeof_lecture
      t.string :typeof_hospi
      t.string :lecture_major
      t.string :dateof_lecture #강의시기 컬럼 추가 160505

      t.timestamps null: false
    end
  end
end
