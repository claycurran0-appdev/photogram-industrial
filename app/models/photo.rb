# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  image          :string
#  comments_count :integer          default(0)
#  likes_count    :integer          default(0)
#  caption        :text
#  owner_id       :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Photo < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true
  has_many :comments
  has_many :likes
  has_many :fans, through: :likes

  validates :caption, presence:true
  validates :image, presence:true

  scope :past_week, -> { where(created_at: 1.week.ago...) }
  scope :by_likes, -> { order(likes_count: :desc) }

end
