# app/services/notification_service.rb
class NotificationService
  def self.notify_product_change(product)
    begin
      RestClient.post 'http://notification_service/notify_product_update', { product_id: product.id }
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error "Failed to notify product change: #{e.response}"
    rescue StandardError => e
      Rails.logger.error "An error occurred: #{e.message}"
    end
  end
end
