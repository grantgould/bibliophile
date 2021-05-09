class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: %i[new edit]
  before_action :set_book
  before_action :check_if_reviewed, only: [:new, :create]
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = current_user.reviews.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = @book.reviews.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def check_if_reviewed
      if current_user.reviews.find_by(book: @book)
        redirect_to @book, notice: "already reviewed."
      end
    end

    def set_book
      @book = Book.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @book.reviews.find(params[:review_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :review)
    end
end
