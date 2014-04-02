###
composer
@usage:
    grunt composer:args...
###

module.exports = (grunt) ->
  grunt.registerTask(
    'composer',
    'Wrapper around Composer commands',
    (command, flags...) ->
      module.exports.handleTask(this, command, flags)
  )

module.exports.handleTask = (self, command, flags) ->
  commandBuilder = require('./lib/commandBuilder')
  runner = commandBuilder
  .withConfig(self.options())
  .withFlags(flags)
  .withCommand(command)
  .build()
  console.log(runner.getExecCommand())
