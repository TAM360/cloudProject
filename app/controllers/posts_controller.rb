class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :convert_post_id_to_integer, only: [:set_ratings]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def other_posts
    @posts = Post.where.not(user_id: current_user.id)
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    puts params
    # redirect_to new_post_url
    @post = Post.new(post_params)
    # @post.picture.attach(params[:post][:picture])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, notice: 'Post not created successfully.' }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_ratings
    puts params
    check = PostRating.where(user_id: params[:user_id], post_id: params[:post_id])
    @post = Post.find_by(id: params[:post_id])

    if check.present?
      check.update(rating: params[:rating])
      redirect_to @post
    else
      rating = PostRating.new(append_ratings_params)
      respond_to do |format|
        if rating.save 
          format.html { redirect_to @post, notice: 'Rating Submitted' }
        else
          format.html { redirect_to @post, notice: 'Rating Not Submitted' }
        end
      end
    end 
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:description, :location, :ratings, :diary_type, :user_id, pictures: [])
  end

  def convert_post_id_to_integer 
    params[:user_id] = current_user.id
    params[:post_id] = params[:post_id].to_i
  end

  def append_ratings_params 
    params.permit(:user_id, :rating, :post_id)
  end
end
