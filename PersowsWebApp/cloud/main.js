
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {

	console.log("args "+args);

	// require the Twilio module and create a REST client
	var client = require('twilio')(args[2], args[3]);

	// Send an SMS text message
	client.sendSms({
	    to:args[4],
	    from: args[5],
	    body: args[6]
	}, function(err, responseData) {
	    if (err == null) {
	        console.log("direction " + responseData.direction);
	        console.log("from " + responseData.from);
	        console.log("to " + responseData.to);
	        response.success("Hello world! done");
	    } else {
	        console.log("failure, "+err);
	    }
	});
});


// Parse.Cloud.define(
// 	"receiveSMS", function(request, response) {
// 		console.log("Received a new text: " + request.params.From);
// 		response.success();
// 	}
// );
