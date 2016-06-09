class Route
  attr_reader :http_method, :path, :controller, :action

  def initialize(http_method, path, processor)
    @http_method = http_method
    @path = path
    @controller = controller_from(processor)
    @action = controller_action_from(processor)
  end

  private

  def controller_from(processor)
    processor.split('#')[0]
  end

  def controller_action_from(processor)
    processor.split('#')[1]
  end
end
