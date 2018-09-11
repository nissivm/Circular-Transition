//
//  BlueScreen.swift
//  Circular transition
//  Copyright © 2018 App Magic. All rights reserved.
//

import UIKit

class BlueScreen: UIViewController
{
    @IBOutlet weak var openGreenScreenButton: UIButton!
    @IBOutlet weak var openPinkScreenButton: UIButton!
    
    //----------------------------------------------------------------------//
    // MARK: Initialization / Deinitialization
    //----------------------------------------------------------------------//
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        openGreenScreenButton.layer.cornerRadius = 25.0
        openPinkScreenButton.layer.cornerRadius = 25.0
    }
    
    //----------------------------------------------------------------------//
    // MARK: IBActions
    //----------------------------------------------------------------------//
    
    @IBAction func openGreenScreenButtonTapped(_ sender: UIButton)
    {
        sender.tag = 20
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GreenScreen") as! GreenScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openPinkScreenButtonTapped(_ sender: UIButton)
    {
        sender.tag = 20
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PinkScreen") as! PinkScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //----------------------------------------------------------------------//
    // MARK: Memory Warning
    //----------------------------------------------------------------------//

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
