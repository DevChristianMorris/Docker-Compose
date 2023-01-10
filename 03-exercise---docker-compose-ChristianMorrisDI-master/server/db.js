const Pool = require("pg").Pool;

const pool = new Pool({
  // See the .env file for these values
});

module.exports = pool;
