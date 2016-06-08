class BaseController
  def initialize(params)
    @params = params
  end

  private

  attr_reader :params
end
