const SequenceRoute = require('./sequenceRoute');

module.exports = (app) => {
    SequenceRoute(app);
}

/**Arquivo de define quais linha, rotas e verbos que serão respondidos pela aplicação, todos
 * serão respondidos pelo sequenceRoute
  */