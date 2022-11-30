class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
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
end
