//
//  YourGifVC.swift
//  Riff
//
//  Created by Boariu Andy on 7/31/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit

class YourGifVC: UIViewController {
    
    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSeeOtherRiffsAction(_ sender: UIButton) {
        
    }
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
