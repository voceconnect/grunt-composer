###
composer
@usage:
    grunt compass:install
###

module.exports = (grunt) ->
  exec = require('child_process').exec

  execCmd = (cmd, cb, spawnOpts) ->
    grunt.verbose.writeln 'Exec: ' + cmd
    child = exec cmd, spawnOpts, (error, stdout, stderr) ->
      grunt.verbose.writeln stdout
      if(stderr)
        grunt.fatal stderr
      if(error && error.code == 127)
        grunt.warn 'Composer must be installed globally. For more info,
        see: https://getcomposer.org/doc/00-intro.md#globally.'
      cb()

  desc = 'Wrapper for Composer commands'
  grunt.registerTask 'composer', desc, (cmd, args...) ->
    options = this.options()
    spawnOpts = {}
    if options.cwd
      spawnOpts.cwd = options.cwd

    done = this.async()
    cmd += ' --' + arg for arg in args
    execCmd 'composer ' + cmd, done, spawnOpts
