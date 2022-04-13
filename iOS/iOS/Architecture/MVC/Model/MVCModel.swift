// MARK: - MVCData
struct MVCData: Codable {
    let data: MVCUserData
    let support: MVCSupport
}

// MARK: - MVCUserData
struct MVCUserData: Codable {
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

// MARK: - MVCSupport
struct MVCSupport: Codable {
    let url: String
    let text: String
}
