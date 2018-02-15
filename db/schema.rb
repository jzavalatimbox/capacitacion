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

ActiveRecord::Schema.define(version: 20180214012547) do

  create_table "empleados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "rfc"
    t.string "puesto"
    t.integer "sucursal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre_completo"
    t.string "email"
    t.string "rfc"
    t.string "nombre_empresa"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sucursals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "calle"
    t.string "colonia"
    t.integer "numero_exterior"
    t.integer "numero_interior"
    t.integer "codigo_postal"
    t.string "ciudad"
    t.string "pais"
    t.integer "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
