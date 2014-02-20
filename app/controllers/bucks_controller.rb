class BucksController < ApplicationController
  before_action :set_buck, only: [:show, :edit, :update, :destroy]

  def index
    @bucks = Buck.all
  end

  def show
  end

  def new
    @buck = Buck.new
  end

  def edit
  end

  def create
    @buck = Buck.new(buck_params)

    if @buck.save
      redirect_to @buck, notice: 'Buck was successfully created.'
    else
      flash[:error] = 'Buck was not successfully created.'
      render action: 'new'
    end
  end

  def update
    if @buck.update(buck_params)
      redirect_to @buck, notice: 'Buck was successfully updated.'
    else
      flash[:error] = 'Buck was not successfully updated.'
      render action: 'edit'
    end
  end

  def destroy
    @buck.destroy
    redirect_to bucks_url, notice: 'Buck was successfully deleted.'
  end

  private
    def set_buck
      @buck = Buck.find(params[:id])
    end

    def buck_params
      params.require(:buck).permit(:description, :status, :value, :goes_to)
    end
end
