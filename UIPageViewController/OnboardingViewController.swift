import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var pages: [UIViewController] = {
        let red = UIViewController()
        red.view.backgroundColor = .red
        
        let green = UIViewController()
        green.view.backgroundColor = .green
        
        let blue = UIViewController()
        blue.view.backgroundColor = .blue
        
        return [red, green, blue]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //устанавливаем OnboardingViewController собственным DataSource
        dataSource = self
        
        if let first = pages.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
    }
    
// MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //возвращаем предыдущий (относительно переданного viewController) дочерний контроллер
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //возвращаем следующий (относительно переданного viewController) дочерний контроллер
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else {
            return nil
        }
        
        return pages[nextIndex]
    }
}

