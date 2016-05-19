class Extension < ActiveRecord::Base
  belongs_to :source_element, :class_name => "Element", :foreign_key => 'source_element_id'
  belongs_to :destination_element, :class_name => "Element", :foreign_key => 'destination_element_id'
end