import UIKit
import WebKit

class WebViewKit: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var serachBar: UISearchBar!
    @IBOutlet weak var browserWeb: WKWebView!
    @IBOutlet weak var pdfWebView: WKWebView!
    @IBOutlet weak var htmlWebView: WKWebView!

    // MARK: override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        serachBar.delegate = self
        var path = Bundle.main.path(forResource: "demoPDF", ofType: "pdf")
        var url = URL(fileURLWithPath: path ?? "demoPDF")
        var requestpath = URLRequest(url: url)
        pdfWebView.load(requestpath)
        path = Bundle.main.path(forResource: "demoHTML", ofType: "html")
        url = URL(fileURLWithPath: path ?? "demoHTML")
        requestpath = URLRequest(url: url)
        htmlWebView.load(requestpath)
    }
    
}

// MARK: UISearchBarDelegate
extension WebViewKit: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let url = URL(string: "https://www.google.com/search?q=\(searchText)") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        browserWeb.load(urlRequest)
    }
    
}
