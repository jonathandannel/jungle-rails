class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :send_receipt

  def self.find_order_with_items(id)
    self.includes(line_items: [:product]).find(id)
  end

  def send_receipt
    OrdersMailer.receipt_email(self.id).deliver_later
  end
end
