module WithSteps
  extend ActiveSupport::Concern
  
  included do
    belongs_to :step, optional: true
    
    before_validation :initialize_step
  end

  protected

  def initialize_step
    step_class = association(:step).klass
    self.step ||= step_class.ordered.first
  end
end