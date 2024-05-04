class ConfigurationsController < ApplicationController
  def ios
    render json: {
      settings: {},
      rules: [
        {
          patterns: %w[/challenge_users/new$ /sessions/new$ /users/new$ /privacy /data /teams /teams/new /tournament_participants/new],
          properties: {
            context: "modal"
          }
        },
        {
          "patterns": %w[/welcome],
          "properties": {
            "presentation": "replace"
          }
        },
        {
          "patterns": %w[/permissions],
          "properties": {
            "view_controller": "permissions",
            "presentation": "replace"
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
          "patterns": %w[/welcome],
          "properties": {
            "uri": "turbo://fragment/web/home",
            "presentation": "replace"
          }
        },
        {
          "patterns": %w[/permissions],
          "properties": {
            "uri": "turbo://fragment/web/permissions",
            "presentation": "replace"
          }
        },
        {
          "patterns": %w[/challenge_users/new /sessions/new /users/new /privacy /data /teams /teams/new],
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