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
    @competencies = Competency.where(domain_id: params[:id])
  end

  private

  def domain_params
    params.require(:domain).permit(:name)
  end

  def find_domain
    @domain = Domain.find(params[:id])
  end
end
