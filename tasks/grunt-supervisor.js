
/*
 * grunt-supervisor
 * https://github.com/leny/grunt-supervisor
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
 */
"use strict";
var supervisor;

supervisor = require("supervisor");

module.exports = function(grunt) {
  return grunt.registerMultiTask("supervisor", "Runs a supervisor monitor of your node.js server.", function() {
    var aOptions;
    this.async();
    aOptions = [];
    aOptions.push(this.data.script);
    console.log(aOptions);
    return supervisor.run(aOptions);
  });
};
