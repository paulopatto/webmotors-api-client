# == Schema Information
#
# Table name: makes
#
#  id           :integer          not null, primary key
#  name         :string
#  webmotors_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Make < ActiveRecord::Base
  has_many :models, dependent: :destroy

  validates :name, presence: true
  validates :webmotors_id, presence: true
end
