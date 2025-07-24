class Problem::Facets < FacetedSearch::Facets
  def initialize(params)
    super
    @model = Problem.normal_and_important
    filter_with_text :title, {
      title: Problem.human_attribute_name(:title),
    }
    filter_with_list :step, {
      title: Problem.human_attribute_name(:step),
      source: Problem::Step.all
    }
    ::Taxonomy.ordered.each do |taxonomy|
      add_facet ::FacetedSearch::Facets::Taxonomy,
                taxonomy.slug, 
                { taxonomy: taxonomy }
    end
  end
end
