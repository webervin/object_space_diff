require "object_space_diff/version"

module ObjectSpaceDiff
  require 'object_space'
  def puts_changes(target=$stdout)
    object_ids = ObjectSpace.each_object(BasicObject).collect(&:object_id)
    data = yield

    ObjectSpace.garbage_collect
    sleep 1
    ObjectSpace.garbage_collect


    new_ids = ObjectSpace.each_object(BasicObject).collect(&:object_id)
    ids_diff = (new_ids - object_ids)
    new_ids = nil
    object_ids = nil

    (ids_diff).each_with_index do |oid,i|
      if oid == data.object_id ||
            oid == object_ids.object_id ||
            oid == new_ids.object_id ||
            oid == ids_diff.object_id
        target.puts "#{i+1} #{oid}: junk_collector_internal, skipping"
        next
      end
      obj = ObjectSpace._id2ref(oid)
      target.puts "#{i+1} #{oid}:\n\t\t#{obj.class}\n\t\t#{obj}"
      obj = nil
    end
    data
  ensure
    ids_diff = nil if ids_diff
    new_ids = nil if new_ids
    object_ids = nil if object_ids
  end
  module_function :puts_changes
end
