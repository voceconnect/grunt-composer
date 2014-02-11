###
composer
@usage:
    grunt compass:install
###

module.exports = (grunt) ->
  spawn = require('child_process').spawn

  execCmd = (cmd, args, cb, spawnOpts) ->

    exec = spawn cmd, args, spawnOpts
    exec.stdout.on 'data', grunt.log.write
    exec.stderr.on 'data', grunt.log.error
    exec.on 'close', (code) ->
      if(code == 127)
        grunt.warn 'Composer must be installed globally.  ' +
          "for more info, see:  https://getcomposer.org/doc/00-intro.md#globally."
      cb()

  desc = 'Wrapper for Composer commands'
  grunt.registerTask 'composer', desc, (cmd, args...) ->
    options = this.options()
    spawnOpts = {}
    if options.cwd
      spawnOpts.cwd = options.cwd

    done = this.async()
    cmdArgs = ('--' + arg for arg in args)
    cmdArgs.unshift cmd
    execCmd 'composer', cmdArgs, done, spawnOpts
