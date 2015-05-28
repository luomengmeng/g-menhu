class Frontend::ColumnsController < ApplicationController

  def show
    id = params[:id]
    @column = Column.find(id)
  end


end
