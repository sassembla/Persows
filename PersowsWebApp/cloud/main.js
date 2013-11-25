
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
  console.log("Received a new text: " + request.params.From);// undefinedになり、エラーにはならない
  dasdasdasd// これはエラーになる。　こういう感じに表示される。  
  /*
  Failed with: ReferenceError: dasdasdasd is not defined
    at main.js:7:3
    */
});


// Parse.Cloud.define(
// 	"receiveSMS", function(request, response) {
// 		console.log("Received a new text: " + request.params.From);
// 		response.success();
// 	}
// );


// // Require and initialize the Twilio module with your credentials
// var client = require('twilio')('ACa113e8db94efb0e57758419e76e6bdb8', '1ee44d6fd299d48d64df091d3dd323b0');
 
// // Send an SMS message
// client.sendSms({
//		 to:'+8133104809', 
//		 from: '+81345208114', 
//		 body: 'Hello world!'
//	 }, function(err, responseData) { 
//		 if (err) {
//			 console.log(err);
//		 } else { 
//			 console.log(responseData.from); 
//			 console.log(responseData.body);
//		 }
//	 }
// );
