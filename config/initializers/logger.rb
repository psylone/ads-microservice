Application.configure do |app|
  logger = Ougai::Logger.new(
    app.root.concat('/', Settings.logger.path),
    level: Settings.logger.level
  )

  app.set :logger, logger
end

Sequel::Model.db.loggers.push(Application.logger)
