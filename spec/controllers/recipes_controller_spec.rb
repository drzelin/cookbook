require 'rails_helper'

RSpec.describe RecipesController do
  describe "POST create" do
    subject { post(:create, params: params) }

    let(:params) { {"recipe" => {"name" => "test recipe"}} }
    
    it "assigns @recipe" do
      subject
      expect(assigns(:recipe)).to eq(Recipe.last)
    end

    it "renders the show template" do
      subject
      expect(response).to redirect_to(:action => :show, :id => Recipe.last.id)
    end
  end

  describe "GET index" do
    subject { get(:index) }

    before do
      create_list(:recipe, 2)
    end
    
    it "assigns @recipes" do
      subject

      # contain_exactly expects each of the elements as a separate argument
      # so the asterisk turns an array into an argument list
      expect(assigns(:recipes).pluck(:id)).
        to contain_exactly(*Recipe.pluck(:id))
    end
  end

  describe "GET show" do
    subject { get(:show, params: params) }

    let(:params) { {"id" => recipe.id} }
    let(:recipe) { create(:recipe) }
    
    it "assigns @recipe" do
      subject

      expect(assigns(:recipe)).to eq(recipe)
    end
  end
end
