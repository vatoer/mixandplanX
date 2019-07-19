//
//  StepsViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 19/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let stepImages = ["chef", "pasar", "chef", "pasar"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for i in 0..<stepImages.count {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: stepImages[i])
           
            scrollView.contentSize.width = view.frame.size.width*CGFloat(i+1)
            scrollView.addSubview(imageView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.width
        
        pageControl.currentPage = Int(page)
    }
    
    
    func configurePageControl(){
        self.pageControl.numberOfPages = stepImages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        self.pageControl.pageIndicatorTintColor = UIColor(red: 255/255.0, green: 129/255.0, blue: 38/255.0, alpha: 100.0)
        self.scrollView.addSubview(pageControl)
        
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
