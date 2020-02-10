var express = require('express');
var router = express.Router();

/* GET about page. */
router.get('/', function (req, res, next) {
  res.render('contact', { title: 'Mai - Contact' });
});

module.exports = router;
