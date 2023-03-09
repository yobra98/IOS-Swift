//
//  ViewController.swift
//  iOSProgressView
//
//  Created by Anupam Chugh on 13/07/18.
//  Copyright © 2018 JournalDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    var isRed = false
    var progressBarTimer: Timer!
    var isRunning = false
    @IBAction func btnStart(_ sender: Any) {
        
        if(isRunning){
            progressBarTimer.invalidate()
            btn.setTitle("Start", for: .normal)
        }
        else{
        btn.setTitle("Stop", for: .normal)
        progressView.progress = 0.0
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.updateProgressView), userInfo: nil, repeats: true)
        if(isRed){
            progressView.progressTintColor = UIColor.blue
            progressView.progressViewStyle = .default
        }
        else{
            progressView.progressTintColor = UIColor.red
            progressView.progressViewStyle = .bar
            
        }
        isRed = !isRed
        }
        isRunning = !isRunning
    }
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressView.progress = 0.0
        
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateProgressView(){
        progressView.progress += 0.1
        progressView.setProgress(progressView.progress, animated: true)
        if(progressView.progress == 1.0)
        {
            progressBarTimer.invalidate()
            isRunning = false
            btn.setTitle("Start", for: .normal)
        }
    }
}

