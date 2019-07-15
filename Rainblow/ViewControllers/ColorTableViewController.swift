//
//  ColorTableViewController.swift
//  Rainblow
//
//  Created by Michael Redig on 7/15/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ColorTableViewController: UITableViewController {

	// extra!
	@IBOutlet var doubleRainbowButton: UIBarButtonItem!

	let basicRainbowColors = [MyColor(color: .red, name: "Red"),
						 MyColor(color: .orange, name: "Orange"),
						 MyColor(color: .yellow, name: "Yellow"),
						 MyColor(color: .green, name: "Green"),
						 MyColor(color: .blue, name: "Blue"),
						 MyColor(color: UIColor(red: 0.294, green: 0, blue: 0.51, alpha: 1), name: "Indigo"),
						 MyColor(color: UIColor(red: 0.933, green: 0.51, blue: 0.933, alpha: 1.0), name: "Violet")
						 ]

	var rainbowColors: [MyColor] = []

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowColorDetail" {
			if let colorDetailVC = segue.destination as? ColorDetailViewController {
				guard let colorIndex = tableView.indexPathForSelectedRow else { return }
				let selectedColor = rainbowColors[colorIndex.row]
				colorDetailVC.color = selectedColor
			}
		}
	}

	// extra!
	@IBAction func doubleRainbowPressed(_ sender: UIBarButtonItem) {
		if rainbowColors.count > basicRainbowColors.count {
			rainbowColors = basicRainbowColors
		} else {
			rainbowColors += basicRainbowColors
		}
		tableView.reloadData()
	}

	//extra!
	override func viewDidLoad() {
		super.viewDidLoad()
		rainbowColors = basicRainbowColors
	}
}

// MARK: - table view stuff
extension ColorTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return rainbowColors.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "RainbowCell", for: indexPath)
		let colorAtIndex = rainbowColors[indexPath.row]
		cell.textLabel?.text = colorAtIndex.name
		cell.backgroundColor = colorAtIndex.color
		return cell
	}
}
