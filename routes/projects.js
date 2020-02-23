var express = require('express');
var router = express.Router();

/* GET project page. */
router.get('/hodl-wallet', function (req, res, next) {
  res.render('project/hodl_wallet', { title: 'HODL WALLET' });
});

router.get('/bitstop-atm', function (req, res, next) {
  res.render('project/bitstop_atm', { title: 'Bitstop ATM' });
});

router.get('/bitstop-co', function (req, res, next) {
  res.render('project/bitstop_co', { title: 'Bitstop Co' });
});

router.get('/shoot-my-travel', function (req, res, next) {
  res.render('project/shoot_my_travel', { title: 'Shoot My Travel' });
});

module.exports = router;
