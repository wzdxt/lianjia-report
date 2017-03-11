class CommandsController < ApplicationController

  def query0
    qu = params[:qu]
    @title = qu+' 区小区列表'
    @data = Xiaoqu.select(:qu, :bankuai, :name).where(:qu => qu).order('fav' => 'desc').order('qu').order('bankuai').order('name').page(params[:page]).per(200)
    render :query_model
  end

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
    @title = '全市每日调价趋势'
    @data = Command::Command2.new(params[:page] || 1)
    render :query
  end

  def query2area
    area = params[:area]
    @title = area+' 每日调价趋势'
    @data = Command::Command2Area.new(params[:page] || 1).area(area)
    render :query
  end

  def query3area
    area = params[:area]
    @title = area+' 调价历史'
    @data = Command::Command3Area.new(params[:page] || 1).area(area)
    render :query
  end


end
