class Event < ActiveRecord::Base
  attr_accessible :uniq_id
  validates_uniqueness_of :uniq_id
  belongs_to :actor


  
end

