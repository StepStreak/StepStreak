Trestle.resource(:users) do
  menu do
    item :users, icon: "fa fa-star", priority: 1
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id, align: :center
    column :email, align: :center
    column :username, align: :center
    column :created_at, align: :center
    column :last_sync_at, align: :center
    column :device_type, align: :center
    column :app_version, align: :center
    column :locale
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |user|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:user).permit(:name, ...)
  # end
end
