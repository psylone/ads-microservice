module Ads
  class UpdateService
    prepend BasicService

    param :id
    param :data
    option :ad, default: proc { Ad.first(id: @id) }

    def call
      return fail!(I18n.t(:not_found, scope: 'services.ads.update_service')) if @ad.blank?
      @ad.update_fields(@data, %i[lat lon])
    end
  end
end
