require "rails_helper"

describe ReviewsController , type: :controller do
  context "GET method" do
    describe "GET #index" do
      it "renders the #index view" do
        get :index
        expect(response).to render_template("index")
      end

      it "assigns @review" do
        get :index
        expect(assigns(:reviews)).to eq (Review.all)
      end
    end

    describe "GET #show" do
      review = FactoryGirl.create(:review)
      it "renders the #show view" do
        get :show, params: {id: review}
        expect(response).to render_template("show")
      end
    end

    describe "GET #edit" do
      review = FactoryGirl.create(:review)
      it "renders the #edit view" do
        get :edit, params: {id: review}
        expect(response).to render_template("edit")
      end
    end

    describe "GET #new" do
      let(:restaurant) { FactoryGirl.create(:restaurant) }
      # restaurant = FactoryGirl.create(:restaurant)
      it "renders the #new view" do
        get :new  ,params: {id: restaurant[:id]}
        expect(response).to render_template("new")
      end

      let(:restaurant) { FactoryGirl.create(:restaurant) }
      it "pass the restaurant parametr" do
        get :new  ,params: {restaurant_id: restaurant[:id]}
        expect(controller.params[:restaurant_id]).to eq ((restaurant.id).to_s)
      end


      let(:restaurant) { FactoryGirl.create(:restaurant) }
      it "assigns the @restaurant_id parametr" do
        get :new  ,params: {restaurant_id: restaurant[:id]}
        expect(assigns(:restaurant_id)).to eq ((restaurant.id).to_s)
      end
    end
  end

  context "POST method" do
    describe "POST #create" do

      let(:review) { FactoryGirl.build(:review) }
      it "creates a new review" do
      expect{
        param = FactoryGirl.attributes_for(:review).merge(email: review.user.email, name: review.user.name, max_delivery_time: 60, restaurant_id:review.restaurant_id)
        post :create, params: { review:  param}
      }.to change(Review,:count).by(1)
      end

      it "the max_delivery_time was changed" do
        before_update_max_delivey_time = review.restaurant.max_delivery_time
        param = FactoryGirl.attributes_for(:review).merge(email: review.user.email, max_delivery_time: 60,restaurant_id:review.restaurant_id)
        post :create, params: { review: param }
        expect(Restaurant.find(review.restaurant_id).max_delivery_time).to_not eq(before_update_max_delivey_time)
      end

      it "updates the max_delivery_time" do
        param = FactoryGirl.attributes_for(:review).merge(email: review.user.email, max_delivery_time: 60,restaurant_id:review.restaurant_id)
        post :create, params: { review: param }
        expect(Restaurant.find(review.restaurant_id).max_delivery_time).to eq(60)
      end

      it "user validate" do
        param = FactoryGirl.attributes_for(:review).merge(name: "itai" ,email: "itai@gmail.com", max_delivery_time: 60,restaurant_id:review.restaurant_id)
        post :create, params: { review: param }
        expect(Review.last.user.email).to eq("itai@gmail.com")
      end

    end
  end


  context "PUT method" do
    describe "PUT #update" do
      let(:review) { FactoryGirl.create(:review) }
      it "redirects to the updated review" do
        put :update, params: { id: review.id, review: FactoryGirl.attributes_for(:review) }
        expect(response).to redirect_to(review)
      end
    end
  end

  context "DELETE method" do
    describe "DELETE #destroy" do
      let(:review) { Review.last }
      it "deletes the review" do
        expect{
          delete :destroy , params: { id: review.id }
        }.to change(Review,:count).by(-1)
      end
    end
  end
end


