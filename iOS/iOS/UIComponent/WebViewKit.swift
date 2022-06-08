import UIKit
import WebKit

class WebViewKit: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var serachBar: UISearchBar!
    @IBOutlet weak var browserWeb: WKWebView!
    @IBOutlet weak var pdfWebView: WKWebView!
    @IBOutlet weak var htmlWebView: WKWebView!

    // MARK: override Methods
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "Webview"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serachBar.delegate = self
        loadPdf()
        loadHtml()
    }
    
    private func loadPdf() {
        pdfWebView.isUserInteractionEnabled = true
        let path = Bundle.main.path(forResource: "demoPDF", ofType: "pdf")
        let url = URL(fileURLWithPath: path ?? "demoPDF")
        let requestpath = URLRequest(url: url)
        pdfWebView.load(requestpath)
    }
    
    private func loadHtml() {
        let path = Bundle.main.path(forResource: "demoHTML", ofType: "html")
        let url = URL(fileURLWithPath: path ?? "demoHTML")
        let requestpath = URLRequest(url: url)
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
