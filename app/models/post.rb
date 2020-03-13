class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validate :is_clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  
  def is_clickbait
    errors.add(:title, "Needs to be clickbait") unless title.include?"Won't Believe"||"Secret"||"Top [number]"||"Guess"
  end
end
