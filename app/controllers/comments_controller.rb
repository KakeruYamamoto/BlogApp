class CommentsController < ApplicationController
  
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.js { render :index }
      else
        format.html { render :new }
        format.js { render :index }
      end
    end
  end

end
