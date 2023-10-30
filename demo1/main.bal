import ballerina/io;
// import ballerina/websub;
import ballerina/log;
import ballerina/http;

// @websub:SubscriberServiceConfig {
//     target: [
//         "https://api.github.com/hub", 
//         "https://github.com/<YOUR_ORGANIZATION>/<REPOSITORY>/events/push.json"
//     ],
//     secret: "",
//     httpConfig: {
//         auth: {
//             token: ""
//         }
//     }
// }

listener http:Listener githubListener = new(9090);
service on githubListener {
    function init() {
        io:println("Service initialized");
    }

    resource function post event(@http:Payload json payload) {
        log:printInfo(payload.toString());
    }

    // remote function onEventNotification(websub:ContentDistributionMessage event) returns error? {
    //     io:println("Received notification from the hub");
    //     io:println(event);
    //     json retrievedContent = check event.content.ensureType();
    //     if retrievedContent.zen is string {
    //         int hookId = check retrievedContent.hook_id;
    //         io:println(string `PingEvent received for webhook [${hookId}]`);
    //         int senderId = check retrievedContent.sender.id;
    //         io:println(string `Event sender [${senderId}]`);
    //     } else if retrievedContent.ref is string {
    //         string repositoryName = check retrievedContent.repository.name;
    //         io:println(string `PushEvent received for [${repositoryName}]`);
    //         string lastUpdatedTime = check retrievedContent.repository.updated_at;
    //         io:println(string `Last updated at ${lastUpdatedTime}`);
    //     }
    // }
}
