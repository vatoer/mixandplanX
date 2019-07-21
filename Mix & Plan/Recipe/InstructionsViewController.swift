//
//  InstructionsViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 21/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class InstructionsViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var StepsListViewController: [UIViewController] = {
       let storyboard = UIStoryboard(name: "Recipe", bundle: nil)
        
        let step1 = storyboard.instantiateViewController(withIdentifier: "step1VC")
        let step2 = storyboard.instantiateViewController(withIdentifier: "step2VC")
        let step3 = storyboard.instantiateViewController(withIdentifier: "step3VC")
        let step4 = storyboard.instantiateViewController(withIdentifier: "step4VC")
        let step5 = storyboard.instantiateViewController(withIdentifier: "step5VC")
        
        
        return [step1, step2, step3, step4, step5]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstViewController = StepsListViewController.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = StepsListViewController.firstIndex(of: viewController) else { return nil }
        
        let prevIndex = vcIndex-1
        
        guard prevIndex >= 0 else {return nil}
        
        guard StepsListViewController.count > prevIndex else {return nil}
        
        return StepsListViewController[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = StepsListViewController.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex+1
        
        guard StepsListViewController.count != nextIndex else {return nil}
        
        guard StepsListViewController.count > nextIndex else {return nil}
        
        return StepsListViewController[nextIndex]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
