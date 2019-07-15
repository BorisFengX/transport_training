class DomainsController < ApplicationController

  before_action :find_domain, only: [:show, :edit, :update, :destroy]

  def index
    @domains = Domain.all
  end

  # def filter
  #   # raise
  #   @domains = Domain.where("name LIKE '%#{params[:name]}%'")
  #   # ("name LIKE '#{params[:name]}'")
  # end


  def show
    if params[:id]
      @competencies = Competency.where(domain_id: params[:id])
    else
      @competencies = Domain.all.first.competencies
    end
  end

  private

  def domain_params
    params.require(:domain).permit(:name)
  end

  def find_domain
    @domain = Domain.find(params[:id])
  end
end
