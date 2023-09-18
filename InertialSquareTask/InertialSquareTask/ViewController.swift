//
//  ViewController.swift
//  InertialSquareTask
//
//  Created by Andrii's Macbook  on 18.09.2023.
//

import UIKit

class ViewController: UIViewController {
    var squareView: UIView!
    var animator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        squareView = UIView(frame: CGRect(x: self.view.center.x - 40, y: self.view.center.y - 40, width: 80, height: 80))
        squareView.backgroundColor = .systemBlue
        squareView.layer.cornerRadius = 8
        self.view.addSubview(squareView)
        animator = UIDynamicAnimator(referenceView: self.view)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(screenTapped(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
}

extension ViewController {
    @objc func screenTapped(_ gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: self.view)
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior)
        }
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tapLocation)
        snapBehavior.damping = 0.9
        animator.addBehavior(snapBehavior)
    }
}

