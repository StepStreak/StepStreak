class ConfigurationsController < ApplicationController
  skip_before_action :authenticate_user!

  def ios
    render json: {
      settings: {},
      rules: [
        {
          patterns: %w[/new$ /edit$],
          properties: {
            context: "modal"
          }
        }
      ]
    }
  end
end
