require 'rails_helper'
require 'pry'
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/activities", type: :request do

  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:valid_attributes) { attributes_for(:activity, author: user, categories: [category]) }
  let(:invalid_attributes) {
    {
      name: nil,
      amount: nil,
      author_id: user.id,
      category_ids: [category.id]
    }
   }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      activity = build(:activity, author: user, categories: [category])
      get category_activities_path(category_id: category.id)

      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_category_activity_path(category_id: category.id)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Activity" do
        expect {
          post category_activities_path(category_id: category.id), params: { activity: valid_attributes }
        }.to change(Activity, :count).by(1)
      end

      it "redirects to the activities view" do
        post category_activities_path(category_id: category.id), params: { activity: valid_attributes }
        expect(response).to redirect_to(category_activities_path(category_id: category.id))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Activity" do
        expect {
          post category_activities_path(category_id: category.id), params: { activity: invalid_attributes }

        }.to change(Activity, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post category_activities_path(category_id: category.id), params: { activity: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "New Name",
          amount: 10.0,
          author_id: user.id,
          category_ids: [category.id]
        }
      }

      it "updates the requested activity" do
        activity = create(:activity, author: user, categories: [category])
        patch category_activity_path(category_id: category.id, id: activity.id), params: { activity: new_attributes }
        activity.reload

        expect(activity.name).to eq("New Name")
        expect(activity.amount).to eq(10.0)
      end

      it "redirects to the activity" do
        activity = create(:activity, author: user, categories: [category])
        patch category_activity_path(category_id: category.id, id: activity.id), params: { activity: new_attributes }
        activity.reload
        expect(response).to redirect_to(category_activity_path(category_id: category.id, id: activity.id))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        activity = create(:activity, author: user, categories: [category])
        patch category_activity_path(category_id: category.id, id: activity.id), params: { activity: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested activity" do
      activity = create(:activity, author: user, categories: [category])
      expect {
        delete category_activity_path(category_id: category.id, id: activity.id)
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = create(:activity, author: user, categories: [category])
      delete category_activity_path(category_id: category.id, id: activity.id)
      expect(response).to redirect_to(category_activities_path(category_id: category.id))
    end
  end
end
