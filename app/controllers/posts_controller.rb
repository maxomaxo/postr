class PostsController < ApplicationController
	def hey
		render text:"hi"
	end

	def index
		@posts = Post.all
	end
	def edit
		@post = Post.find params[:id]

	end 
	def update
		@post = Post.find params[:id]
		@post.update post_params
		redirect_to posts_path
	end
	def new 
		@post = Post.new
	end
	def create
		@post = Post.new post_params
		if @post.save
			redirect_to :action => 'show', :id => @post.id
		else
			render :action => 'new'
		end
	end	
	def show
		@post = Post.find params[:id]
	end
	def destroy
  		@post = Post.find(params[:id])
  		@post.destroy
  		redirect_to posts_path
	end
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
