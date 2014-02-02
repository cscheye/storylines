class Story < ActiveRecord::Base
  has_many :entries
  validates :title, presence: true, length: {maximum: 30}
  validates :first_entry, length: {minimum: 3, maximum: 100}

  def finished?
    self.entries.size >= 5
  end
  
  def self.finished_stories
    stories = Story.all
    finished_stories = []
    stories.each do |story|
      finished_stories << story if story.finished?
    end
    return finished_stories
  end

end