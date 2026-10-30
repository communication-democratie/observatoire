# == Schema Information
#
# Table name: reports
#
#  id               :uuid             not null, primary key
#  author_email     :string
#  author_pseudonym :string
#  brand            :string
#  description      :text
#  internal_note    :text
#  link             :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  problem_id       :uuid
#  step_id          :uuid
#
# Indexes
#
#  index_reports_on_problem_id  (problem_id)
#  index_reports_on_step_id     (step_id)
#
# Foreign Keys
#
#  fk_rails_...  (problem_id => problems.id)
#  fk_rails_...  (step_id => report_steps.id)
#
class Report < ApplicationRecord
  include WithSteps

  has_one_attached :image
  has_many_attached :files

  has_and_belongs_to_many :categories
  belongs_to :problem, optional: true, touch: true

  validates_presence_of :brand, :description, :author_pseudonym, on: :create

  after_commit :notify_step_changed_to_author, on: :update, if: :saved_change_to_step_id

  scope :ordered, -> { order(created_at: :desc) }
  scope :visible_in_front, -> { joins(:step).merge(Report::Step.visible_in_front) }

  def short_id
    id.to_s.split('-').first
  end

  def link_correct?
    link_uri.present? &&
    (
      link_uri.kind_of?(URI::HTTP) ||
      link_uri.kind_of?(URI::HTTPS)
    )
  end

  def link_label
    link_uri.host
  end

  def to_s
    title.blank? ? "#{id}" : "#{title}"
  end

  protected

  def link_uri
    @link_uri ||= URI.parse(link)
  rescue
    false
  end

  def notify_step_changed_to_author
    ReportMailer.step_changed(self, step).deliver_later if author_email.present?
  end
end
