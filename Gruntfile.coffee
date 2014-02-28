"use strict"

module.exports = ( grunt ) ->

    require( "matchdep" ).filterDev( "grunt-*" ).forEach grunt.loadNpmTasks

    grunt.initConfig
        coffee:
            options:
                bare: yes
            lib:
                files:
                    "lib/grunt-supervisor.js": "lib/grunt-supervisor.coffee"
        jshint:
          options:
            jshintrc: ".jshintrc"
          lib:
            src: [
                "lib/**/*.js"
            ]
        watch:
          lib:
            files: "<%= jshint.lib.src %>"
            tasks: [
                "coffee"
                "jshint"
            ]

    grunt.registerTask "default", [
        "coffee"
        "jshint"
    ]
