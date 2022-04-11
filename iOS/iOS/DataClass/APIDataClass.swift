// MARK: UserListData
struct UserListData: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserData]
    let support: Support
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: UserData
struct UserData: Codable {
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
struct Support: Codable {
    let url: String
    let text: String
}

// MARK: SingleUserData
struct SingleUserData: Codable {
    let data: UserData
    let support: Support
}
  
// MARK: PostResponseData
struct PostResponseData: Codable {
    let job: String
    let id: String
    let createdAt: String
    let name: String
}

// MARK: DeleteUser
struct DeleteUserData: Codable {

}

// MARK: UpdateUserData
struct UpdateUserData: Codable {
    let job: String
    let updatedAt: String
    let name: String
}

// MARK: User
struct User: Encodable {
    let name: String
    let job: String
}
