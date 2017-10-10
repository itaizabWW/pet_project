class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @restaurant_id = params[:restaurant_id]
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    # save user info
    user_validate

    # save max_delivery_time to restaurant
    update_max_delivery_time(@review.restaurant_id)

    respond_to do |format|
      if @review.save
        format.html { redirect_to store_index_path, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to  new_review_path(restaurant_id: restaurant_id),notice: "Missing parameters #{@review.errors.full_messages}" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    # require params methods
    def review_params
      params.require(:review).permit(:rating, :comment, :restaurant_id)
    end

    def user_params
      params.require(:review).permit(:name, :email)
    end

    def update_max_delivery_time(restaurant_id)
      review_max_delivery_time = Integer(params[:review][:max_delivery_time])
      cur_restaurant = Restaurant.find(restaurant_id)

      cur_restaurant.update!(max_delivery_time: [review_max_delivery_time, cur_restaurant.max_delivery_time].max)
    end

    def user_validate
      @review.user = User.where(email: user_params[:email]).first_or_create!(user_params)
    end
end
