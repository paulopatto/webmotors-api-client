class Make < ActiveRecord::Base
  has_many :models, dependent: :destroy

  validates :name, presence: true
  validates :webmotors_id, presence: true
end
