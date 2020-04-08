class PostsController < ApplicationController
    before_action :authenticate_user!  , only:[:new ]
    before_action :set_post, only: [:update, :destroy , :show ,:edit]

    # GET /posts
    def index
      @posts = Post.where(["categories LIKE ?","%#{params[:search]}%"])
  
    end

    # GET /posts/1
    def show
      post = Post.find(params[:id])
      @comments = post.comments
    end
  
    # GET /posts/new
    def new
      
      @post = Post.new
    end
  
    # POST /posts
    def create
      @post = Post.create(post_params.merge(user_id: current_user.id))
      @post.user = current_user
  
      if @post.save
        redirect_to root_path
      else
        render 'new', notice: @post.errors.full_messages.first
      end
  
    end
  # GET /posts/1/edit
    def edit
    
  end
  
    # PATCH/PUT /posts/1
    def update
      post = Post.find(params[:id])
      post.update(params.require(:post).permit(:title , :content , :image , :categories) )
  
              redirect_to post
    end
  
    # DELETE /posts/1
    def destroy
      @post.user = current_user
      Post.find(params[:id]).destroy

      redirect_to posts_path 

      @post.destroy
     
    end
    
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :content , :image , :categories)
      end
  end

