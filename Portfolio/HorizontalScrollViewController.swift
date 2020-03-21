//
//  HorizontalScrollViewController.swift
//  Portfolio
//
//  Created by stud on 07/12/2018.
//  Copyright © 2018 Michal Legut. All rights reserved.
//

import UIKit

class HorizontalScrollViewController: UIViewController, UIScrollViewDelegate {
    var multiplier: Int = 0
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        var offset = scrollView.contentOffset
        offset.x = scrollView.frame.size.width * 12 + scrollView.frame.size.width * CGFloat(multiplier)
        self.scrollView.setContentOffset(offset, animated: false)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        var offset = scrollView.contentOffset
        let rest = offset.x.truncatingRemainder(dividingBy: scrollView.frame.size.width)
        if (rest < scrollView.frame.size.width * 0.5) {
            offset.x -= rest
        } else {
            offset.x += scrollView.frame.size.width - rest
        }
        scrollView.setContentOffset(offset, animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset
        let rest = offset.x.truncatingRemainder(dividingBy: scrollView.frame.size.width)
        if (rest < scrollView.frame.size.width * 0.5) {
            offset.x -= rest
        } else {
            offset.x += scrollView.frame.size.width - rest
        }
        scrollView.setContentOffset(offset, animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset
        if (offset.x >= scrollView.frame.size.width * 24 || offset.x <= 0) {
            offset.x = scrollView.frame.size.width * 12
            scrollView.setContentOffset(offset, animated: false)
        }
    }
}
