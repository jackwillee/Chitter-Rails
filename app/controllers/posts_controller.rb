class PostsController < ApplicationController

    def index
    @posts = Post.all
    #to access all posts from the model/database#

    end 


    def new
        @post = Post.new
    end

    def create
      @post = Post.new(post_params)
  
      respond_to do |format|
        if @post.save!
          format.html { redirect_to root_path, notice: "post created!" }
        else
          format.html { render action: 'new' }
        end
      end
    end

    private
    def post_params
      params.require(:post).permit(:content)
    end
end
