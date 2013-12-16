module Nav
  class Navigation < ActiveRecord::Base
    extend Enumerize
    validates :name, presence: true, uniqueness: { scope: :locale }, if: :root?
    validates :title, :permalink, presence: true, unless: :root?
    validates :locale, presence: :true
    has_ancestry

    scope :without, ->(o) { where.not(id: o.id) }
    
    enumerize :locale, in: I18n.available_locales

    def parent_enum
      Navigation.without(self).map { |c| [ "#{c.title? ? c.title : c.name} - #{c.locale}", c.id ] }
    end
  end
end