//
//  VerticalScrollView.swift
//  Portfolio
//
//  Created by stud on 23/11/2018.
//  Copyright © 2018 Michal Legut. All rights reserved.
//

import UIKit

class VerticalScrollViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        var offset = scrollView.contentOffset
        offset.y = scrollView.frame.size.height * 1.5
        self.scrollView.setContentOffset(offset, animated: false)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        var offset = scrollView.contentOffset
        let rest = offset.y.truncatingRemainder(dividingBy: scrollView.frame.size.height * 0.25)
        if (rest < scrollView.frame.size.height * 0.125) {
            offset.y -= rest
        } else {
            offset.y += scrollView.frame.size.height * 0.25 - rest
        }
        scrollView.setContentOffset(offset, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset
        let rest = offset.y.truncatingRemainder(dividingBy: scrollView.frame.size.height * 0.25)
        if (rest < scrollView.frame.size.height * 0.125) {
            offset.y -= rest
        } else {
            offset.y += scrollView.frame.size.height * 0.25 - rest
        }
        scrollView.setContentOffset(offset, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset
        if (offset.y >= scrollView.frame.size.height * 3 || offset.y <= 0) {
            offset.y = scrollView.frame.size.height * 1.5
            scrollView.setContentOffset(offset, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let vc = segue.destination as? HorizontalScrollViewController
        vc?.multiplier = Int(segue.identifier ?? "0") ?? 0
    }
}
