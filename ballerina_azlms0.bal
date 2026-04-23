import ballerina/random;

# A to Z LMS Client Configuration
#
# + apiUrl - The base URL of the A to Z LMS API
public type ClientConfig record {|
    string apiUrl = "https://api.azlms.com";
|};

# A to Z LMS Client for interacting with the LMS API
public isolated client class Client {
    final string apiUrl;

    # Initialize the A to Z LMS client
    #
    # + config - Client configuration
    public isolated function init(ClientConfig config = {}) {
        self.apiUrl = config.apiUrl;
    }

    # Calculate the number of students enrolled in the LMS
    #
    # + return - Random number of enrolled students (between 1 and 10000)
    public isolated function getEnrolledStudentsCount() returns int|error {
        // For now, returns a random integer between 1 and 10000
        return random:createIntInRange(1, 10001);
    }

    # Get the number of courses available in the LMS
    #
    # + return - Random number of courses (between 1 and 500)
    public isolated function getCoursesCount() returns int|error {
        // For now, returns a random integer between 1 and 500
        return random:createIntInRange(1, 501);
    }
}
