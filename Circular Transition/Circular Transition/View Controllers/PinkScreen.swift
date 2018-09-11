//
//  PinkScreen.swift
//  Circular transition
//  Copyright © 2018 App Magic. All rights reserved.
//

import UIKit

class PinkScreen: UIViewController
{
    @IBOutlet weak var closeButton: UIButton!
    
    //----------------------------------------------------------------------//
    // MARK: Initialization / Deinitialization
    //----------------------------------------------------------------------//
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        closeButton.layer.cornerRadius = 25.0
    }
    
    //----------------------------------------------------------------------//
    // MARK: IBActions
    //----------------------------------------------------------------------//
    
    @IBAction func closeButtonTapped(_ sender: UIButton)
    {
        sender.tag = 20
        navigationController?.popViewController(animated: true)
    }
    
    //----------------------------------------------------------------------//
    // MARK: Memory Warning
    //----------------------------------------------------------------------//

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
