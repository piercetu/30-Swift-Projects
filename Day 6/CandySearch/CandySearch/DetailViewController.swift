//
//  DetailViewController.swift
//  CandySearch
//
//  Created by Pierce Tu on 10/18/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var candyLabel: UILabel!
    @IBOutlet weak var candyImage: UIImageView!

    var detailCandy: Candy? {
        didSet {
            configureView()
        }
    }

    func configureView() {
        if let detailCandy = detailCandy {
            if let candyLabel = candyLabel, let candyImage = candyImage {
                candyLabel.text = detailCandy.name
                candyImage.image = UIImage(named: detailCandy.name)
                title = detailCandy.category
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
    }

}
