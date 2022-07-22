# frozen_string_literal: true

class ExoplanetsController < ApplicationController
  def reload
    ExoplanetsDb.instance.reload
    redirect_to root_path
  end
end
