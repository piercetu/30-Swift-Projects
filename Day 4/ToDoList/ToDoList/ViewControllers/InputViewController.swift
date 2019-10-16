//
//  InputViewController.swift
//  ToDoList
//
//  Created by Pierce Tu on 9/9/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import UIKit
import CoreLocation

class InputViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    lazy var geocoder = CLGeocoder()
    var itemManager: ToDoItemManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        locationTextField.delegate = self
        descriptionTextField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func save() {
        guard let titleString = titleTextField.text, titleString.count > 0 else {
            return
        }
        
        // datePicker can be nil if VC init via code
        var date: Date?
        if datePicker != nil {
            date = datePicker.date
        }
        
        // descriptionTextField can be nil if VC init via code
        var descriptionString: String?
        if descriptionTextField != nil {
            descriptionString = descriptionTextField.text
        }
        
        // locationTextField can be nil if VC init via code
        var placeMark: CLPlacemark?
        var locationName: String?
        
        if locationTextField != nil {
            locationName = locationTextField.text
            if let locationName = locationName, locationName.count > 0 {
                geocoder.geocodeAddressString(locationName) { [weak self] placeMarks, _ in
                    placeMark = placeMarks?.first
                    
                    let item = ToDoItem(title: titleString,
                                        itemDescription: descriptionString,
                                        timestamp: date?.timeIntervalSince1970,
                                        location: Location(name: locationName, coordinate: placeMark?.location?.coordinate))
                    
                    DispatchQueue.main.async {
                        self?.itemManager?.add(item)
                        self?.dismiss(animated: true)
                    }
                }
            } else {
                let item = ToDoItem(title: titleString,
                                    itemDescription: descriptionString,
                                    timestamp: date?.timeIntervalSince1970,
                                    location: nil)
                self.itemManager?.add(item)
                self.dismiss(animated: true)
            }
        } else {
            let item = ToDoItem(title: titleString,
                                itemDescription: descriptionString,
                                timestamp: date?.timeIntervalSince1970)
            self.itemManager?.add(item)
            self.dismiss(animated: true)
        }
    }

    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
}

extension InputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        view.endEditing(true)
        return false
    }
}
