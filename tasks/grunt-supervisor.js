
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
    var aOptions, oOptions;
    this.async();
    aOptions = [];
    oOptions = this.data.options;
    if (grunt.util.kindOf(oOptions.watch) === "array") {
      aOptions.push("--watch", oOptions.watch.join(","));
    }
    if (grunt.util.kindOf(oOptions.ignore) === "array") {
      aOptions.push("--ignore", oOptions.ignore.join(","));
    }
    if (grunt.util.kindOf(oOptions.pollInterval) === "number") {
      aOptions.push("--poll-interval", "" + oOptions.pollInterval);
    }
    if (grunt.util.kindOf(oOptions.extensions) === "array") {
      aOptions.push("--extensions", oOptions.extensions.join(","));
    }
    if (grunt.util.kindOf(oOptions.exec) === "string") {
      aOptions.push("--exec", oOptions.exec);
    }
    if (oOptions.debug === true) {
      aOptions.push("--debug");
    }
    if (oOptions.debugBrk === true) {
      aOptions.push("--debug-brk");
    }
    if (oOptions.harmony === true) {
      aOptions.push("--harmony");
    }
    if (grunt.util.kindOf(oOptions.noRestartOn) === "string" && (oOptions.noRestartOn === "error" && oOptions.noRestartOn === "exit")) {
      aOptions.push("--no-restart-on", oOptions.noRestartOn);
    }
    if (oOptions.forceWatch === true) {
      aOptions.push("--force-watch");
    }
    if (oOptions.quiet === true) {
      aOptions.push("--quiet");
    }
    aOptions.push("--", this.data.script);
    if (grunt.util.kindOf(oOptions.args) === "array") {
      aOptions.push.apply(aOptions, oOptions.args);
    }
    return supervisor.run(aOptions);
  });
};
