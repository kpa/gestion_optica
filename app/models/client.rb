# == Schema Information
#
# Table name: clients
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :string(255)
#  phone_number :string(255)
#  city         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  surname      :string(255)
#  email        :string(255)
#  comments     :string(255)
#

# -*- encoding : utf-8 -*-
class Client < ActiveRecord::Base
  attr_accessible :name, :surname, :address, :phone_number, :email, :city, :comments
  cattr_reader :per_page
  @@per_page = 10
  validates_presence_of :name, :surname
  validates_uniqueness_of :name, :scope => :surname
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true

  has_many :work_orders

  def self.search(search, page)
    where(
        'name LIKE ?
        OR surname LIKE ?
        OR CONCAT(name, \' \', surname) LIKE ?
        OR CONCAT(surname, \', \', name) LIKE ?
        OR address LIKE ?
        OR phone_number LIKE ?
        OR email LIKE ?
        OR city LIKE ?',
        "%#{search}%", "%#{search}%", "%#{search}%",
        "%#{search}%", "%#{search}%", "%#{search}%",
        "%#{search}%", "%#{search}%"
    ).paginate(
        :page => page
    )
  end

  def full_name
    "#{name} #{surname}"
  end

end

