import UIKit

class MVCController: UIViewController, Storyboarded {

    // MARK: - Variables
    var navCoordinator: ArchitectureCoordinator?
    
    // MARK: - IBOutlet
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    // MARK: - Override Fuction
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserdata()
    }
    
    // MARK: - Function
    private func getUserdata() {
        guard let url = URL(string: "https://reqres.in/api/users/2") else {
            print("Error: Cannot create URL")
            return
        }
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let datatask = session.dataTask(with: request) {data, response, error in
            guard let responseCode = (response as? HTTPURLResponse)?.statusCode else {
                return
            }
            if (responseCode == 200 ) {
                do {
                    guard let data = data else {
                        return
                    }
                    let fetchData = try JSONDecoder().decode(MVCData.self, from: data)
                    DispatchQueue.main.async {[weak self] in
                        let name = "\(fetchData.data.firstName) \(fetchData.data.lastName)"
                        self?.userName.text = name
                        self?.userEmail.text = fetchData.data.email
                        if let image = URL(string: fetchData.data.avatar) {
                            let imageData = try? Data(contentsOf: image)
                            DispatchQueue.main.async { self?.userImage.image = UIImage(data: imageData!)}
                        }
                    }
                }
                catch {
                    print("Error: Not Able to Fetch Data")
                }
            } else {
                print("Error: User Data Not Found.")
            }
        }
        datatask.resume()
    }
    
}
