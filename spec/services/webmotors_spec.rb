require 'spec_helper'
require_relative File.expand_path('../../../app/services/webmotors', __FILE__)

describe Service::Webmotors do
  subject { described_class.new }

  describe '#makers' do
    subject { described_class.new.makers }

    it 'returns json array with all makers' do
      expect(subject).to be_kind_of(Array)
    end

    it 'returned json array be include key :Nome' do
      expect(subject.first).to be_include('Nome')
    end

    it 'returned json array be include key :Id' do
      expect(subject.first).to be_include('Id')
    end

    it 'return nil if does not response with success' do
      allow(described_class).to receive(:post).and_return(double(:response, success?: false))
      expect(subject).to be_nil
    end
  end
end
