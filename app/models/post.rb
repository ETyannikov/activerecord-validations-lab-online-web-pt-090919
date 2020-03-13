class Post < ActiveRecord::Base
  validates :isClickbait
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  
  def isClickbait
    errors.add(:title, "Needs to be clickbait") unless :title.include?"Won't Believe"||"Secret"||"Top [number]"||"Guess"
  end
end
