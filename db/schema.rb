# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150922133455) do

  create_table "clients", force: true do |t|
    t.string   "nombre"
    t.string   "domicilio"
    t.string   "telefono"
    t.string   "localidad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "apellidos"
    t.string   "correo_electronico"
    t.string   "observaciones"
  end

  create_table "work_orders", force: true do |t|
    t.string   "descripcion"
    t.date     "fecha"
    t.date     "fecha_entrega"
    t.integer  "numero"
    t.decimal  "lejos_od_esferico",                 precision: 10, scale: 2, default: 0.0
    t.decimal  "lejos_od_cilindrico",               precision: 10, scale: 2, default: 0.0
    t.integer  "lejos_od_grados",                                            default: 0
    t.decimal  "lejos_oi_esferico",                 precision: 10, scale: 2, default: 0.0
    t.decimal  "lejos_oi_cilindrico",               precision: 10, scale: 2, default: 0.0
    t.integer  "lejos_oi_grados",                                            default: 0
    t.decimal  "lejos_distancia_interpupilar",      precision: 10, scale: 2, default: 0.0
    t.string   "lejos_color"
    t.string   "lejos_armazon"
    t.string   "lejos_tipo_lente"
    t.decimal  "cerca_od_esferico",                 precision: 10, scale: 2, default: 0.0
    t.decimal  "cerca_od_cilindrico",               precision: 10, scale: 2, default: 0.0
    t.integer  "cerca_od_grados",                                            default: 0
    t.decimal  "cerca_oi_esferico",                 precision: 10, scale: 2, default: 0.0
    t.decimal  "cerca_oi_cilindrico",               precision: 10, scale: 2, default: 0.0
    t.integer  "cerca_oi_grados",                                            default: 0
    t.decimal  "cerca_distancia_interpupilar",      precision: 10, scale: 2, default: 0.0
    t.string   "cerca_color"
    t.string   "cerca_armazon"
    t.string   "cerca_tipo_lente"
    t.decimal  "intermedio_od_esferico",            precision: 10, scale: 2, default: 0.0
    t.decimal  "intermedio_od_cilindrico",          precision: 10, scale: 2, default: 0.0
    t.integer  "intermedio_od_grados",                                       default: 0
    t.decimal  "intermedio_oi_esferico",            precision: 10, scale: 2, default: 0.0
    t.decimal  "intermedio_oi_cilindrico",          precision: 10, scale: 2, default: 0.0
    t.integer  "intermedio_oi_grados",                                       default: 0
    t.decimal  "intermedio_distancia_interpupilar", precision: 10, scale: 2, default: 0.0
    t.string   "intermedio_color"
    t.string   "intermedio_armazon"
    t.string   "intermedio_tipo_lente"
    t.string   "bifocal"
    t.decimal  "altura",                            precision: 10, scale: 2, default: 0.0
    t.string   "observaciones"
    t.decimal  "total",                             precision: 10, scale: 2, default: 0.0
    t.decimal  "senya",                             precision: 10, scale: 2, default: 0.0
    t.decimal  "saldo",                             precision: 10, scale: 2, default: 0.0
    t.string   "nombre_doctor"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fecha_receta"
  end

end
