# https://github.com/codeplant/simple-navigation/issues/206
class SimpleNavigationPatch
  def self.mutex
    @mutex ||= Mutex.new
  end
end
