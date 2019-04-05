class ImporterJob < ApplicationJob
  queue_as :default

  def perform(importer_id)
    Importers::Parser.new(importer_id).parser
  end
end
