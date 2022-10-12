module Ads
  class UpdateService
    prepend BasicService

    option :data do
      option :lat
      option :lon
    end

    option :id
    option :ad, default: proc { Ad.first(id: @id) }

    def call
      return fail!(I18n.t(:not_found, scope: 'services.ads.update_service')) if @ad.blank?
      @ad.update_fields(@data.to_h.transform_keys(&:to_sym), %i[lat lon])
    end
  end
end
