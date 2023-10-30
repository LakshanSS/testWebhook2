import ballerina/io;
import ballerina/log;
import ballerina/http;

service / on new http:Listener(9090) {
    function init() {
        io:println("Service initialized");
    }

    resource function post event(@http:Payload json payload) returns error? {
        log:printInfo(payload.toString());
    }
}
