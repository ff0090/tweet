class Tweet < ActiveRecord::Base
  validates :content, length: { maximum: 255 }, presence: true
end
