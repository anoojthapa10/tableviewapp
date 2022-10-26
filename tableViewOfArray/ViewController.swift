//
//  ViewController.swift
//  tableViewOfArray
//
//  Created by Anuj Thapa on 10/24/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableOfPersonDetail: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableOfPersonDetail.dataSource = self
        tableOfPersonDetail.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    struct Person {
        var personImage: UIImage?
        var name: String
        var dOB: String
        var gender: String
        var Address: String
    }
    
    let content: [Person] = [
        Person( personImage: nil , name: "Buwa", dOB: "2045/12/2", gender: "Male", Address: "kathmandu"),
        Person( personImage: nil , name: "Aama", dOB: "2045/12/2", gender: "Female", Address: "kathmandu"),
        Person( personImage: UIImage(named: "Achyut") , name: "Achyut", dOB: "2045/12/2", gender: "Male", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Pabitra"), name: "Pabitra", dOB: "2049/12/2", gender: "Female", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Archana"), name: "Archana", dOB: "2046/12/2", gender: "Female", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Sirose"), name: "Sirose", dOB: "2047/12/2", gender: "Male", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Sishir") , name: "Sishir", dOB: "2048/12/2", gender: "Male", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Rojina"), name: "Rojina", dOB: "2049/12/2", gender: "Female", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Arjun"), name: "Arjun", dOB: "2049/12/2", gender: "Male", Address:  "kathmandu"),
        Person(personImage: UIImage(named: "Anoop"), name: "Anup", dOB: "2049/12/2", gender: "Male", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Rasila"), name: "Rasila", dOB: "2049/12/2", gender: "Female", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Rahul"), name: "Rahul", dOB: "2049/12/2", gender: "Male", Address: "kathmandu"),
        Person(personImage: UIImage(named: "Rashna"), name: "Rashna", dOB: "2049/12/2", gender: "Female", Address: "kathmandu"),
        Person( personImage: UIImage(named: "Suraj") , name: "Suraj", dOB: "2045/12/2", gender: "Male", Address: "kathmandu"),
        Person( personImage: UIImage(named: "Amrit") , name: "Amrit", dOB: "2045/12/2", gender: "Male", Address: "kathmandu"),
        Person( personImage: UIImage(named: "Rabita") , name: "Rabita", dOB: "2045/12/2", gender: "Male", Address: "kathmandu"),
        Person( personImage: UIImage(named: "Punam") , name: "Punam", dOB: "2045/12/2", gender: "Female", Address: "kathmandu"),
        Person( personImage: UIImage(named: "Baburaja") , name: "Baburaja", dOB: "2045/12/2", gender: "Male", Address: "kathmandu"),
        Person( personImage: nil , name: "Dinesh", dOB: "2045/12/2", gender: "Male", Address: "kathmandu")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOfPersonDetail.dequeueReusableCell(withIdentifier: "cellOfDetails", for: indexPath) as! PersonalDetailCell
        cell.personImageView.image = content[indexPath.row].personImage
        cell.personImageView.backgroundColor = UIColor.lightGray
        cell.personImageView.layer.cornerRadius = 8
        cell.nameLabel.text = content[indexPath.row].name
        cell.dOBLabel.text = content[indexPath.row].dOB
        cell.genderLabel.text = content[indexPath.row].gender
        return cell
    }
    
    
}

