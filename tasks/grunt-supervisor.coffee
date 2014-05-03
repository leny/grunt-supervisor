###
 * grunt-supervisor
 * https://github.com/leny/grunt-supervisor
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
###

"use strict"

supervisor = require "supervisor"

module.exports = ( grunt ) ->

    kindOf = grunt.util.kindOf

    grunt.registerMultiTask "supervisor", "Runs a supervisor monitor of your node.js server.", ->

        aOptions = []
        oOptions = @data.options || {}
        @async() unless oOptions.forceSync is yes

        aOptions.push "--watch", oOptions.watch.join "," if kindOf( oOptions.watch ) is "array"
        aOptions.push "--ignore", oOptions.ignore.join "," if kindOf( oOptions.ignore ) is "array"
        aOptions.push "--extensions", oOptions.extensions.join "," if kindOf( oOptions.extensions ) is "array"

        aOptions.push "--exec", oOptions.exec if kindOf( oOptions.exec ) is "string"

        aOptions.push "--poll-interval", "#{ oOptions.pollInterval }" if kindOf( oOptions.pollInterval ) is "number"
        aOptions.push "--no-restart-on", oOptions.noRestartOn if kindOf( oOptions.noRestartOn ) is "string" and ( oOptions.noRestartOn is "error" or oOptions.noRestartOn is "exit" )

        aOptions.push "--debug" if oOptions.debug is yes
        aOptions.push "--debug-brk" if oOptions.debugBrk is yes
        aOptions.push "--harmony" if oOptions.harmony is yes
        aOptions.push "--force-watch" if oOptions.forceWatch is yes
        aOptions.push "--quiet" if oOptions.quiet is yes

        aOptions.push "--", @data.script
        aOptions.push oOptions.args... if kindOf( oOptions.args ) is "array"

        supervisor.run aOptions
