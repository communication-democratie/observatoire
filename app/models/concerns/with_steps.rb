module WithSteps
  extend ActiveSupport::Concern
  
  included do
    belongs_to :step, optional: true
    
    before_validation :initialize_step
  end

  protected

  def initialize_step
    step_class = association(:step).klass
    scope = step_class.respond_to?(:root) ? step_class.root : step_class
    self.step ||= scope.ordered.first
  end
end