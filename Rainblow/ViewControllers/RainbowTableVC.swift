//
//  RainbowTableVC.swift
//  Rainblow
//
//  Created by Michael Redig on 7/15/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class RainbowTableVC: UITableViewController {
	let rainbowColors = [MyColor(color: .red, name: "Red"),
						 MyColor(color: .orange, name: "Orange"),
						 MyColor(color: .yellow, name: "Yellow"),
						 MyColor(color: .green, name: "Green"),
						 MyColor(color: .blue, name: "Blue"),
//						 MyColor(color: ., name: "Indigo"),
//						 MyColor(color: .vio, name: <#T##String#>)
						 ]
}

// MARK: - table view stuff
extension RainbowTableVC {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return rainbowColors.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "RainbowCell", for: indexPath)
		let colorAtIndex = rainbowColors[indexPath.row]
		cell.textLabel?.text = colorAtIndex.name
		return cell
	}
}
