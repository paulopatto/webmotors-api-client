require 'rails_helper'

describe Model, type: :model do
  subject { described_class.new }

  it { is_expected.to belong_to(:make) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:webmotors_id) }
end
