require 'spec_helper'
require_relative File.expand_path('../../../app/services/webmotors', __FILE__)

describe Service::Webmotors do
  subject { described_class.new }

  describe '#makers', vcr: { cassette_name: 'post_webmotors_carro_marcas' } do
    subject { described_class.new.makers }

    it 'returns json array with all makers' do
      expect(subject).to be_kind_of(Array)
    end

    it 'returned json object in array be include key :Nome' do
      expect(subject.first).to be_include('Nome')
    end

    it 'returned json object element on array be include key :Id' do
      expect(subject.first).to be_include('Id')
    end

    it 'does not return empty array' do
      expect(subject).to_not be_empty
    end

    it 'return empty Array if does not response with success' do
      allow(described_class).to receive(:post).and_return(double(:response, success?: false))
      expect(subject).to be_empty
    end
  end

  describe '#models_from', vcr: { cassette_name: 'post_webmotors_carro_modelos' } do
    let(:maker_id) { 28 }

    it 'returns error if does not send :maker_id on message' do
      expect { subject.models_from }.to raise_error(ArgumentError)
    end

    it 'return Array' do
      expect(subject.models_from(maker_id)).to be_kind_of(Array)
    end

    it 'object element on array contains :Nome and :Id' do
      model = subject.models_from(maker_id).first

      expect(model).to be_include('Nome')
      expect(model).to be_include('Id')
    end
  end
end
