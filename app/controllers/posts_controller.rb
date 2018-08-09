class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]

	def index
    # @posts = Post.posts_by current_user
    # added parantheses to chain new method
    @posts = Post.posts_by(current_user).page(params[:page]).per(10)
    # @posts = Post.all
	end

	def approve
		authorize @post
		@post.approved!
		redirect_to root_path, notice: "The post has been approved"
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
      # redirect_to action necessary to prevent rails from automatically attempting a redirect to a create template
      # redirect_to @post redirects to the post show page
			redirect_to @post, notice: 'Your post was created successfully'
		else
			render :new
		end
	end

	def edit
		authorize @post
	end

	def update
		authorize @post

		if @post.update(post_params)
			redirect_to @post, notice: 'Your post was edited successfully'
		else
			render :edit
		end
	end

	def show
	end

  # rails will redirect to a view with the same name as a controller action by default
	def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post was deleted successfully'
	end

	private

	  def post_params
	  	params.require(:post).permit(:date, :rationale, :status, :daily_hours)
	  end

	  def set_post
	  	@post = Post.find(params[:id])
	  end
end
