class PostsController < ApplicationController
    def index
        # インスタンス
        @posts = Post.all
    end

    def new
        # オブジェクト生成
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            # /postsへリダイレクト
            redirect_to posts_path
        else
            render:new
        end
    end
    
    # post_paramsへの修飾
    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

end
