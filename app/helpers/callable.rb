module Callable
  def call(*args, **keyword_args, &block)
    # Capture all args and pass to the initializer.
    if keyword_args.empty?
      new(*args).call(&block)
    else
      new(*args, **keyword_args).call(&block)
    end
  end
end

# Example Implementation:

# class MyService
#   extend Callable

#   def initialize(arg, keyword_arg:)
#     @arg = arg
#     @keyword_arg = keyword_arg
#   end

#   def call
#     # Business logic here
#     if success?
#       ServiceResult.new(success: true, data: [@arg, @keyword_arg])
#     else
#       ServiceResult.new(success: false, errors: [ StandardError.new('It failed') ])
#     end
#   end
# end

# Call the service like this:
# MyService.call('foo', keyword_arg: 'bar')
