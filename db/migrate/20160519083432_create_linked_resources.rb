class CreateLinkedResources < ActiveRecord::Migration
  def change
    create_table :linked_resources do |t|

      t.timestamps null: false
    end
  end
end
