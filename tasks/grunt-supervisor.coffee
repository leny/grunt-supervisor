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

    grunt.registerMultiTask "supervisor", "Runs a supervisor monitor of your node.js server.", ->

        @async()

        aOptions = []



        aOptions.push "--"
        aOptions.push @data.script

        supervisor.run aOptions
