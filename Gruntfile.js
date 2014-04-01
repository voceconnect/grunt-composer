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
        coffeelint: {
            app: [
                'tasks/*.coffee',
                'test/*.coffee'
            ]
        },
        coffee: {
            tests: {
                files: {
                    'specs/composerSpec.js' : 'test/composerSpec.coffee',
                    'specs/composerRunnerSpec.js' : 'test/composerRunnerSpec.coffee',
                    'ComposerRunner.js' : 'tasks/lib/ComposerRunner.coffee'
                }
            }
        },
        jasmine_node: {
            projectRoot: ".",
            requirejs: false,
            forceExit: true,
            jUnit: {
                report: false,
                savePath : "./build/reports/jasmine/",
                useDotNotation: true,
                consolidate: true
            }
        },
        watch : {
            files: [
                '**/**/*.coffee'
            ],
            tasks: ['coffee', 'jasmine_node', 'coffeelint']
        },
        composer : {
            options : {
                usePhp: true,
                phpArgs: {
                    someArg: 'custom'
                },
                composerLocation: 'customThing'
            }
        }
    });

    grunt.loadTasks('tasks');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-jasmine-node');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('test', ['coffee', 'jasmine_node', 'coffeelint']);

};