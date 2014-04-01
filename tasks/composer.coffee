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
  ComposerRunner = require('./lib/ComposerRunner')
  runner = new ComposerRunner(self.options(), command, flags)
  console.log(runner.getExecCommand())
