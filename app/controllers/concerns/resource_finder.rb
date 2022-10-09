# frozen_string_literal: true

module ResourceFinder
  def parent
    klass, param = parent_class
    klass.find(params[param.to_sym]) if defined?(klass) && nested_route?
  end

  private

  def parent_class
    result = nil
    params.each_key do |name|
      next unless name.match?(/(.+)_id$/)

      model = name.match(%r{([^/.]*)_id$})
      next unless Object.const_defined? model[1].classify

      result = model[1].classify.constantize, name
    end
    result
  end

  def nested_route?
    request.url.split('v1/')[1].split('/').size >= 3
  end
end
