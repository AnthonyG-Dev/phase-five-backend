class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.date :start
      t.date :end
      t.text :description

      t.timestamps
    end
  end
end
