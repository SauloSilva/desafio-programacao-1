require 'rails_helper'

RSpec.describe ImportersController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of importers' do
      importer = create(:importer)
      get :index
      expect(assigns(:importers)).to eq([importer])
      expect(assigns(:impoters_gross_value_sum)).to be_kind_of(Float)
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'assigns to the new importer' do
      get :new
      expect(assigns(:importer)).to be_kind_of(Importer)
    end

    it 'renders the :new view' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new importer' do
        expect{
          post :create, params: { importer: attributes_for(:importer) }
        }.to change(Importer,:count).by(1)
      end

      it 'redirects to the new importer' do
        post :create, params: { importer: attributes_for(:importer) }
        expect(response).to redirect_to importers_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new importer' do
        expect{
          post :create, params: { importer: attributes_for(:importer, file: nil) }
        }.to_not change(Importer, :count)
      end

      it 're-renders the new method' do
        post :create, params: { importer: attributes_for(:importer, file: nil) }
        expect(response).to render_template :new
      end
    end
  end
end
