# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Element.create(:name => 'Freshdesk', :authentication_type => 1)
Element.create(:name => 'Jira', :authentication_type => 1)
Extension.create(:name => "FD_JIRA_APP", :product_id => 1, :account_id => 0, :source_element_id => 1, :destination_element_id => 2)
InstalledExtension.create(:extension_id => 1, :product_id => 1, :account_id => 12343, :source_configs => {"username" => "balafreshdesk", "password" => "password"}, :dest_configs => {"jira_user_name" => "freshdesktest", "password" => "test"})