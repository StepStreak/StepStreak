module TurboNativeHelper
  def page_title
    if turbo_native_app?
      content_for(:turbo_native_title) || content_for(:title) || 'StepStreak'
    else
      content_for(:title) || 'StepStreak'
    end
  end

  def platform_identifier
    "turbo-native" if turbo_native_app?
  end

  def new_update_available?
    if turbo_native_app?
      latest_app_version = case device_type
                           when 'ios'
                             AppConfig.ios.last.version.to_f
                           when 'android'
                              AppConfig.android.last.version.to_f
                           end

      latest_app_version > app_version
    end
  end
end
