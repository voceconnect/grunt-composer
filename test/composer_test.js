'use strict';

var grunt = require('grunt');

exports.composer = {
	install_test: function(test) {
		test.expect(1);

		test.ok(grunt.file.exists('test/tmp/autoload.php'), 'should have created composer.json file');
		test.done();
	}
}