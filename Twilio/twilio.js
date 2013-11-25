// get args
var args = process.argv;

// require the Twilio module and create a REST client
var client = require('twilio')(args[2], args[3]);

// Send an SMS text message
client.sendMessage({
    to:args[4],
    from: args[5],
    body: args[6]
}, function(err, responseData) {
    if (err == null) {
        console.log("direction " + responseData.direction);
        console.log("from " + responseData.from);
        console.log("to " + responseData.to);
    } else {
        console.log("failure, "+err);
    }
});

/*
    http://www.twilio.com/docs/api/rest/sending-sms#example-1

    {
        "account_sid": "AC5ef872f6da5a21de157d80997a64bd33",
        "api_version": "2010-04-01",
        "body": "Jenny please?! I love you <3",
        "date_created": "Wed, 18 Aug 2010 20:01:40 +0000",
        "date_sent": null,
        "date_updated": "Wed, 18 Aug 2010 20:01:40 +0000",
        "direction": "outbound-api",
        "from": "+14158141829",
        "price": null,
        "sid": "SM90c6fc909d8504d45ecdb3a3d5b3556e",
        "status": "queued",
        "to": "+14159352345",
        "uri": "/2010-04-01/Accounts/AC5ef872f6da5a21de157d80997a64bd33/SMS/Messages/SM90c6fc909d8504d45ecdb3a3d5b3556e.json"
    }
*/