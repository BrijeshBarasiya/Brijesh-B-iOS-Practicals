import UIKit

class Practical1: UIPageViewController, UIPageViewControllerDataSource {
    
    // MARK: Variable Declaration
    lazy var screens: [UIViewController] = [self.addViewController(name: "loginScreen"),
                                            self.addViewController(name: "signUpScreen")
    ]
    
    // MARK: override Function
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "View Controller"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let screen = screens.first {
            setViewControllers([screen], direction: .forward, animated: true, completion: nil
            )
        }
    }
    
    // MARK: Functions
    private func addViewController(name: String) -> UIViewController{
        return UIStoryboard(name: "UIComponents",
                            bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let priIndex = (screens.firstIndex(of: viewController) ?? 0) - 1
        if (screens.count < priIndex) {
            return screens[priIndex]
        } else {
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let nextIndex = (screens.firstIndex(of: viewController) ?? 0) + 1
        if (screens.count > nextIndex) {
            return screens[nextIndex]
        } else {
            return nil
        }
    }
    
}
