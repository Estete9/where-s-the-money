require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: category.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        expect do
          post :create, params: { category: attributes_for(:category) }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the inventories list' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        expect do
          post :create, params: { category: { name: nil } }
        end.to_not change(Category, :count)
      end

      it 'renders the new template' do
        post :create, params: { category: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end
end
