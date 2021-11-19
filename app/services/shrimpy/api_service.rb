# frozen_string_literal: true

module Shrimpy
  class ApiService
    class << self
      FIXIE = URI.parse(ENV['FIXIE_URL'])
      BASE_URL = ENV['SHRIMPY_BASE_URL']
      API_KEY = ENV['SHRIMPY_API_KEY']
      SECRET_KEY = ENV['SHRIMPY_SECRET_KEY']

      def unlink_exchange_account(uuid, shrimpy_account_id)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}"
        nonce = get_nonce
        headers = generate_header(path, 'DELETE', nonce)
        delete_request(path, headers)
      end

      def link_exchange_account(exchange, uuid, public_key, private_key)
        path = "/v1/users/#{uuid}/accounts"
        nonce = get_nonce
        body = {
          exchange: exchange,
          publicKey: public_key,
          privateKey: private_key
        }.to_json 

        headers = generate_header(path, 'POST', nonce, body)
        post_request(path, headers, body)
      end

      def create_user(name)
        path = '/v1/users'
        nonce = get_nonce
        body = {
          name: name,
        }.to_json

        headers = generate_header(path, 'POST', nonce, body)
        post_request(path, headers, body)
      end

      # JSON.parse(Shrimpy::ApiService.get_users.body)
      def get_users
        path = '/v1/users'
        get_request(path)
      end

      def remove_user(uuid)
        path = "/v1/users/#{uuid}"
        nonce = get_nonce
        headers = generate_header(path, 'DELETE', nonce)
        delete_request(path, headers)
      end

      def get_strategy(uuid, shrimpy_account_id)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}/strategy"
        get_request(path)
      end

      def set_strategy(uuid, shrimpy_account_id, allocations)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}/strategy"
        nonce = get_nonce
        body = {
          isDynamic: false,
          allocations: allocations
        }.to_json

        headers = generate_header(path, 'POST', nonce, body)
        post_request(path, headers, body)
      end

      # JSON.parse(Shrimpy::ApiService.get_balance('355dab82-3053-4d5e-948f-2d44f07b8a2d', '189128').body)
      def get_balance(uuid, shrimpy_account_id)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}/balance"
        get_request(path)
      end

      def get_rebalance_period(uuid, shrimpy_account_id)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}/rebalance_period"
        get_request(path)
      end

      def set_rebalance_period(uuid, shrimpy_account_id, in_hours)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}/rebalance_period"
        nonce = get_nonce
        body = {
          rebalancePeriod: in_hours
        }.to_json

        headers = generate_header(path, 'POST', nonce, body)
        post_request(path, headers, body)
      end

      # JSON.parse(Shrimpy::ApiService.rebalance('355dab82-3053-4d5e-948f-2d44f07b8a2d', '189128').body)
      def rebalance(uuid, shrimpy_account_id)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}/rebalance"
        nonce = get_nonce
        headers = generate_header(path, 'POST', nonce)

        post_request(path, headers)
      end

      def list_accounts(uuid)
        path = "/v1/users/#{uuid}/accounts"
        get_request(path)
      end

      def get_nonce
        Time.now.to_i * 1000;
      end

      def get_request(path)
        nonce = get_nonce
        header = generate_header(path, 'GET', nonce)

        HTTParty.get(BASE_URL + path,
          headers: header,
          http_proxyaddr: FIXIE.host,
          http_proxyport: FIXIE.port,
          http_proxyuser: FIXIE.user,
          http_proxypass: FIXIE.password
        )
      end
      
      def post_request(path, headers, body = '')
        HTTParty.post(BASE_URL + path,
          headers: headers,
          body: body,
          http_proxyaddr: FIXIE.host,
          http_proxyport: FIXIE.port,
          http_proxyuser: FIXIE.user,
          http_proxypass: FIXIE.password
        )
      end

      def delete_request(path, headers)
        HTTParty.delete(BASE_URL + path,
          headers: headers,
          http_proxyaddr: FIXIE.host,
          http_proxyport: FIXIE.port,
          http_proxyuser: FIXIE.user,
          http_proxypass: FIXIE.password
        )
      end

      def generate_header(path, method, nonce, body = '')
        message = path + method + nonce.to_s + body
        secret_key = Base64.decode64(SECRET_KEY)
        signature_b64 = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret_key, message))

        {
          'Content-Type' => 'application/json',
          'DEV-SHRIMPY-API-KEY' => API_KEY,
          'DEV-SHRIMPY-API-NONCE' => nonce.to_s,
          'DEV-SHRIMPY-API-SIGNATURE' => signature_b64
        }
      end

    end
  end
end
