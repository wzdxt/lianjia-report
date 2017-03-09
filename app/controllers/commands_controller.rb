class CommandsController < ApplicationController
  def query1
    @title = '上海每月成交记录'
    @data = Command::Command1.new(params[:page] || 1)
    render :query
  end

  def query2
    qu = params[:qu]
    @title = qu+'区每月成交记录'
    @data = Command::Command2.new(params[:page] || 1).qu(qu)
    render :query
  end

  def query3
    bankuai = params[:bankuai]
    @title = bankuai+'板块每月成交记录'
    @data = Command::Command3.new(params[:page] || 1).bankuai(bankuai)
    render :query
  end

end
