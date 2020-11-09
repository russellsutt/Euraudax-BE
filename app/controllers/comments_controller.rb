class CommentsController < ApplicationController
    skip_before_action :authorized

     def index
        comments = Comment.all
        render json: comments
    end

    def create
        comment = Comment.create(comment_params)
        if comment.save
            render json: comment, status: :created
        else
          render json: { error: 'failed to create comment' }, status: :not_acceptable
        end
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end

    def update
        comment = Comment.find(params[:id])
        comment.update!(comment_params)

        if comment.save
            render json: comment  
        else
            render json: {error: comment.errors.full_messages}, status: :not_acceptable
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {}
    end

    private 
    
    def comment_params
        params.require(:comment).permit(:content, :user_id, :event_id)
    end
end
