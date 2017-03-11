class CommandsController < ApplicationController

  def query1
    @title = '上海每月成交记录'
    @data = Command::Command1.new(params[:page] || 1)
    render :query
  end

  def query1area
    area = params[:area]
    @title = area+' 区(板块)每月成交记录'
    @data = Command::Command1Area.new(params[:page] || 1).area(area)
    render :query
  end

  def query2
    @title = '每日调价趋势'
    @data = Command::Command2.new(params[:page] || 1)
    render :query
  end

  def query2area
    area = params[:area]
    @title = area+' 每日调价趋势'
    @data = Command::Command2Area.new(params[:page] || 1).area(area)
    render :query
  end

end
