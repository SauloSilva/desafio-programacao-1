require 'rails_helper'

RSpec.describe ImporterJob do
  it 'call Importers::Parser' do
    parser_instance = double
    allow(Importers::Parser).to receive(:new).with(1).and_return(parser_instance)
    allow(parser_instance).to receive(:parser)

    described_class.new.perform(1)

    expect(Importers::Parser).to have_received(:new)
    expect(parser_instance).to have_received(:parser)
  end

  it 'matches with enqueued job' do
    ActiveJob::Base.queue_adapter = :test

    expect {
      ImporterJob.perform_later(1)
    }.to have_enqueued_job.with(1)
  end
end
