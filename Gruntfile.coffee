"use strict"

module.exports = ( grunt ) ->

    require( "matchdep" ).filterDev( "grunt-*" ).forEach grunt.loadNpmTasks

    grunt.initConfig
        coffee:
            options:
                bare: yes
            tasks:
                files:
                    "tasks/grunt-supervisor.js": "tasks/grunt-supervisor.coffee"
        jshint:
          options:
            jshintrc: ".jshintrc"
          tasks:
            src: [
                "tasks/**/*.js"
            ]
        watch:
          tasks:
            files: "<%= jshint.tasks.src %>"
            tasks: [
                "coffee"
                "jshint"
            ]
        supervisor:
            default:
                options: {}
                script: "test/test.js"
            all_options:
                options:
                    args: [ "dev" ]
                    watch: [ "test" ],
                    ignore: [ "tasks" ],
                    pollInterval: 500,
                    extensions: [ "js" ],
                    exec: "node",
                    debug: true,
                    debugBrk: true,
                    harmony: true,
                    noRestartOn: no,
                    forceWatch: true,
                    quiet: true
                script: "test/test.js"

    grunt.loadTasks "tasks"

    grunt.registerTask "default", [
        "coffee"
        "jshint"
    ]
