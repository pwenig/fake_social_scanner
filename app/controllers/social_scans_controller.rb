# frozen_string_literal: true

class SocialScansController < ApplicationController
  def index
    render json: {
      twitter: TwitterService.new.scan_tweets,
      facebook: FacebookService.new.scan_statuses
    }
  end
end
