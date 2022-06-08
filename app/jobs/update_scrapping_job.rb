class UpdateScrappingJob < ApplicationJob
  queue_as :default

  def scrapping_updade(url)
    # on scrapp l'url de la lilloise
    # on vérifie selon des critères que bien fonctionner
    # SI fonctionne on houses.destroy_all et on crée les nouvelles maisons
    # ELSE on garde l'ancienne version
  end

end
