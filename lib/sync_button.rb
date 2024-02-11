class SyncButton
  def self.coordinates(device_type)
    case device_type.to_sym
    when :ios
      { x: Constants::SYNC_BUTTON_IOS[:x], y: Constants::SYNC_BUTTON_IOS[:y] }
    when :android
      { x: Constants::SYNC_BUTTON_ANDROID[:x], y: Constants::SYNC_BUTTON_ANDROID[:y] }
    else
      { x: 0, y: 0 }
    end
  end
end