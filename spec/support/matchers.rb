RSpec::Matchers.define :have_keys do |*keys|
  match do |object|
    keys.all? { |key| object.key? key }
  end
end