class Tweet < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true
  validates :content, length: { maximum: 140,
    message: "%{count} characters is the maximum allowed" }
end


