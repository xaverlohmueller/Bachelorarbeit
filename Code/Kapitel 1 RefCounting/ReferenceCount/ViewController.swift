//
//  ViewController.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 16.04.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var pointerController = PointerController(something: SomeClass())

	// MARK: Outlets
	@IBOutlet weak var strongPointersLabel: UILabel!
	@IBOutlet weak var rcPinnedFlag: UILabel!
	@IBOutlet weak var rcDeallocatingFlag: UILabel!

	@IBOutlet weak var weakPointersLabel: UILabel!
	@IBOutlet weak var rcUnusedFlag: UILabel!

    @IBOutlet weak var firstValueLabel: UILabel!

	@IBOutlet weak var strongStepper: UIStepper!
	@IBOutlet weak var weakStepper: UIStepper!
	@IBOutlet weak var unownedStepper: UIStepper!
	@IBOutlet weak var unownedUnsafeStepper: UIStepper!

	@IBOutlet weak var strongPointersCount: UILabel!
	@IBOutlet weak var weakPointersCount: UILabel!
	@IBOutlet weak var unownedPointersCount: UILabel!
	@IBOutlet weak var unownedUnsafePointersCount: UILabel!
}


// MARK: Life Cycle

extension ViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		refresh()
	}
}


// MARK: Actions

extension ViewController {
	@IBAction func reset() {
		pointerController = PointerController(something: SomeClass())
		refresh()
	}
	@IBAction func didChangeStrongPointers(sender: UIStepper) {
		if sender.value > Double(pointerController.strongPointers.count) {
			pointerController.addStrongPointer()
		} else {
			pointerController.removeStrongPointer()
		}
		refresh()
	}
	@IBAction func didChangeWeakPointers(sender: UIStepper) {
		if sender.value > Double(pointerController.weakPointers.count) {
			pointerController.addWeakPointer()
		} else {
			pointerController.removeWeakPointer()
		}
		refresh()
	}
	@IBAction func didChangeUnownedPointers(sender: UIStepper) {
		if sender.value > Double(pointerController.unownedPointers.count) {
			pointerController.addUnownedPointer()
		} else {
			pointerController.removeUnownedPointer()
		}
		refresh()
	}
	@IBAction func didChangeUnownedUnsafePointers(sender: UIStepper) {
		if sender.value > Double(pointerController.unownedUnsafePointers.count) {
			pointerController.addUnownedUnsafePointer()
		} else {
			pointerController.removeUnownedUnsafePointer()
		}
		refresh()
	}
}


// MARK: Get Pointer Info

extension ViewController {
	@IBAction func refresh() {
		dispatch_async(dispatch_get_main_queue()) { [unowned self] in
			self.strongPointersLabel.text = "Strong pointers: \(self.pointerController.strongCount)"
			self.rcPinnedFlag.text = "RC_PINNED_FLAG: \(self.pointerController.rcPinnedFlag)"
			self.rcDeallocatingFlag.text = "RC_DEALLOCATING_FLAG: \(self.pointerController.rcDeallocatingFlag)"
			self.weakPointersLabel.text = "Weak pointers: \(self.pointerController.weakCount)"
			self.rcUnusedFlag.text = "RC_UNUSED_FLAG: \(self.pointerController.rcUnusedFlag)"
            self.firstValueLabel.text = "First Value: \(self.pointerController.firstValue)"

			self.strongPointersCount.text = "\(self.pointerController.strongPointers.count)"
			self.weakPointersCount.text = "\(self.pointerController.weakPointers.count)"
			self.unownedPointersCount.text = "\(self.pointerController.unownedPointers.count)"
			self.unownedUnsafePointersCount.text = "\(self.pointerController.unownedUnsafePointers.count)"


			self.strongStepper.value = Double(self.pointerController.strongPointers.count)
			self.weakStepper.value = Double(self.pointerController.weakPointers.count)
			self.unownedStepper.value = Double(self.pointerController.unownedPointers.count)
			self.unownedUnsafeStepper.value = Double(self.pointerController.unownedUnsafePointers.count)
		}
	}
}
