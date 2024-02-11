class AppConfig < ApplicationRecord
  enum app: { ios: 0, android: 1 }
end
