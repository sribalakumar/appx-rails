class InstalledExtension < ActiveRecord::Base
  has_many :linked_resources
  serialize :configs, Hash
  serialize :source_configs, Hash
  serialize :dest_configs, Hash

  after_commit :call_dev_after_commit_code


  def call_dev_after_commit_code
    # self.extension.source_element.after_commit_hook
    # self.extension.destination_element.after_commit_hook
  end

end
