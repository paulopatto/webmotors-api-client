class Model < ActiveRecord::Base
  belongs_to :make

  validates :name, presence: true
  validates :webmotors_id, presence: true
end
