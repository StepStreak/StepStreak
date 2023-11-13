module ApplicationHelper
  def turbo_app_agent
    turbo_native_app? ? 'turbo_native' : 'turbo_web'
  end
end
