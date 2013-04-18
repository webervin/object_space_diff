require "object_space_diff/version"
# $: << './lib' ; require 'object_space_diff';  ObjectSpaceDiff.puts_changes{}
module ObjectSpaceDiff

  def puts_changes(target=$stdout)
    klass = Object
    object_ids = ObjectSpace.each_object(klass).collect(&:object_id)
    data = yield


    ObjectSpace.garbage_collect
    sleep 1
    ObjectSpace.garbage_collect

    new_ids = ObjectSpace.each_object(klass).collect(&:object_id)
    ids_diff = (new_ids - object_ids)

    (ids_diff).each_with_index do |oid,i|
      if oid == object_ids.object_id ||
          oid == new_ids.object_id ||
          oid == ids_diff.object_id ||
          oid == data.object_id ||
          oid == klass.object_id
        target.puts "#{i+1} #{oid}: junk_collector_internal, skipping" if $DEBUG
        next
      end
      obj = ObjectSpace._id2ref(oid)
      if obj.kind_of?(Array) && obj.first.object_id == klass.object_id
        target.puts "#{i+1} #{oid}: junk_collector_internal, skipping" if $DEBUG
      else
        target.puts "#{i+1} #{oid}:\n\t\t#{obj.class}\n\t\t#{obj}"
      end
      obj = nil
    end
    new_ids = nil
    object_ids = nil
    klass = nil
    data
  end
  module_function :puts_changes
end
