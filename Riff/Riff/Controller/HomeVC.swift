//
//  ViewController.swift
//  Riff
//
//  Created by Boariu Andy on 7/27/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var txfAge: UITextField!
    @IBOutlet weak var txvDescription: UITextView!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    private func setupUI() {
        viewTop.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewTop.layer.shadowOpacity = 0.3
        viewTop.layer.shadowRadius = 2.0
        viewTop.layer.shadowColor = UIColor.darkGray.cgColor
        
        btnFemale.layer.masksToBounds = true
        btnMale.layer.masksToBounds = true
        btnFemale.layer.cornerRadius = btnFemale.frame.size.height / 2
        btnMale.layer.cornerRadius = btnMale.frame.size.height / 2
    }
    
    
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnMaleAction(_ sender: UIButton) {
        
    }
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

