//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Pierce Tu on 7/14/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation
import UIKit

class ProductsTableViewController: UITableViewController {
    
    private var products: [Product]?
    private let identifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [
            Product(name: "Apple", cellImageName: "apple", fullScreenImageName: "appleFull"),
            Product(name: "Banana", cellImageName: "banana", fullScreenImageName: "bananaFull"),
            Product(name: "Kiwi", cellImageName: "kiwi", fullScreenImageName: "kiwiFull")
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProduct" {
            if let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell),
                let productVC = segue.destination as? ProductsViewController {
                productVC.product = products?[indexPath.row]
            }
        }
    }
}

//
extension ProductsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        guard let products = products else { return cell }
        
        cell.textLabel?.text = products[indexPath.row].name
        
        if let imageName = products[indexPath.row].cellImageName {
            cell.imageView?.image = UIImage(named: imageName)
        }
        return cell
    }
}
