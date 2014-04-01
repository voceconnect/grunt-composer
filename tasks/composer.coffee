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
      ComposerRunner = require('./lib/ComposerRunner')
      composerRunnerObj = new ComposerRunner(this.options(), command, flags)
      console.log composerRunnerObj.getExecCommand()
  )