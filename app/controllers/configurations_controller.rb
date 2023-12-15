class ConfigurationsController < ApplicationController
  def ios
    render json: {
      settings: {},
      rules: [
        {
          patterns: [
            "/challenge_users/new$"
          ],
          properties: {
            context: "modal"
          }
        }
      ]
    }
  end

  def android
    render json: {
      "settings": {
        "screenshots_enabled": true
      },
      "rules": [
        {
          "patterns": [
            ".*"
          ],
          "properties": {
            "context": "default",
            "uri": "turbo://fragment/web",
            "fallback_uri": "turbo://fragment/web",
            "pull_to_refresh_enabled": true
          }
        },
        {
          "patterns": %w[^$ ^/$],
          "properties": {
            "uri": "turbo://fragment/web/home",
            "presentation": "replace"
          }
        },
        {
          "patterns": [
            "/challenge_users/new"
          ],
          "properties": {
            "context": "modal",
            "uri": "turbo://fragment/web/modal/sheet",
            "pull_to_refresh_enabled": false
          }
        }
      ]
    }
  end
end