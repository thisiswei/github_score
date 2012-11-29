require 'client'
class Event < ActiveRecord::Base
  attr_accessible :uniq_id, :kind, :author, :data, :github_created_at
  validates_uniqueness_of :uniq_id, :github_created_at
  validates_presence_of :data, :github_created_at, :author, :kind
  belongs_to :author

  SCORES = { 
    'CommitCommentEvent' => 2,
    'IssueCommentEvent'  => 2,
    'IssuesEvent'        => 3,
    'WatchEvent'         => 1,
    'PullRequestEvent'   => 5,
    'PushEvent'          => 7,
    'FollowEvent'        => 1,
    'CreateEvent'        => 3,
  }

  def self.create_from_record author,record
    record['uniq_id'].force_encoding 'UTF-8'

    params = {
      kind: record['type'],
      author: author,
      data: [Marshal.dump(record)].pack('m'),
      github_created_at: record['created_at'],
      uniq_id: record['uniq_id']
    } 
    create params
  end

  def score
    SCORES.fetch(kind) {0}  #return 0 if type not found.
  end


  
end

