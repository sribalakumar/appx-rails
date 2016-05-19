class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|

      t.timestamps null: false
    end
  end
end
