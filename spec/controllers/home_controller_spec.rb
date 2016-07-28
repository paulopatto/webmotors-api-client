require 'rails_helper'

describe HomeController, type: :controller do
  subject { described_class }

  describe '#index', vcr: { cassette_name: 'home_index' } do
    it 'returns success' do
      get :index

      expect(response).to be_success
    end

    it 'render :index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end
end
