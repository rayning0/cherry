class AddLinesToCoders < ActiveRecord::Migration
  def change
    add_column :coders, :lines, :text
  end
end
