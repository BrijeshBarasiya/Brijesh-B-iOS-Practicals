// MARK: - MVPData
struct MVPData: Codable {
    let data: MVPUserData
    let support: MVPSupport
}

// MARK: - MVPUserData
struct MVPUserData: Codable {
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

// MARK: - MVPSupport
struct MVPSupport: Codable {
    let url: String
    let text: String
}

