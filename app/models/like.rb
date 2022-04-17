class Like < ApplicationRecord
  belongs_to :fan, counter_cache: true
  belongs_to :photo, counter_cache: true
end
