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
    
        if @post.save
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end

    end 

    private
    def post_params
      params.require(:post).permit(:content)
    end
end
