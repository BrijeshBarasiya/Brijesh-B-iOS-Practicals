// MARK: UserListData
struct ViperUsersData: Codable {
    let page, perPage, total, totalPages: Int
    let data: [ViperUser]
    let support: ViperSupport
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: UserData
struct ViperUser: Codable {
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

// MARK: Support
struct ViperSupport: Codable {
    let url: String
    let text: String
}
