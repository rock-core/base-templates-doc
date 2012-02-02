require 'webgen/tag'
class RockType
    include Webgen::Tag::Base

    def call(tag, body, context)
        name = param('rock_type.name')
        "{relocatable: /types/#{name}.html}"
    end
end

class RockPackage
    include Webgen::Tag::Base

    def call(tag, body, context)
        name = param('rock_pkg.name')
        "{relocatable: /pkg/#{name}/index.html}"
    end
end

class RockTask
    include Webgen::Tag::Base

    def call(tag, body, context)
        name = param('rock_task.name')
        "{relocatable: /tasks/#{name}.html}"
    end
end

config = Webgen::WebsiteAccess.website.config
config.rock_type.name        "", :mandatory => 'default'
config['contentprocessor.tags.map']['rock_type'] = 'RockType'
config.rock_pkg.name        "", :mandatory => 'default'
config['contentprocessor.tags.map']['rock_type'] = 'RockPackage'
config.rock_task.name        "", :mandatory => 'default'
config['contentprocessor.tags.map']['rock_type'] = 'RockTask'

