//
//  ColorDetailViewController.swift
//  Rainblow
//
//  Created by Michael Redig on 7/15/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
	var color: MyColor? {
		didSet {
			updateViews()
		}
	}

	func updateViews() {
		view.backgroundColor = color?.color
		navigationItem.title = color?.name
	}
}
