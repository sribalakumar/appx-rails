class InstalledExtension < ActiveRecord::Base
  has_many :linked_resources
  serialize :configs, Hash
  serialize :source_configs, Hash
  serialize :dest_configs, Hash
end
