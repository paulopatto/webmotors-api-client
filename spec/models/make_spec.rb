require 'rails_helper'

describe Make, type: :model do
  subject { described_class.new }

  it { is_expected.to have_many(:models) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:webmotors_id) }
end
