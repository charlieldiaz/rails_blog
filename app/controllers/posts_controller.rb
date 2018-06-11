class PostsController < ApplicationController
  def index
     @posts = Post.all



    #[
    #   {
    #     :title => "First Post",
    #     :content => "This is the content area",
    #     :slug => "first-post",
    #     :img_url => "https://res.cloudinary.com/sfp/image/upload/w_310,h_372,c_fill,q_60/oth/FunimationStoreFront/1327864/English/1327864_English_ShowThumbnail_7ebbd68b-2e51-e711-8175-020165574d09.jpg",
    #     :featured => false
    #   },
    #   {
    #     :title => "Top 10 Javascript frameworks",
    #     :content => "This is the content area",
    #     :slug => "Top-10-Javascript-frameworks",
    #     :img_url => "https://res.cloudinary.com/sfp/image/upload/w_310,h_372,c_fill,q_60/oth/FunimationStoreFront/1327864/English/1327864_English_ShowThumbnail_7ebbd68b-2e51-e711-8175-020165574d09.jpg",
    #     :featured => false
    #   },
    #   {
    #     :title => "Top 10 PHP frameworks",
    #     :content => "This is the content area",
    #     :slug => "top-10-php-frameworks",
    #     :img_url => "https://res.cloudinary.com/sfp/image/upload/w_310,h_372,c_fill,q_60/oth/FunimationStoreFront/1327864/English/1327864_English_ShowThumbnail_7ebbd68b-2e51-e711-8175-020165574d09.jpg",
    #     :featured => false
    #   },
    #   {
    #     :title => "Top 10 Places in Vancouver",
    #     :content => "This is the content area",
    #     :slug => "Top-10-places-in-vancouver",
    #     :img_url => "https://res.cloudinary.com/sfp/image/upload/w_310,h_372,c_fill,q_60/oth/FunimationStoreFront/1327864/English/1327864_English_ShowThumbnail_7ebbd68b-2e51-e711-8175-020165574d09.jpg",
    #     :featured => true
    #   }
    # ]
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(sanitize_params)

    if @post.save
      redirect_to @post

    else
      render html: "sorry it did not save"
    end
    #render json: params
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(sanitize_params)
      redirect_to @post
    else
      render html: "sorry it was not saved"
    end
    # render html: "You got the update"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
    def sanitize_params
      params.require(:post).permit(:title,:content,:slug, :img_url, :category_id, :featured)
    end
end
