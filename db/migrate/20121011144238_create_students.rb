require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |x|
      x.string :first_name
      x.string :last_name
      x.string :gender
      x.date :birthday
      x.string :email
      x.string :phone

      x.timestamps null: false
    end
  end
end
