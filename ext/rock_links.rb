require 'webgen/tag'

class RockType
    include Webgen::Tag::Base

    def call(tag, body, context)
        name = param('rocktype.name')
        "/types/#{name}.html"
    end
end

class RockPackage
    include Webgen::Tag::Base

    def call(tag, body, context)
        name = param('rockpackage.name')
        "/pkg/#{name}/index.html"
    end
end

class RockTask
    include Webgen::Tag::Base

    def call(tag, body, context)
        name = param('rocktask.name')
        "/tasks/#{name}.html"
    end
end

class RockTicket
    include Webgen::Tag::Base

    def call(tag, body, context)
        ticket_id = param('rockticket.ticket_id')
        "http://rock.opendfki.de/ticket/#{id}"
    end
end

class RockSource
    include Webgen::Tag::Base

    def call(tag, body, context)
        uri = param('rocksource.url')
        parts = uri.split('/')

        url = [parts.shift]
        if parts.first == "orogen"
            parts.shift
            url << "orogen-#{parts.shift}"
        else
            url << parts.shift
        end
        url << "blobs" << "master"
        "http://gitorious.org/#{url.join("/")}"
    end
end

config = Webgen::WebsiteAccess.website.config
config.rocktype.name nil, :mandatory => 'default'
config['contentprocessor.tags.map']['rock_type'] = 'RockType'
config.rockpackage.name nil, :mandatory => 'default'
config['contentprocessor.tags.map']['rock_pkg'] = 'RockPackage'
config.rocktask.name nil, :mandatory => 'default'
config['contentprocessor.tags.map']['rock_task'] = 'RockTask'
config.rockticket.ticket_id 0, :mandatory => 'default'
config['contentprocessor.tags.map']['rock_ticket'] = 'RockTicket'
config.rocksource.url nil, :mandatory => 'default'
config['contentprocessor.tags.map']['rock_source'] = 'RockSource'

