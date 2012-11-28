require 'github/client'

class Author < ActiveRecord::Base
  has_many :events

  def self.import name, klass = ::Github::Client
    
    records = klass.fetch name
    author  = Author.find_or_create_by_name name

    records.each do |record|
      begin
        Event.create_from_record author,record
      rescue
        next
      end
    end

    actor 
  end

  def score
    events.map(&:score).inject(0){|s,v|s+v}
    # events.map(&:score).reduce(:+)
  end

end
