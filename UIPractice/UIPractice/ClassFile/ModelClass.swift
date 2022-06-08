// MARK: - Struct UserProfileValues
struct UserProfileValues {
    let headerName: String
    let userInformations: [UserInformation]
}

// MARK: - Struct UserInformation
struct UserInformation {
    let header: String
    let info: String
}

// MARK: - Struct OnboardingValues
struct OnboardingValues {
    let image: String
    let title: String
    let description: String
}

// MARK: - Global Variable userProfileValues
let userProfileValues = [
    UserProfileValues(
        headerName: "Information",
        userInformations:
            [
                UserInformation(header: "Username", info: "@whitewater"),
                UserInformation(header: "First Name", info: "Jeanette"),
                UserInformation(header: "Last Name", info: "Russell"),
                UserInformation(header: "Phone Number", info: "+1 903 782-1358")
            ]
    ),
    UserProfileValues(
        headerName: "Location",
        userInformations:
            [
                UserInformation(header: "Country", info: "Hong Kong")
            ]
    ),
    UserProfileValues(
        headerName: "Password",
        userInformations:
            [
                UserInformation(header: "Your Password", info: "********")
            ]
    )
]

// MARK: - Global Variable onboardingValues
let onboardingValues = [
    OnboardingValues(image: "Screen1", title: "We Bring Peoples To Closer!", description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet."),
    OnboardingValues(image: "Screen2", title: "Stay Connected With More People", description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet."),
    OnboardingValues(image: "Screen3", title: "Stay active and Connect with Community", description: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.")
]

