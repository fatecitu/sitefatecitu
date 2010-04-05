# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100323145545) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "salt"
    t.string   "crypted_password"
    t.string   "role"
    t.string   "modules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargos", :force => true do |t|
    t.string   "descricao",  :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoriaarquivos", :force => true do |t|
    t.string   "descricao",  :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorianoticias", :force => true do |t|
    t.string   "descricao",  :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos", :force => true do |t|
    t.string   "nome",           :limit => 100, :null => false
    t.text     "visaogeral"
    t.string   "duracao"
    t.text     "carreira"
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discentes", :force => true do |t|
    t.string   "ra"
    t.integer  "curso_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplinas", :force => true do |t|
    t.string   "nome"
    t.text     "ementa"
    t.text     "objetivo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplinas_docentes", :force => true do |t|
    t.integer  "disciplina_id"
    t.integer  "docente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "docentes", :force => true do |t|
    t.string   "nome"
    t.integer  "escolaridade_id"
    t.string   "email"
    t.string   "lattes"
    t.string   "twitter"
    t.string   "blog"
    t.string   "msn"
    t.boolean  "ativo"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downloads", :force => true do |t|
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.integer  "categoriaarquivo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "escolaridades", :force => true do |t|
    t.string   "descricao",  :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventos", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.date     "datainicial"
    t.date     "datafinal"
    t.string   "local"
    t.integer  "inscritos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "nome",            :limit => 100, :null => false
    t.integer  "cargo_id"
    t.integer  "escolaridade_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.string   "textocurto"
    t.text     "textolongo"
    t.string   "fonte"
    t.date     "datainicio"
    t.date     "datafim"
    t.string   "vejamais"
    t.integer  "categorianoticia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "descricao",  :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_noticias", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "noticia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
