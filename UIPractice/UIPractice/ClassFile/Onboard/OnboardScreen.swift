import UIKit

class OnboardScreen: UIViewController, Storyboarded {

    // MARK: - IBOutlet
    @IBOutlet weak var onBoardScreenCollection: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var rightTitleButton: RightTitle!
    
    // MARK: - Variables
    var coordinator: NavigationCoordinator?
    private var currentPage = 0
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.numberOfPages = onboardingValues.count
        rightTitleButton.clickEvent = { [weak self] in
            self?.coordinator?.openSignInScreen()
        }
    }
    
}

// MARK: - extension UICollectionViewDataSource
extension OnboardScreen: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = onBoardScreenCollection.dequeueReusableCell(withReuseIdentifier: "OnboardScreen", for: indexPath) as? OnboardCollectionCell else {
            return UICollectionViewCell()
        }
        let data = onboardingValues[indexPath.row]
        cell.configureCellValue(imageName: data.image, title: data.title, decription: data.description)
        return cell
    }
    
}

// MARK: - extension UICollectionViewDelegateFlowLayout
extension OnboardScreen: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageController.currentPage = currentPage
        if currentPage == (onboardingValues.count - 1) {
            rightTitleButton.labelText = "Done"
        } else {
            rightTitleButton.labelText = "Skip"
        }
    }
    
}
