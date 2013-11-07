# -*- encoding : utf-8 -*-
# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  inflect.plural(/([^aeiou])$/i, '\1es')
  inflect.singular(/(.*)es$/i, '\1')
  inflect.plural(/(.*)z$/i, '\1ces')
  inflect.singular(/(.*)ces$/i, '\1z')

  inflexiones = [
    ['cliente', 'clientes'],
    ['orden_trabajo', 'ordenes_trabajo'],
  ]

  for inflexion in inflexiones do
    inflect.irregular inflexion[0], inflexion[1]
    inflect.irregular inflexion[0].camelize, inflexion[1].camelize
  end
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end

