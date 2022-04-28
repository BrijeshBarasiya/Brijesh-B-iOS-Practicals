import Foundation
import Alamofire

// MARK: Global Variable
let baseUrl = "https://reqres.in/api/"

// MARK: Enum class APIUrls
enum APIUrls {
    case loginUser
}

// MARK: Enum class UrlEncoding
enum UrlEncoding {
    
    // MARK: Create URL Functions
    static func createUrl(url: APIUrls, pathComponent: String = "") -> String {
        switch url {
        case .loginUser:
            return "\(baseUrl)login\(pathComponent)"
        }
    }
    
    // MARK: URL Encoding Functions
    static func urlEncoding(url: APIUrls) -> ParameterEncoding {
        switch url {
        case .loginUser:
            return URLEncoding.default
        }
    }
    
    // MARK: URL Method Functions
    static func urlMethod(url: APIUrls) -> HTTPMethod {
        switch url {
        case .loginUser:
            return .post
        }
    }
    
    // MARK: Response Code Functions
    static func responseCode(url: APIUrls) -> Int {
        switch url {
        case .loginUser:
            return 200
        }
    }
    
}

// MARK: Class AlamofireWebServices
class RoomFinderWebServices {
    
    //Private Init used Because We not able to make Object of this Class
    private init(){}
    
    // MARK: AlamofireWebServices Request Function
    private static func request<T: Decodable>(typeT: T.Type, url: URL, apiUrl: APIUrls, perameters: [String: Any]?, completion: @escaping (T) -> Void, error: @escaping (String) -> Void) {
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
                        error("Sorry Data Not Found.")
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
    
    public static func checkUser(perameterData: [String: Any], completion: @escaping (RegisterSuccessful) -> Void, error: @escaping (String) -> Void) {
        guard let url = URL(string: "\(UrlEncoding.createUrl(url: .loginUser))") else {
            return
        }
        self.request(typeT: RegisterSuccessful.self, url: url, apiUrl: .loginUser, perameters: perameterData, completion: completion, error: error)
    }

}
