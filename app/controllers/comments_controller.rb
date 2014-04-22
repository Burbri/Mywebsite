class CommentsController < ApplicationController
	def create
  		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to posts_path(@post) 
  	end
	
	def destroy
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.find(params[:id])
    	@comment.destroy
    	redirect_to posts_path(@post) 
  	end
  	
  	http_basic_authenticate_with name: "bohyun", password: "secret", only: :destroy

	private 
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end 
end
