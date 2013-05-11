class LogsController < ApplicationController

  def mark_read
   result =  Log.set_message_isread params[:id] if params[:id]
   result ? (render :json => true ): (render :json => false)
  end
end
