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

    # Only show categories that have matching results with the current params,
    # plus the currently selected ones (mirrors DefaultList#values).
    def values
      @values ||= begin
        results = (params_array.blank? ? facets.results : facets.results_except(param_name)).reorder(nil)
        base = taxonomy.categories.ordered.joins(:problems)
        base.where(problems: { id: results })
            .or(base.where(slug: params_array))
            .distinct
      end
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