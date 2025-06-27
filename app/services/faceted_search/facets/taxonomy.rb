module FacetedSearch
  class Facets::Taxonomy < Facets::DefaultList
    attr_reader :taxonomy

    def initialize(name, params, facets, options)
      @name = name
      @params = params
      @facets = facets
      @options = options
      @taxonomy = options[:taxonomy]
    end

    def title
      taxonomy.to_s
    end

    def values
      taxonomy.categories.ordered
    end

    def find_by
      :slug
    end

    def add_scope(scope)
      return scope if params_array.blank?
      scope.joins(:categories).where(categories: { id: options_selected })
    end

    def options_selected
      params_array.map { |slug| Category.find_by(slug: slug) }
    end
  end
end