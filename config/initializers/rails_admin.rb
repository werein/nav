RailsAdmin.config do |config|

  config.model Nav::Navigation do
    navigation_icon 'icon-random'
    field :name
    field :title
    field :subtitle
    field :locale
    field :permalink
    nestable_tree({
      position_field: :position,
      max_depth: 4
    })
    field :parent_id, :enum do
      enum_method do
        :parent_enum
      end
    end
    list do
      field :name
      field :locale
      field :permalink
    end
  end

end if defined? RailsAdmin