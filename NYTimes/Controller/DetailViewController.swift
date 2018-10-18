//
//  DetailViewController.swift
//  NYTimes
//
//  Created by Ankit katiyar on 18/10/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblAbstract: UILabel!
    
    
    var strTitle = ""
    var strAbstract = ""

    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTitle.text = strTitle
        self.lblAbstract.text = strAbstract

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    @IBAction func backToPreviousView(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
