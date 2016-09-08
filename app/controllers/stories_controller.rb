class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
    else
      render :new
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  def edit
    @story = Story.find(params[:id])
  end

  def show
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to story_path
    else
      render :edit
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :creator)
  end

end
