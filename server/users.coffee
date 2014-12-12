# Prevent users to modify their roles
Meteor.users.deny
  update: -> true

# Prevent user's secret to be listened
Meteor.publish 'groupUsers', (groupId) ->
  check groupId, String
  group = Groups.findOne groupId
  selector = _id: $in: group.members
  options = fields: username: 1
  Meteor.users.find selector, options
