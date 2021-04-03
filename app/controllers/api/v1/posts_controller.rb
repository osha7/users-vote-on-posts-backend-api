class Api::V1::PostsController < ApplicationController
    skip_before_action :require_login

    def index
        posts = Post.all.sort
        render json: {post: PostSerializer.new(posts)}
    end

    def show
        post = Post.find(params[:id])
        render json: {post: PostSerializer.new(post)}
    end
    
    def create
        post = Post.create(post_params)
    
        if post.valid?
            render json: {
                post: PostSerializer.new(post),
                success: "Post Created Successfully"
            }  
        else
            render json: {errors: post.errors.full_messages}
        end

    end
    
    def update
        post = Post.find(params["post"]["id"])
        post.update(post_params)

        if post.valid?
            post.save
            render json: {
                post: post,
                success: "Post Updated Successfully"
            }
        else
            render json: {errors: post.errors.full_messages}
        end

    end
    
    def destroy
        post = Post.find(params[:id])

        if post.destroy
            posts = Post.all
            render json: {
                posts: PostSerializer.new(posts),
                success: "Post Was Successfully Deleted"
            }
        else
            render json: {
                posts: PostSerializer.new(posts),
                error: "Unable To Delete Post At This Time"
            }
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:id, :title, :content, :author)
    end

end
