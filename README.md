# grunt-composer [![Build Status](https://travis-ci.org/voceconnect/grunt-composer.png?branch=master)](https://travis-ci.org/voceconnect/grunt-composer)


> A Grunt task wrapper for composer to allow custom tasks to be configured to run composer as needed.

## Getting Started

Installing the plugin:

```shell
npm install grunt-composer --save-dev
```

Loading the plugin via JavaScript:

```js
grunt.loadNpmTasks('grunt-composer');
```

Then you should use the `grunt.initConfig()` function inside your Gruntfile like below:

```js
grunt.initConfig({
    composer : {
        options : {
            usePhp: true,
            phpArgs: {
                someArg: 'custom'
            },
            flags: ['arg'],
            cwd: 'packages/build',
            composerLocation: '/usr/bin/composer'
        }
    }
})

```
### Options

#### options.usePhp
Type: `Boolean`
Default value: `false`

This tells the plugin to execute `php #{composerLocation}`

#### options.flags
Type: `Array`

This is an array of custom Composer CLI args, such as `no-dev`.  
_Note_: This is bypassed if there are command options.

#### options.phpArgs
Type: `Object`

This is an object which you should use to send -D arguments to the php binary.

#### options.cwd
Type: String

This is the working directory, normally where the composer.json is located.

#### options.composerLocation
Type: `String`
Defaut value: `composer`

The binary to use for composer if not installed globally.

If `options.cwd` is present, relative paths for `options.coposerLocation` are relative to that directory.

## Running Composer Commands

##### Commands

The first argument passed to the composer task becomes the command to run.  Arguments are passed to tasks in Grunt by separating them via a colon, ```:```.

```shell
grunt composer:update
```

Is equivalent to:

```shell
composer update
```

##### Command Options

Any arguments passed to the composer task after the command will get converted into options for the command.

```shell
grunt composer:install:no-dev
```

Is equivalent to:

```shell
composer install --no-dev
```
