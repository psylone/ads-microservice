class AdRoutes < Application
  helpers PaginationLinks
  helpers Auth

  namespace '/v1' do
    get do
      page = params[:page].presence || 1
      ads = Ad.reverse_order(:updated_at)
      ads = ads.paginate(page.to_i, Settings.pagination.page_size)
      serializer = AdSerializer.new(ads.all, links: pagination_links(ads))

      json serializer.serializable_hash
    end

    post '/update_coordinates' do
      params = JSON(request.body.read)

      result = Ads::UpdateService.call(
        id: params['id'],
        data: params['coordinates']
      )

      if result.success?
        serializer = AdSerializer.new(result.ad)

        status 201
        json serializer.serializable_hash
      else
        status 422
        error_response result.ad
      end
    end

    post do
      ad_params = validate_with!(AdParamsContract)

      client = AuthService::RpcClient.fetch
      client.auth(matched_token)
      user_id = client.user_id

      return status 403 if user_id.nil?

      result = Ads::CreateService.call(
        ad: ad_params[:ad],
        user_id: user_id
      )

      if result.success?
        serializer = AdSerializer.new(result.ad)

        status 201
        json serializer.serializable_hash
      else
        status 422
        error_response result.ad
      end
    end
  end
end
