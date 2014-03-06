/*
 * grunt-composer
 * https://github.com/voceconnect/grunt-composer
 *
 * Copyright (c) 2013 Michael Pretty
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function (grunt) {

    // Project configuration.
    grunt.initConfig({
        jshint: {
            all: [
                'Gruntfile.js',
                'tasks/*.js'
            ]
        },
        coffeelint: {
            app: [
                'tasks/*.coffee',
                'test/*.coffee'
            ]
        },
        jasmine: {
            all: {
                src: 'test/*Spec.js'
            }
        },
        clean: {

        },
        coffee: {
            tests: {
                files: {
                    'test/gruntComposerSpec.js' : 'test/gruntComposerSpec.coffee'
                }
            }
        }

    });

    grunt.loadTasks('tasks');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-jasmine');

    grunt.registerTask('test', ['coffee', 'jasmine', 'coffeelint']);

};