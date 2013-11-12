###
composer
@usage:
	grunt compass:install
###

module.exports = (grunt) ->
	spawn = require('child_process').spawn

	execCmd = (cmd, args, options, cb) ->
		exec = spawn cmd, args, options
		exec.stdout.on 'data', grunt.log.writeln
		exec.stderr.on 'data', grunt.log.error
		exec.on 'close', cb

	desc = 'Wrapper for Composer commands'
	grunt.registerTask 'composer', desc, (cmd) ->
        grunt.log.writeln JSON.stringify cmd, null, 4
        grunt.log.writeln JSON.stringify grunt.option.flags(), null, 4