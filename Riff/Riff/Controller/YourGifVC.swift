//
//  YourGifVC.swift
//  Riff
//
//  Created by Boariu Andy on 7/31/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import Foundation
import UIKit
import GiphyCoreSDK
import SwiftyGif
import Firebase
import FirebaseDatabase

class YourGifVC: UIViewController {
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var lblQuoteText: UILabel!
    @IBOutlet weak var lblQuotePersona: UILabel!
    @IBOutlet weak var imgvGiff: UIImageView!
    
    var yourStatus = ""
    
    let gifManager = SwiftyGifManager(memoryLimit:20)
    
    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getAllGiphysForSearchText(strSearch: yourStatus)
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    private func setupUI() {
        viewTop.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewTop.layer.shadowOpacity = 0.3
        viewTop.layer.shadowRadius = 2.0
        viewTop.layer.shadowColor = UIColor.darkGray.cgColor
        
        //=>    Load random Quote
        let countOfQuotes = appDelegate.arrQuotes.count
        let x = arc4random_uniform(UInt32(countOfQuotes))
        let quote = appDelegate.arrQuotes[Int(x)]
        lblQuoteText.text = quote.text
        lblQuotePersona.text = quote.persona
    }
    
    private func loadGif(gif: GPHMedia) {
        let strUrl = "https://media.giphy.com/media/\(gif.id)/giphy.gif"
        if let url = URL(string: strUrl) {
            DispatchQueue.main.async {
                // Always update UI on the main thread
                //self.imgvGiff.setGifFromURL(url, manager: self.gifManager, loopCount: -1, showLoader: true)
                self.imgvGiff.setGifFromURL(url)
            }
        }
    }
    
    // MARK: - API Methods
    
    private func getAllGiphysForSearchText(strSearch: String) {
        GiphyCore.shared.search(strSearch) { [weak self] (response, error) in
            guard let me = self else { return }
            
            if let error = error as NSError? {
                let alert                = UIAlertController(title: "Oops", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                me.present(alert, animated: true, completion: nil)
                
                return
            }
            
            if let response = response,
                let data = response.data {
                //let pagination = response.pagination {
                
                if let gif = data.first {
                    print(gif.description)
                    me.loadGif(gif: gif)
                }
            }
            else {
                let alert                = UIAlertController(title: "Oops", message: "No gif available for your status", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                me.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Action Methods
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSeeOtherRiffsAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RiffsVC") as? RiffsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
