module WithTree
  extend ActiveSupport::Concern

  included do
    belongs_to :parent,
               class_name: name,
               inverse_of: :children,
               optional: true
    has_many :children,
             -> { ordered },
             class_name: name,
             foreign_key: :parent_id,
             inverse_of: :parent,
             dependent: :destroy

    # Les positions n'étant uniques que parmi les enfants d'un même parent, ce tri n'a de sens que sur une fratrie
    # Utiliser tree pour l'arbre entier.
    scope :ordered, -> { order(:position) }
    scope :root, -> { where(parent_id: nil) }

    validates :position, presence: true, uniqueness: { scope: :parent_id }
    validate :parent_id_cannot_be_self_or_a_descendant

    before_validation :set_position
  end

  class_methods do
    # Tous les éléments, chaque parent suivi de ses enfants, sous forme de paires [élément, profondeur]
    # [[A, 0], [A.1, 1], [A.2, 1], [B, 0]]
    def tree
      flatten_tree order(:position).group_by(&:parent_id)
    end

    private

    def flatten_tree(elements_by_parent_id, parent_id = nil, depth = 0)
      pairs = []
      elements = elements_by_parent_id[parent_id] || []
      elements.each do |element|
        pairs << [element, depth]
        pairs += flatten_tree(elements_by_parent_id, element.id, depth + 1)
      end
      pairs
    end
  end

  # Les éléments qui peuvent devenir le parent de celui-ci, sous forme de paires [élément, profondeur].
  def available_parents
    excluded_ids = self_and_descendants.map(&:id)
    self.class.tree.reject { |element, _depth| excluded_ids.include?(element.id) }
  end

  def descendants
    return [] if new_record?
    # Repart de la classe plutôt que de passer par children, pour éviter fuites de mémoire liées aux définitions d'associations.
    self.class.where(parent_id: id).ordered.flat_map { |child| [child] + child.descendants }
  end

  def self_and_descendants
    [self] + descendants
  end

  def siblings
    scope = self.class.where(parent_id: parent_id).ordered
    persisted? ? scope.where.not(id: id) : scope
  end

  protected

  # Position unique parmi les éléments de même parent. 
  # On la calcule quand elle est laissée vide, ou quand l'élément change de parent sans qu'une position soit demandée.
  # Il passe dans ce cas en dernier chez son nouveau parent.
  def set_position
    return unless position.blank? || (parent_id_changed? && !position_changed?)
    self.position = (siblings.maximum(:position) || 0) + 1
  end

  def parent_id_cannot_be_self_or_a_descendant
    return if parent.blank?
    if parent == self
      errors.add :parent_id, :itself
    elsif descendants.include?(parent)
      errors.add :parent_id, :descendant
    end
  end
end
