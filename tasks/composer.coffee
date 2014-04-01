###
composer
@usage:
    grunt composer:args...
###

module.exports = (grunt) ->
  grunt.registerTask(
    'composer',
    'Wrapper around Composer commands',
    exports.handleTask
  )


exports.handleTask = (command, flags) ->
  ComposerRunner = require('./lib/ComposerRunner')
  runner = new ComposerRunner(this.options(), command, flags)
  console.log(runner.getExecCommand())
