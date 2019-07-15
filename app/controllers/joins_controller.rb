class JoinsController < ApplicationController
  def new
    @join = Join.new
  end

  def create
    @join = Join.new(join_params)
    if @join.save
      redirect_to join_path(@join)
    else
      render :new
    end
    # @join.save
    # redirect_to joins_path(@join)
  end

  def edit
  end

  def update
    @join.update(join_params)
    if @join.update(join_params)
      redirect_to join_path(@join)
    else
      render :edit
    end
  end

  def destroy
    @join.delete
    redirect_to joins_path
  end

  private

  def join_params
    params.require(:join).permit(:name)
  end

  def find_join
    @join = Join.find(params[:id])
  end
end
