import Foundation
import Alamofire

// MARK: Global Variable
let baseUrl = "https://reqres.in/"

// MARK: Enum Class Using
enum UsingWhichMethod {
    case urlSession
    case alamofire
}

// MARK: Enum class APIUrls
enum APIUrls {
    case singleUser
    case delayedResponse
    case createUser
    case deleteUser
    case updateUser
}

// MARK: Enum class UrlEncoding
enum UrlEncoding {
    
    // MARK: Create URL Functions
    static func createUrl(url: APIUrls, pathComponent: String = "") -> String {
        switch url {
        case .delayedResponse:
            return "\(baseUrl)api/users?delay=\(pathComponent)"
        case .createUser, .deleteUser, .updateUser, .singleUser:
            return "\(baseUrl)api/users/\(pathComponent)"
        }
    }
    
    // MARK: URL Encoding Functions
    static func urlEncoding(url: APIUrls) -> ParameterEncoding {
        switch url {
        case .singleUser:
            return URLEncoding.default
        case .delayedResponse:
            return URLEncoding.default
        case .createUser:
            return URLEncoding.default
        case .deleteUser:
            return URLEncoding.default
        case .updateUser:
            return URLEncoding.default
        }
    }
    
    // MARK: URL Method Functions
    static func urlMethod(url: APIUrls) -> HTTPMethod {
        switch url {
        case .singleUser, .delayedResponse:
            return .get
        case .createUser:
            return .post
        case .deleteUser:
            return .delete
        case .updateUser:
            return .put
        }
    }
    
    // MARK: Response Code Functions
    static func responseCode(url: APIUrls) -> Int {
        switch url {
        case .singleUser, .delayedResponse, .updateUser:
            return 200
        case .createUser:
            return 201
        case .deleteUser:
            return 204
        }
    }
    
}

// MARK: Class AlamofireWebServices
class AlamofireWebServices {
    
    //Private Init used Because We not able to make Object of this Class
    private init(){}
    
    // MARK: AlamofireWebServices Request Function
    private static func request<T: Decodable>(typeT: T.Type, url: URL, apiUrl: APIUrls, perameters: [String: Any]?, completion: @escaping (T?) -> Void, error: @escaping (String) -> Void) {
        AF.request(url, method: UrlEncoding.urlMethod(url: apiUrl), parameters: perameters, encoding: UrlEncoding.urlEncoding(url: apiUrl), headers: nil, interceptor: nil, requestModifier: nil).response { response in
            switch response.result {
            case .success(let data):
                if(response.response?.statusCode == UrlEncoding.responseCode(url: apiUrl)) {
                    if let responseData = data {
                        do {
                            guard let jsonData = try JSONDecoder().decode(T?.self, from: responseData) else { return }
                            completion(jsonData)
                        } catch (let errorMessage) {
                            error("Not Able to Convert JSON Data \(errorMessage).")
                        }
                    } else {
                        completion(nil)
                    }
                } else {
                    error("\(response.response?.statusCode ?? 0)Data Not Found.")
                }
                break
            case .failure(let errorMessage):
                error("Request Failure \(errorMessage).")
            }
        }
    }
    
    // MARK: User Detail Functions
    public static func getUserDetail(pathComponent: Int, name: UILabel, email: UILabel, image: UIImageView) {
        guard let url = URL(string: "\(UrlEncoding.createUrl(url: .singleUser, pathComponent: String(pathComponent)))") else {
            return
        }
        self.request(typeT: SingleUserData.self, url: url, apiUrl: .singleUser, perameters: nil, completion: {responseData in
            if let userData = responseData?.data {
                name.text = "\(userData.firstName) \(userData.lastName)"
                email.text = userData.email
                if let imageName = URL(string: userData.avatar) {
                    let img = try? Data(contentsOf: imageName)
                    DispatchQueue.main.async { image.image = UIImage(data: img!)}
                }
            }
        }, error: { message in
            print("Error: \(message)")
        })
    }
    
    // MARK: Users Details Functions
    public static func getUsersDetails(pathComponent: Int, completion: @escaping ([UserData]) -> Void) {
        guard let url = URL(string: "\(UrlEncoding.createUrl(url: .delayedResponse, pathComponent: String(pathComponent)))") else {
            return
        }
        self.request(typeT: UserListData.self, url: url, apiUrl: .singleUser, perameters: nil, completion: {responseData in
            if let userData = responseData?.data {
                completion(userData)
            }
        }, error: { message in
            print("Error: \(message)")
        })
    }
    
    // MARK: Create User Functions
    public static func createUser(perameterData: [String: Any], completion: @escaping () -> Void) {
        guard let url = URL(string: "\(UrlEncoding.createUrl(url: .createUser))") else {
            return
        }
        self.request(typeT: PostResponseData.self, url: url, apiUrl: .createUser, perameters: perameterData, completion: {responseData in
            completion()
        }, error: { message in
            print("Error: \(message)")
        })
    }
    
    // MARK: Delete User Functions
    public static func deleteUser(pathComponent: Int, perameterData: [String: Any], completion: @escaping () -> Void) {
        guard let url = URL(string: "\(UrlEncoding.createUrl(url: .deleteUser, pathComponent: String(pathComponent)))") else {
            return
        }
        self.request(typeT: DeleteUserData.self, url: url, apiUrl: .deleteUser, perameters: perameterData, completion: {responseData in
            completion()
        }, error: { message in
            print("Error: \(message)")
        })
    }
    
    // MARK: Update User Functions
    public static func updateUser(pathComponent: Int, perameterData: [String: Any], completion: @escaping () -> Void) {
        guard let url = URL(string: "\(UrlEncoding.createUrl(url: .updateUser, pathComponent: String(pathComponent)))") else {
            return
        }
        self.request(typeT: UpdateUserData.self, url: url, apiUrl: .updateUser, perameters: perameterData, completion: {responseData in
            completion()
        }, error: { message in
            print("Error: \(message)")
        })
    }
    
}
