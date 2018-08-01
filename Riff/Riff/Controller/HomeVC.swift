//
//  ViewController.swift
//  Riff
//
//  Created by Boariu Andy on 7/27/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

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
        
        txvDescription.layer.borderWidth = 1.0
        txvDescription.layer.borderColor = UIColor.gray.cgColor
        
        btnFemale.layer.masksToBounds = true
        btnMale.layer.masksToBounds = true
        btnFemale.layer.cornerRadius = btnFemale.frame.size.height / 2
        btnMale.layer.cornerRadius = btnMale.frame.size.height / 2
    }
    
    private func checkIfUserProfileDetailsFilledCorectly() -> Bool {
        if !btnMale.isSelected && !btnFemale.isSelected
        {
            let alert                = UIAlertController(title: "Oops", message: "Please select your gender!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        if (txfAge.text?.isEmpty)! {
            let alert                = UIAlertController(title: "Oops", message: "Please enter your age!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        if txvDescription.text.isEmpty {
            let alert                = UIAlertController(title: "Oops", message: "Please enter your riff!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        
        if checkIfUserProfileDetailsFilledCorectly() == true {
            let riffItem = [
                Constants.RiffKeys.gender  : btnMale.isSelected ? "male" : "female",
                Constants.RiffKeys.age     : txfAge.text!,
                Constants.RiffKeys.status  : txvDescription.text!,
                ] as [String : Any]
            
            appDelegate.ref.child(Constants.RiffKeys.riff).childByAutoId().setValue(riffItem) { (error, snapshot) in
                if let err = error {
                    let alert                = UIAlertController(title: "Oops", message: err as! String, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "YourGifVC") as? YourGifVC
                    vc?.yourStatus = self.txvDescription.text
                    
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
        }
    }
    
    
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? .red : .clear
        
        btnMale.isSelected = false
        btnMale.backgroundColor = UIColor.clear
        
        view.endEditing(true)
        
    }
    
    @IBAction func btnMaleAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? .blue : .clear
        
        btnFemale.isSelected = false
        btnFemale.backgroundColor = UIColor.clear
        
        view.endEditing(true)
    }
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

