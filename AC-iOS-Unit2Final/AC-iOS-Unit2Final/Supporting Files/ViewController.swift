//
//  ViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by Maryann Yin on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var crayonColors: [Crayon] = Crayon.allTheCrayons
    
    @IBOutlet weak var crayonColorsTableView: UITableView!
    
    @IBOutlet weak var crayonAppName: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colourful = self.crayonColors[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonProperties", for: indexPath)
        cell.textLabel?.text = colourful.name
        cell.detailTextLabel?.text = "Hex Number: " + colourful.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(colourful.red/255), green: CGFloat(colourful.green/255), blue: CGFloat(colourful.blue/255), alpha: 1.0)
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.crayonColorsTableView.delegate = self
        self.crayonColorsTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let selectedColor = crayonColors[crayonColorsTableView.indexPathForSelectedRow!.row]
            destination.crayonColorCluster = selectedColor
        }
    }

}
