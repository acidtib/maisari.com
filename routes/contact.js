var express = require('express');
var router = express.Router();
var nodeMailer = require('nodemailer');

/* GET contact page. */
router.get('/', function (req, res, next) {
  res.render('contact', { title: 'Contact - Mai Sari' });
});

router.post('/', function (req, res, next) {
  let transporter = nodeMailer.createTransport({
    host: 'smtp.zoho.com',
    port: 465,
    secure: true,
    auth: {
      user: process.env.MAILER_EMAIL,
      pass: process.env.MAILER_PASSWORD
    }
  });

  let mailOptions = {
    from: process.env.MAILER_EMAIL,
    to: process.env.MAILER_EMAIL,
    subject: "New Message From Website",
    html: "<b>name: " + req.body.senderName + "</b> <br> <b>email: " + req.body.senderEmail + "</b> <br><b>message: " + req.body.message + "</b>"
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log(error);
      res.status(500).json({ error: error });
    }
    console.log('Message %s sent: %s', info.messageId, info.response);
    res.status(200).json({ status: 'chill' });
  });
});

module.exports = router;
