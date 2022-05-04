class SessionsController < ApplicationController

    def new
      #No code needed here, just a placeholder for the 'Get' action
    end

    def create

    end

    def destroy
      session.clear
      @_current_user = nil
      redirect_to '/'
    end

    end
