//
//  AboutAViewController.swift
//  Fractured
//
//  Created by Omar Peracha on 04/09/2017.
//  Copyright © 2017 Omar Peracha. All rights reserved.
//

import UIKit

class AboutAViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var opButton: UIButton!
    
    @IBAction func opLink(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://omarperacha.com")!)
    }
    
    @IBOutlet weak var amtButton: UIButton!
    
    @IBAction func amtLink(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "http://www.ashleighmaythompson.com/?page_id=68")!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadVar = 1
        
        backButton.layer.borderWidth = 0.5
        backButton.layer.borderColor = UIColor.black.cgColor
        
        opButton.layer.borderWidth = 0.5
        opButton.layer.borderColor = UIColor.black.cgColor
        
        amtButton.layer.borderWidth = 0.5
        amtButton.layer.borderColor = UIColor.black.cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
