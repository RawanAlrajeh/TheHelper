class CommentsController < ApplicationController
  before_action :authenticate_user!  , only:[:new ]

    def new
      @comment =  @post.comment.new
     
    end

    def create

      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
      @comment.user = current_user
      
        redirect_to post_path(@post)
    

        
    end
    
      def destroy

        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    
        @comment.destroy

        redirect_to post_path(@post)
      end
      private 

      def comment_params
        params.require(:comment).permit(:content , :post_id, :user_id)
      end
    end
