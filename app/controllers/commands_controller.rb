class CommandsController < ApplicationController
  def query1
    qu = params[:qu]
    @title = qu+'区每月成交记录'
    @data = Command::Command1.new(params[:page] || 1).qu(qu)
    render :query
  end
end
