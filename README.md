# Cron Parser

### Info
This basic application will allow you to print out times at which your scheduled command will run.

### Installation and running
App uses basic ruby language with no additional frameworks, which should be installed by default on your unix machine. To run it do:
    
    ruby parser.rb "cron_definition command_to_run"
    
For example:

    ruby parser.rb "00 09-18 * * 1-5 /usr/bin/find"
    
### Options

You can run this script with options:

  - to run additional examples before running the real thing do:
  
        ruby parser.rb "00 09-18 * * 1-5 /usr/bin/find" -run-examples
        
### Tests

Simple tests were added to confirm validity of the application. To run them do:

    ruby engine_tests.rb
