# == Schema Information
#
# Table name: work_orders
#
#  id                      :integer          not null, primary key
#  description             :string(255)
#  date                    :date
#  delivery_date           :date
#  order_number            :integer
#  distance_right_sph      :decimal(10, 2)   default(0.0)
#  distance_right_cyl      :decimal(10, 2)   default(0.0)
#  distance_right_axis     :integer          default(0)
#  distance_left_sph       :decimal(10, 2)   default(0.0)
#  distance_left_cyl       :decimal(10, 2)   default(0.0)
#  distance_left_axis      :integer          default(0)
#  distance_ipd            :decimal(10, 2)   default(0.0)
#  distance_lens_color     :string(255)
#  distance_frame          :string(255)
#  distance_lens_type      :string(255)
#  near_right_sph          :decimal(10, 2)   default(0.0)
#  near_right_cyl          :decimal(10, 2)   default(0.0)
#  near_right_axis         :integer          default(0)
#  near_left_sph           :decimal(10, 2)   default(0.0)
#  near_left_cyl           :decimal(10, 2)   default(0.0)
#  near_left_axis          :integer          default(0)
#  near_ipd                :decimal(10, 2)   default(0.0)
#  near_lens_color         :string(255)
#  near_frame              :string(255)
#  near_lens_type          :string(255)
#  intermediate_right_sph  :decimal(10, 2)   default(0.0)
#  intermediate_right_cyl  :decimal(10, 2)   default(0.0)
#  intermediate_right_axis :integer          default(0)
#  intermediate_left_sph   :decimal(10, 2)   default(0.0)
#  intermediate_left_cyl   :decimal(10, 2)   default(0.0)
#  intermediate_left_axis  :integer          default(0)
#  intermediate_ipd        :decimal(10, 2)   default(0.0)
#  intermediate_lens_color :string(255)
#  intermediate_frame      :string(255)
#  intermediate_lens_type  :string(255)
#  bifocal                 :string(255)
#  height                  :decimal(10, 2)   default(0.0)
#  comments                :string(255)
#  invoice                 :decimal(10, 2)   default(0.0)
#  payment_on_account      :decimal(10, 2)   default(0.0)
#  balance_due             :decimal(10, 2)   default(0.0)
#  doctor_name             :string(255)
#  client_id               :integer
#  created_at              :datetime
#  updated_at              :datetime
#  prescription_date       :date
#

# -*- encoding : utf-8 -*-
class WorkOrder < ActiveRecord::Base
  attr_accessible :description, :date, :delivery_date, :distance_right_sph, :distance_right_cyl, :distance_right_axis, :distance_left_sph, :distance_left_cyl, :distance_left_axis, :distance_lens_color, :distance_frame, :distance_lens_type, :distance_ipd, :intermediate_right_sph, :intermediate_right_cyl, :intermediate_right_axis, :intermediate_left_sph, :intermediate_left_cyl, :intermediate_left_axis, :intermediate_lens_color, :intermediate_frame, :intermediate_lens_type, :intermediate_ipd, :near_right_sph, :near_right_cyl, :near_right_axis, :near_left_sph, :near_left_cyl, :near_left_axis, :near_lens_color, :near_frame, :near_lens_type, :near_ipd, :bifocal, :height, :comments, :doctor_name, :prescription_date, :invoice, :payment_on_account
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :client
  before_save :compute_balance_due
  before_create :compute_order_number

  validates_presence_of :client

  def compute_balance_due
    self.balance_due = self.invoice.to_i - self.payment_on_account.to_i
  end

  def compute_order_number
    old_number = WorkOrder.maximum(:order_number) || 0
    self.number = old_number + 1
  end

  def self.search(search, page)
    paginate :page => page, :include => :client, :conditions => ['description LIKE ? OR order_number LIKE ? OR clients.name LIKE ? OR clients.address LIKE ? OR clients.phone_number LIKE ? OR clients.city LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"]
  end
end


