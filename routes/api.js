var express = require('express');
var router = express.Router();
const axios = require('axios');

router.get('/dribbble', function (req, res, next) {
  axios.get('https://api.dribbble.com/v2/user/shots', { 
    headers: { Authorization: process.env.DRIBBBLE_TOKEN } 
  }).then(response => {

    var payload = response.data.map(function(data) {
      switch (data.id) {
        case 7146872:
        case 7146871:
        case 7146867:
        case 7146866:
        case 7146862:
        case 7146046:
          return ;
          break;
        default:
          return {
            id: data.id,
            html_url: data.html_url,
            title: data.title,
            image: data.images.hidpi
          }
      }
    })

    res.status(200).json(payload.filter(function (e) { return e }));
  }).catch((error) => {
    res.status(404).json({ error: error });
  });
});

module.exports = router;
