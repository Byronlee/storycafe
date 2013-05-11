# This is a modified version of the code found on this blog post:
#   http://ihswebdesign.com/blog/autoincrement-in-mongodb-with-ruby/
module MongoidAutoInc
  class Incrementor

    def initialize(name, options=nil)
      options     ||= { }
      @name       = name
      @collection = options[:collection] || "__sequences"
      @object     = options[:object]
      @scope      = options[:scope]
      exists? || create(options[:seed].to_i)
    end

    def inc
      update_number_with("$inc" => { seq: 1 })
    end

    def set(number)
      update_number_with("$set" => { seq: number })
    end

    private

    def exists?
      collection.find(query).count > 0
    end

    def create(number = 0)
      collection.insert(query.merge({ seq: number }))
    end

    def collection
      Mongoid.default_session[@collection]
    end

    def query
      { _id: sequence_name }
    end

    def update_number_with(mongo_func)
      inc = collection.where(_id: sequence_name).modify(mongo_func, upsert: true, new: true)
      inc['seq']
    end

    def sequence_name
      scope_val = ''
      if @scope
        scope_val = @object.read_attribute(@scope.to_sym) || ''
        scope_val = "_#{scope_val}" if scope_val.present?
      end
      val = "#{@object.class.name.downcase}#{scope_val}_#{@name}"
    end
  end
end
