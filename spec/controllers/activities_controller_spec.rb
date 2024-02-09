require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:activity) { create(:activity, author: user, categories: [category]) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { category_id: category.id }

      expect(response).to be_successful
    end

    it 'assigns @category and @activities' do
      get :index, params: { category_id: category.id }
      expect(assigns(:category)).to eq(category)
      expect(assigns(:activities)).to eq(category.activities)
    end

    it 'renders the index template' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { category_id: category.id }
      expect(response).to be_successful
    end

    it 'assigns @categories, @category, and @activity' do
      get :new, params: { category_id: category.id }
      expect(assigns(:categories)).to eq([category])
      expect(assigns(:category)).to eq(category)
      expect(assigns(:activity)).to be_a_new(Activity)
    end

    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_attributes) { attributes_for(:activity) }

      it 'creates a new activity' do
        expect do
          post :create, params: { category_id: category.id, activity: valid_attributes.merge(category_ids: [category.id]) }
        end.to change(Activity, :count).by(1)
      end

      it 'redirects to the activities index' do
        post :create, params: { category_id: category.id, activity: valid_attributes.merge(category_ids: [category.id]) }
        expect(response).to redirect_to(category_activities_path(category_id: category.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new activity' do
        expect do
          post :create, params: { category_id: category.id, activity: { name: nil } }
        end.to_not change(Activity, :count)
      end

      it 'renders the new template' do
        post :create, params: { category_id: category.id, activity: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end
end
