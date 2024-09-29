class CreateStudentCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :student_courses do |t|
      t.references :course
      t.references :student
      t.timestamps
    end
  end
end
