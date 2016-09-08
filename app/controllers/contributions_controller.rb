class ContributionsController < ApplicationController

  def new
    @image = "image1.jpg"
    @story = Story.find(params[:story_id])
    @contribution = Contribution.new
  end

  def show
    @contribution = Contribution.find(params[:id])
  end

  def edit
    @story = Story.find(params[:story_id])
    @contribution = Contribution.find(params[:id])
  end

  def update
    @story = Story.find(params[:story_id])
    @contribution = Contribution.find(params[:id])

    if @contribution.update(contribution_params)
      redirect_to story_contribution_path()
    else
      render :edit
    end
  end

  def create
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new(contribution_params)
    if @contribution.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:creator, :content, :image)
  end

end
