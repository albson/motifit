class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :set_post

	def new
		@comment = Comment.new
	end

	def edit
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def update
		@comment.update(comment_params)
	end

	def destroy
		@comment.destroy
	end

	private
		def set_comment
			@comment = Comment.find(params[:id])
		end

		def set_post
			@post = Post.find(params[:post_id])
		end

		def comment_params
			params.require(:comment).permit(:body)
		end
end
