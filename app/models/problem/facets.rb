class Problem::Facets < FacetedSearch::Facets
  def initialize(params)
    super
    @model = Problem.all
    filter_with_text :title, {
      title: Problem.human_attribute_name(:title),
    }
    # filter_with_list :step, {}
    ::Taxonomy.ordered.each do |taxonomy|
      add_facet ::FacetedSearch::Facets::Taxonomy,
                taxonomy.slug, 
                { taxonomy: taxonomy }
    end
  end
end
