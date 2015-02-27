class CommentsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :update, :destroy]

	def index
		@comments = Comment.all
	end

	def show
	end

	def new
		@comment = Comment.new
	end

	def edit
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to @comment
		else
			render 'new'
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

		def comment_params
			params.require(:review).permit(:body)
		end
end
