var express = require('express');
var router = express.Router();
const axios = require('axios');

router.get('/dribbble', function (req, res, next) {
  axios.get('https://api.dribbble.com/v2/user/shots', { 
    headers: { Authorization: process.env.DRIBBBLE_TOKEN } 
  }).then(response => {
    res.status(200).json(response.data);
  }).catch((error) => {
    res.status(404).json({ error: error });
  });
});

module.exports = router;
