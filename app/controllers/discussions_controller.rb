class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, except: %i[index new create]

  def index
    @discussions = Discussion.all
  end

  def show; end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)

    respond_to do |f|
      if @discussion.save
        f.html { redirect_to @discussion, notice: 'Discussion created successfully.' }
      else
        f.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def edit

  end

  def update
    respond_to do |f|
      if @discussion.update(discussion_params)
        f.html { redirect_to  @discussion, notice: 'Discussion updated.' }
      else
        f.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discussion.destroy

    respond_to do |f|
      f.html { redirect_to discussions_path, notice: 'Discussion deleted.' }
    end
  end


  private

  def discussion_params
    params.require(:discussion).permit(:name, :pinned, :closed)
  end

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end
end