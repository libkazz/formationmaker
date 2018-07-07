class TeamsController < ApplicationController
  before_action :set_team, only: %i(show edit update)
  before_action :authorize!, only: %i(edit update)

  helper_method :owner?

  def index
    @teams = Team.published.all
  end

  def show; end

  def new
    @team = Team.new(published: true)
  end

  def create
    @team = Team.new(team_params.merge(owner_key: @auth_key))

    if @team.save
      (1..11).each do |n|
        @team.players.create!(number: n)
      end

      redirect_to team_path(@team), notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @team.update(team_params)
      respond_to do |format|
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_team
    @team = Team.published.find_by!(key: params[:id])
  end

  def team_params
    params
      .require(:team)
      .permit(
        :name,
        :published,
        :formation_id,
        :image_cache,
        players_attributes: %i(name number position introduction)
      )
  end

  def owner?
    @team && @team.owner_key == @auth_key
  end

  def authorize!
    raise 'Cannot authorize' unless owner?
  end
end
