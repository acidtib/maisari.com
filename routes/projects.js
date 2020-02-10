var express = require('express');
var router = express.Router();

/* GET project page. */
router.get('/hodl-wallet', function (req, res, next) {
  res.render('project/hodl_wallet', { title: 'HODL WALLET' });
});

module.exports = router;
