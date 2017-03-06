#!/usr/bin/env node
const prog = require('caporal');
prog
  .version('0.0.1')
  .command('init', 'Create prototype') 
  .argument('<name>', 'Name of Prototype')
  .action(function(args, options, logger) {
    logger.info('Creating folder', args.name)
    logger.info('Adding source code')
    logger.info('Setting up defaults')
    logger.info('Create live-instance')
  })
  .command('page', 'Create a page in prototype')
  .argument('<name>', 'Name of page')
  .action(function(args, options, logger) {
    console.log('CREATING PAGE', args);
  })
  .command('publish', 'Publishing prototype')
  .argument('<msg>', 'Message of publish')
  .action(function(args, options, logger) {
    console.log('Publishing prototype', args, options);
  })
prog.parse(process.argv);