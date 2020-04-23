//
//  ViewController.swift
//  Animations
//
//  Created by Pierce Tu on 3/13/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

let headerHeight = 50.0
let duration = 1.5
let segueDetailIdentifier = "toAnimateDetail"

class ViewController: UIViewController {
    
    @IBOutlet var masterTableView: UITableView!
    
    // Hardcode load up list of different animations
    let items = ["2-Color", "Simple 2D Rotation", "Multicolor", "Multi Point Position", "BezierCurve Position",
    "Color and Frame Change", "View Fade In", "Pop"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
        self.title = "Animations"
    }
    
    func animateTable() {
        masterTableView.reloadData()
        
        let cells = masterTableView.visibleCells
        let tableHeight = masterTableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        for cell in cells {
            // Higher delay = slower load time. 
            UIView.animate(withDuration: duration, delay: 0.01 * Double(index), usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetailIdentifier {
            let detailView = segue.destination as! DetailViewController
            let indexPath = masterTableView.indexPathForSelectedRow
            
            if let indexPath = indexPath {
                detailView.title = self.items[(indexPath as NSIndexPath).row]
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    // Assigning header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    
    // Assiging header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Basic Animations"
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.items[(indexPath as NSIndexPath).row]
        
        return cell
    }
}

