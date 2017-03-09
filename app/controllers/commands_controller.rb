class CommandsController < ApplicationController
  def query
    qu = params[:qu]
    @titles = %w(a b c)
    @records = [qu, 2, 3]
    @data = Command::Command1.new(params[:page] || 1)
  end
end
