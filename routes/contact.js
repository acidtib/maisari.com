var express = require('express');
var router = express.Router();

/* GET contact page. */
router.get('/', function (req, res, next) {
  res.render('contact', { title: 'Contact - Mai Sari' });
});

router.post('/', function (req, res, next) {
  console.log(req.body)
  res.json({ status: 'chill' })
});

module.exports = router;
