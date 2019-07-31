//
//  ViewController.swift
//  StopWatch
//
//  Created by Pierce Tu on 7/17/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    fileprivate let mainStopWatch: StopWatch = StopWatch()
    fileprivate let secondStopWatch: StopWatch = StopWatch()
    fileprivate var isActive: Bool = false
    fileprivate var laps: [String] = []

    @IBOutlet weak var lapTimerLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lapResetButton: UIButton!
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var lapsTableView: UITableView!
    
    @IBAction func startPauseButton(_ sender: AnyObject) {
        lapResetButton.isEnabled = true
        
        changeButton(lapResetButton, title: "Lap", titleColor: UIColor.black)
        
        if(!isActive) {
            unowned let weakSelf = self
            
            mainStopWatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateMainTimer, userInfo: nil, repeats: true)
            secondStopWatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateSecondTimer, userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopWatch.timer, forMode: RunLoop.Mode.common)
            RunLoop.current.add(secondStopWatch.timer, forMode: RunLoop.Mode.common)
            
            isActive = true
            changeButton(startPauseButton, title: "Stop", titleColor: UIColor.red)
        } else {
            
            mainStopWatch.timer.invalidate()
            secondStopWatch.timer.invalidate()
            isActive = false
            changeButton(startPauseButton, title: "Start", titleColor: UIColor.green)
            changeButton(lapResetButton, title: "Reset", titleColor: UIColor.black)
        }
    }
    
    @IBAction func lapResetButton(_ sender: AnyObject) {
        if(!isActive) {
            resetMainTimer()
            resetLapTimer()
            changeButton(lapResetButton, title: "Lap", titleColor: UIColor.lightGray)
            lapResetButton.isEnabled = false
        } else {
            if let timerLabelText = timerLabel.text {
                laps.append(timerLabelText)
            }
            lapsTableView.reloadData()
            resetLapTimer()
            unowned let weakSelf = self
            secondStopWatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateSecondTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(secondStopWatch.timer, forMode: RunLoop.Mode.common)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let initCircleButton: (UIButton) -> Void = { button in
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        
        initCircleButton(lapResetButton)
        initCircleButton(startPauseButton)
    
        lapResetButton.isEnabled = false
        
        lapsTableView.delegate = self
        lapsTableView.dataSource = self
        
    }
    
    // No AutoRotate
    override var shouldAutorotate : Bool {
        return false
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    fileprivate func changeButton(_ button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: UIControl.State())
        button.setTitleColor(titleColor, for: UIControl.State())
    }
    
    fileprivate func resetMainTimer() {
        resetTimer(mainStopWatch, label: timerLabel)
        laps.removeAll()
        lapsTableView.reloadData()
    }
    
    fileprivate func resetLapTimer() {
        resetTimer(secondStopWatch, label: lapTimerLabel)
    }
    
    fileprivate func resetTimer(_ stopwatch: StopWatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00.00"
    }
    
    @objc func updateMainTimer() {
        updateTimer(mainStopWatch, label: timerLabel)
    }
    
    @objc func updateSecondTimer() {
        updateTimer(secondStopWatch, label: lapTimerLabel)
    }
    
    func updateTimer(_ stopwatch: StopWatch, label: UILabel) {
        stopwatch.counter = stopwatch.counter + 0.035
        
        var minutes: String = "\((Int)(stopwatch.counter / 60))"
        if ((Int)(stopwatch.counter / 60) < 10) {
            minutes = "0\((Int)(stopwatch.counter / 60))"
        }
        
        var seconds: String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "lapCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap \(laps.count - (indexPath as NSIndexPath).row)"
        }
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
        }

        return cell
    }
}

fileprivate extension Selector {
    static let updateMainTimer = #selector(ViewController.updateMainTimer)
    static let updateSecondTimer = #selector(ViewController.updateSecondTimer)
}

