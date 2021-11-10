Xponential::Application.config.session_store :redis_store,
  servers: ["#{ENV['REDIS_URL']}/0/session"],
  expire_after: 90.minutes,
  key: "_#{Rails.application.class.module_parent.name}_session",
  threadsafe: true,
  secure: false