class CreateInstalledExtensions < ActiveRecord::Migration
  def change
    create_table :installed_extensions do |t|

      t.timestamps null: false
    end
  end
end
