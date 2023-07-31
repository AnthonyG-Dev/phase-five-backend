class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :update, :destroy]

  def index
    @announcements = Announcement.all
    render json: @announcements
  end

  def show
    render json: @announcement
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      render json: @announcement, status: :created
    else
      render json: @announcement.errors, status: :unprocessable_entity
    end
  end

  def update
    if @announcement.update(announcement_params)
      render json: @announcement
    else
      render json: @announcement.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @announcement.destroy
    head :no_content
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:content, :course_id)
  end
end
