// MARK: - MvvmData
struct MvvmData: Codable {
    let data: MvvmUserData
    let support: MvvmSupport
}

// MARK: - MvvmUserData
struct MvvmUserData: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - MvvmSupport
struct MvvmSupport: Codable {
    let url: String
    let text: String
}

