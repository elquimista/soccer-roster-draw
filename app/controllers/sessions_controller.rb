# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    redirect_to draw_path if user_signed_in?
  end

  def create
    session.clear
    User.all.each do |user|
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        break
      end
    end
    if session[:user_id].present?
      redirect_to draw_path
    else
      flash.now[:error] = ';( &nbsp;Wrong password!'
      render action: :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
