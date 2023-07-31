class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = Session.all
    render json: @sessions
  end

  def show
    render json: @session
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      render json: @session, status: :created
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
    head :no_content
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:start, :end, :link, :course_id)
  end
end
