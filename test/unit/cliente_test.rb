# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../test_helper'

class ClienteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end


# == Schema Information
#
# Table name: clientes
#
#  id                 :integer(4)      not null, primary key
#  nombre             :string(255)
#  domicilio          :string(255)
#  telefono           :string(255)
#  localidad          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  apellidos          :string(255)
#  correo_electronico :string(255)
#

