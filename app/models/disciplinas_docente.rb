class DisciplinasDocente < ActiveRecord::Base
  belongs_to :disciplina
  belongs_to :docente
end
