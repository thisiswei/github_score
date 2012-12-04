require 'client'

class Author < ActiveRecord::Base
  attr_accessible :gravatar_id
  validates_uniqueness_of :name , :case_sensitive => false
  has_many :events
  def self.import name 
    
    records = Github::Client.fetch name
    author  = Author.find_or_create_by_name name
    author.update_attributes(gravatar_id: records.first['actor_attributes']['gravatar_id'])

    records.each do |record|
      begin
        Event.create_from_record author,record
      rescue
        next
      end
    end

    author 
  end

  def score
    events.map(&:score).inject(0){|s,v|s+v}
    # events.map(&:score).reduce(:+)
  end

end
