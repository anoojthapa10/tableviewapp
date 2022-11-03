//
//  SecondPageViewController.swift
//  tableViewOfArray
//
//  Created by Anuj Thapa on 10/28/22.
//

import UIKit

class SecondPageViewController: UIViewController {
    
    var image: UIImage?
    var name: String?
    var date: String?
    var gender: String?
    
    
    @IBOutlet weak var upcomingImage: UIImageView!
    @IBOutlet weak var upcomingname: UILabel!
    @IBOutlet weak var upcomingDOB: UILabel!
    @IBOutlet weak var upcomingGender: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingImage.image = image
        upcomingname.text = name
        upcomingDOB.text = date
        upcomingGender.text = gender
        self.navigationItem.title = "Family Members"
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
