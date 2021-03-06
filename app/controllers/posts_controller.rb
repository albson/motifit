class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all
	end

	def show
		@comments = Comment.where(post_id: @post.id)
	end

	def new
		@post = current_user.posts.build
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	private

		def set_post
      @post = Post.find(params[:id])
    end

		def post_params
			params.require(:post).permit(:title,:body,:image)
		end
end
