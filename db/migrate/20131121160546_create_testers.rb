class CreateTesters < ActiveRecord::Migration
  def change
    create_table :testers do |t|
    	t.text :code
      t.timestamps
    end
  end
end
