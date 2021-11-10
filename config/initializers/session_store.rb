Xponential::Application.config.session_store :redis_store,
  servers: ["redis://localhost:6379/0/session"],
  expire_after: 90.minutes,
  key: "_#{Rails.application.class.module_parent.name}_session",
  threadsafe: true,
  secure: false