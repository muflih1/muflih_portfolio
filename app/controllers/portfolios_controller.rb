class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def new
    @portfolio = Portfolio.new
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    if @portfolio.save
      flash[:notice] = "Portfolio was created successfully"
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
      flash[:notice] = "Portfolio was updated successfully"
      redirect_to portfolios_path
    else
      render :edit
    end
  end
end
