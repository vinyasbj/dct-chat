class AddColumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :batch_id, :integer
  end
end
