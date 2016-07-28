# == Schema Information
#
# Table name: models
#
#  id           :integer          not null, primary key
#  make_id      :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  webmotors_id :integer
#

class Model < ActiveRecord::Base
  belongs_to :make

  validates :name, presence: true
  validates :webmotors_id, presence: true
end
