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
  require('shelljs/global')
  commandBuilder = require('./lib/commandBuilder')
  commandToRun = commandBuilder
  .withConfig(self.options())
  .withFlags(flags)
  .withCommand(command)
  .build()

  cwd = self.options().cwd
  if cwd
    cd(cwd)

  exec(commandToRun).code == 0

