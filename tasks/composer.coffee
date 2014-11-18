###
composer
@usage:
    grunt composer:args...
###

module.exports = (grunt) ->
  if grunt.config 'composer'
    grunt.registerMultiTask(
      'composer',
      'Wrapper around Composer commands',
      (command, flags...) ->
        module.exports.handleTask this, command, flags
    )
  else
    grunt.registerTask(
      'composer',
      'Wrapper around Composer commands',
      (command, flags...) ->
        module.exports.handleTask this, command, flags
    )

module.exports.handleTask = (self, command, flags) ->
  require 'shelljs/global'
  commandBuilder = require './lib/commandBuilder'
  commandToRun = commandBuilder
  .withConfig(self.options())
  .withFlags(flags)
  .withCommand(command)
  .build()

  cur_cwd = process.cwd()
  cwd = self.options().cwd

  if cwd
    cd(cwd)

  result = exec(commandToRun).code == 0

  if cwd
    cd(cur_cwd)

  result
