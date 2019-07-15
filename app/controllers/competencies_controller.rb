class CompetenciesController < ApplicationController
  before_action :find_competency, only: [:show, :edit, :update, :destroy]

  def index
    @competencies = Competency.all
  end

  def filter
    # raise
    @competencies = Competency.where("name LIKE '%#{params[:name]}%'")
    # ("name LIKE '#{params[:name]}'")
  end


  def show
    @doses = Dose.where(competency_id: params[:id])
  end

  # def new
  #   @competency = Competency.new
  # end

  # def create
  #   @competency = Competency.new(competency_params)
  #   if @competency.save
  #     redirect_to competency_path(@competency)
  #   else
  #     render :new
  #   end
  #   # @competency.save
  #   # redirect_to competencies_path(@competency)
  # end

  # def edit
  # end

  # def update
  #   @competency.update(competency_params)
  #   if @competency.update(competency_params)
  #     redirect_to competency_path(@competency)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @competency.delete
  #   redirect_to competencies_path
  # end

  private

  def competency_params
    params.require(:competency).permit(:name)
  end

  def find_competency
    @competency = Competency.find(params[:id])
  end


end

