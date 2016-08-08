//
//  TreeViewController.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 01.07.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import UIKit

class TreeViewController: UIViewController {

    var pointerControllerRoot: PointerController<Node<Int>>!
    var pointerControllerFirst: PointerController<Node<Int>>!
    var pointerControllerLast: PointerController<Node<Int>>!

    @IBOutlet weak var rootStrongPointers: UILabel!
    @IBOutlet weak var rootWeakPointers: UILabel!
    @IBOutlet weak var rootElementValue: UILabel!
    @IBOutlet weak var strongStepper: UIStepper!
    @IBOutlet weak var weakStepper: UIStepper!

    @IBOutlet weak var firstStrongPointers: UILabel!
    @IBOutlet weak var firstWeakPointers: UILabel!
    @IBOutlet weak var firstElementValue: UILabel!

    @IBOutlet weak var lastStrongPointers: UILabel!
    @IBOutlet weak var lastWeakPointers: UILabel!
    @IBOutlet weak var lastElementValue: UILabel!

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}

// MARK: Actions
extension TreeViewController {
    @IBAction func resetButtonTap(sender: UIButton) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        populateTree()
        resetButton.setTitle("Reset", forState: .Normal)
        activityIndicator.stopAnimating()
    }

    func populateTree() {
        var tree = Tree(1)
        for i in 2...1024 {
            tree.add(i)
        }

        pointerControllerRoot = PointerController(something: tree.root)
        pointerControllerFirst = PointerController(something: tree.root.first)
        pointerControllerFirst.removeStrongPointer()
        pointerControllerLast = PointerController(something: tree.root.last)
        pointerControllerLast.removeStrongPointer()
        refresh()
        activateUI()
    }

    func activateUI() {
        self.strongStepper.enabled = true
        self.weakStepper.enabled = true
        self.refreshButton.enabled = true
    }
}

// MARK: Refresh
extension TreeViewController {
    @IBAction func refreshButtonTap(sender: UIButton) {
        refresh()
    }

    func refresh() {
        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            self.rootStrongPointers.text = "\(self.pointerControllerRoot.strongCount)"
            self.rootWeakPointers.text = "\(self.pointerControllerRoot.weakCount)"
            self.rootElementValue.text = "\(self.pointerControllerRoot.firstValue)"

            self.firstStrongPointers.text = "\(self.pointerControllerFirst.strongCount)"
            self.firstWeakPointers.text = "\(self.pointerControllerFirst.weakCount)"
            self.firstElementValue.text = "\(self.pointerControllerFirst.firstValue)"

            self.lastStrongPointers.text = "\(self.pointerControllerLast.strongCount)"
            self.lastWeakPointers.text = "\(self.pointerControllerLast.weakCount)"
            self.lastElementValue.text = "\(self.pointerControllerLast.firstValue)"

            self.strongStepper.value = Double(self.pointerControllerRoot.strongCount)
            self.weakStepper.value = Double(self.pointerControllerRoot.weakCount)
        }
    }
}

// MARK: Stepper
extension TreeViewController {
    @IBAction func strongStepperChanged(sender: UIStepper) {
        if sender.value > Double(pointerControllerRoot!.strongPointers.count) {
            pointerControllerRoot?.addStrongPointer()
        } else {
            pointerControllerRoot?.removeStrongPointer()
        }
        refresh()
    }

    @IBAction func weakStepperChanged(sender: UIStepper) {
        if sender.value > Double(pointerControllerRoot!.weakPointers.count) {
            pointerControllerRoot?.addWeakPointer()
        } else {
            pointerControllerRoot?.removeWeakPointer()
        }
        refresh()
    }
}
