var express = require('express');
var router = express.Router();
const axios = require('axios');

router.get('/dribbble', function (req, res, next) {
  axios.get('https://api.dribbble.com/v2/user/shots?per_page=100', { 
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
        case 7146036:
        case 7146033:
        case 4444531:
        case 4440391:
        case 4436231:
        case 4431103:
        case 4430929:
        case 4394011:
        case 3072103:
        case 2965545:
        case 2958610:
        case 2956243:
        case 2956165:
        case 2954928:
        case 2954848:
        case 2581574:
        case 2575839:
        case 2575818:
        case 2575805:
        case 2572205:
        case 2572195:
        case 2572193:
        case 2571644:
        case 2571640:
        case 2571635:

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
