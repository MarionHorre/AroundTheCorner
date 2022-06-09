namespace :scrapping do
  desc "Scrapping la lilloise and create Houses"
  task lilloise: :environment do
    UpdateScrappingJob.perform_later
  end
end
