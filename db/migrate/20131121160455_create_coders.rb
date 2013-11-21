class CreateCoders < ActiveRecord::Migration
  def change
    create_table :coders do |t|
    	t.text :code
      t.timestamps
    end
  end
end
