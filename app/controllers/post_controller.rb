class PostController < ApplicationController
	def taotaikhoan
   u = User.where(:email => "tony@vinova.sg").first || User.new
   u.email = "tony@gmail.com"
   u.password = "12345678"
   u.save
 end
 def getdata
  Api::Vnnet.crawling
end

def index
  @posts = Post.all.order(id: :desc)
  if params[:category].present?
    @posts = Post.where(category_id: Category.where(name: params[:category]) ).order(id: :desc )
  end
  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /articles/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @post = Post.new(params[:article])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Article was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:article])
        format.html { redirect_to @post, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
