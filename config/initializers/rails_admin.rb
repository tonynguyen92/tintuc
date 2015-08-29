RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model 'Post' do
    list do
      field :title do
      end
      field :desc do
      end
      field :created_at do
      end
    end
    edit do
        field :title do
      end
       field :desc do
      end
       field :content do
      end
      field :tobao do

      end
    end
  end
  config.model 'User' do
    visible true
    # configure :sale_reports, :has_many_association
    list do
      field :email do
        column_width 200
      end
      field :sign_in_count do
        column_width 200
      end
      field :last_sign_in_at do
        column_width 200
      end
      field :last_sign_in_ip do
        column_width 200
      end
      #field :sale
    end
    show do
    end
    edit do
      field :email do
       column_width 200
     end
   end
 end
end
