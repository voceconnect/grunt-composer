###
composer
@usage:
    grunt compass:install
###

module.exports = (grunt) ->
  spawn = require('child_process').spawn

  execCmd = (cmd, args, cb) ->
    exec = spawn cmd, args
    exec.stdout.on 'data', grunt.log.write
    exec.stderr.on 'data', grunt.log.error
    exec.on 'close', cb

  desc = 'Wrapper for Composer commands'
  grunt.registerTask 'composer', desc, (cmd, args...) ->
    done = this.async()
    cmdArgs = ('--' + arg for arg in args)
    cmdArgs.unshift cmd
    execCmd 'composer', cmdArgs, done