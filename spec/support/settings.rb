require "wepay-api"
require "yaml"
require "erb"

file_path = ["spec/settings.yml", "spec/settings.yml.example"].find &File.method(:exists?)
yaml      = ERB.new(File.read(file_path)).result
settings  = YAML.load(yaml)
SETTINGS  = settings

Wepay.configure do |config|
  SETTINGS.each do |name, value|
    config.send(:"#{name}=", value) if config.respond_to?(:"#{name}=")
  end
end