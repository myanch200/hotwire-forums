class DiscussionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)

    respond_to do |f|
      if @discussion.save
        f.html { redirect_to discussions_path, notice: 'Discussion created successfully.' }
      else
        f.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  private

  def discussion_params
    params.require(:discussion).permit(:name, :pinned, :closed)
  end
end