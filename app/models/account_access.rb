class AccountAccess < Lipsiadmin::AccessControl::Base 

  roles_for :administrator do |role, current_account|
    # Shared Permission
    role.allow_all_actions "/backend"
    role.allow_all_actions "/backend/base"
    
    # Remember that it will try to translate the menu in your current
    # locale
    # 
    #   # Look for: I18n.t("backend.menus.account") in /config/locales/backend/yourlocale.yml
    #   project_module :account
    #   # Look for: I18n.t("backend.menus.list") in /config/locales/backend/yourlocale.yml
    #   project.menu :list
    # 
    # It not necessary have a translation you can provide a classic strings like:
    # 
    #   role.project_module "My Menu Name"
    # 
    # <tt>current_account</tt> is an instance of current logged account
    # 
    
    
    # Please don't remove this comment! It's used for auto adding project modules
     

    role.project_module "Cadastros Auxiliares" do |project|
      project.menu :tags,   "/backend/tags.js" do |submenu|
        submenu.add :new, "/backend/tags/new"
      end
	  project.menu :categorianoticias,   "/backend/categorianoticias.js" do |submenu|
        submenu.add :new, "/backend/categorianoticias/new"
      end
	  project.menu :categoriaarquivos,   "/backend/categoriaarquivos.js" do |submenu|
        submenu.add :new, "/backend/categoriaarquivos/new"
      end
	  project.menu :cargos,   "/backend/cargos.js" do |submenu|
        submenu.add :new, "/backend/cargos/new"
      end
	  project.menu :escolaridades,   "/backend/escolaridades.js" do |submenu|
        submenu.add :new, "/backend/escolaridades/new"
      end
	  project.menu :disciplinas,   "/backend/disciplinas.js" do |submenu|
        submenu.add :new, "/backend/disciplinas/new"
      end
	  project.menu :cursos,   "/backend/cursos.js" do |submenu|
        submenu.add :new, "/backend/cursos/new"
      end
    end
	role.project_module "Cadastros de Pessoas" do |project|
      project.menu :discentes,   "/backend/discentes.js" do |submenu|
        submenu.add :new, "/backend/discentes/new"
      end
	  project.menu :docentes,   "/backend/docentes.js" do |submenu|
        submenu.add :new, "/backend/docentes/new"
      end
	  project.menu :funcionarios,   "/backend/funcionarios.js" do |submenu|
        submenu.add :new, "/backend/funcionarios/new"
      end
    end 
    role.project_module :noticias do |project|
      project.menu :list,   "/backend/noticias.js" do |submenu|
        submenu.add :new, "/backend/noticias/new"
      end
    end 
    role.project_module :eventos do |project|
      project.menu :list,   "/backend/eventos.js" do |submenu|
        submenu.add :new, "/backend/eventos/new"
      end
    end 
	role.project_module :downloads do |project|
      project.menu :list,   "/backend/downloads.js" do |submenu|
        submenu.add :new, "/backend/downloads/new"
      end
    end
   	role.project_module :inscricaos do |project|
      project.menu :list,   "/backend/inscricaos.js" do |submenu|
        submenu.add :new, "/backend/inscricaos/new"
      end
    end
	role.project_module :account do |project|
      project.menu :list,   "/backend/accounts.js" do |submenu|
        submenu.add :new, "/backend/accounts/new"
      end
    end
  end
  roles_for :discente do |role, current_account|
    role.allow_all_actions "/backend"
    role.allow_all_actions "/backend/base"
     role.project_module "Menu do Aluno" do |project|
      project.menu :inscricaos,   "/backend/inscricaos.js" do |submenu|
        submenu.add :new, "/backend/inscricaos/new"
      end
     end      
   end	 
end


