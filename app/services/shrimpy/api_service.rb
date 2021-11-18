# frozen_string_literal: true

module Shrimpy
  class ApiService

    class << self
      BASE_URL = ENV['SHRIMPY_BASE_URL']
      API_KEY = ENV['SHRIMPY_API_KEY']
      SECRET_KEY = ENV['SHRIMPY_SECRET_KEY']

      def unlink_exchange_account(uuid, shrimpy_account_id)
        request_path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}"
        nonce = get_nonce
        header = generate_header(request_path, 'DELETE', nonce)
        HTTParty.delete(BASE_URL + request_path, headers: header)     
      end

      def link_exchange_account(exchange, uuid, public_key, private_key)
        request_path = "/v1/users/#{uuid}/accounts"
        nonce = get_nonce
        body = {
          exchange: exchange,
          publicKey: public_key,
          privateKey: private_key
        }.to_json 

        header = generate_header(request_path, 'POST', nonce, body)
        HTTParty.post(BASE_URL + request_path, headers: header, body: body)
      end

      def create_user(name)
        request_path = '/v1/users'
        nonce = get_nonce
        body = {
          name: name,
        }.to_json

        header = generate_header(request_path, 'POST', nonce, body)

        HTTParty.post(BASE_URL + request_path, headers: header, body: body)
      end

      def get_users
        path = '/v1/users'
        get_request(path)
      end

      def remove_user(uuid)
        request_path = "/v1/users/#{uuid}"
        nonce = get_nonce
        header = generate_header(request_path, 'DELETE', nonce)
        HTTParty.delete(BASE_URL + request_path, headers: header)
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

        header = generate_header(path, 'POST', nonce, body)
        HTTParty.post(BASE_URL + path, headers: header, body: body)
      end

      def get_balance(uuid, shrimpy_account_id)
        path = "/v1/users/#{uuid}/accounts/#{shrimpy_account_id}/balance"
        get_request(path)
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
        HTTParty.get(BASE_URL + path, headers: header)
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
