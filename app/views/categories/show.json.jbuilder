json.problems @category.problems.ordered do |problem|
  json.title problem.title
  json.title problem.description
  json.year problem.created_at.year
  json.categories Taxonomy.all.ordered do |taxonomy|
    json.title taxonomy.title
    json.slug taxonomy.slug
    json.categories problem.categories.where(taxonomy: taxonomy) do |category|
      json.title category.title
      json.slug category.slug
    end
  end
end