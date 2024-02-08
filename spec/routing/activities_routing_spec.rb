require "rails_helper"

RSpec.describe ActivitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/categories/1/activities").to route_to("activities#index", category_id: "1")
    end

    it "routes to #new" do
      expect(get: "/categories/1/activities/new").to route_to("activities#new", category_id: "1")
    end

    it "routes to #show" do
      expect(get: "categories/1/activities/1").to route_to("activities#show", category_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "categories/1/activities/1/edit").to route_to("activities#edit", category_id: "1", id: "1")
    end


    it "routes to #create" do
      expect(post: "categories/1/activities").to route_to("activities#create", category_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "categories/1/activities/1").to route_to("activities#update", category_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "categories/1/activities/1").to route_to("activities#update", category_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "categories/1/activities/1").to route_to("activities#destroy", category_id: "1", id: "1")
    end
  end
end
