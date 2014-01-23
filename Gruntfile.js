/*
 * grunt-composer
 * https://github.com/voceconnect/grunt-composer
 *
 * Copyright (c) 2013 Michael Pretty
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    jshint: {
      all: [
        'Gruntfile.js',
        'tasks/*.js'
      ]
    },
    coffeelint: {
      app: ['tasks/*.coffee']
    },
    clean: {
      tests: ['test/tmp', 'test/composer.lock']
    },
    nodeunit: {
      tests: ['test/*_test.js']
    }
  });

  grunt.loadTasks('tasks');

  grunt.loadNpmTasks('grunt-coffeelint');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-nodeunit');

  grunt.registerTask('default', ['coffeelint']);
  grunt.registerTask('test', ['clean', 'composer:install:working-dir=test/', 'nodeunit']);

};