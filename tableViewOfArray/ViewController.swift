//
//  ViewController.swift
//  tableViewOfArray
//
//  Created by Anuj Thapa on 10/24/22.
//

import UIKit

struct Person {
    var personImage: UIImage?
    var name: String
    var dOB: String
    var gender: String
    var Address: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var content: [Person] = []
    var myFamilyMember: [Person] = [] {
        didSet {
            tableOfPersonDetail.reloadData()
        }
    }
    
    @IBOutlet weak var tableOfPersonDetail: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableOfPersonDetail.dataSource = self
        tableOfPersonDetail.delegate = self
        let rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(openTappedOnFilter))
        let leftBrarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(openTappedOnSort))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.leftBarButtonItem = leftBrarButtonItem
        self.content = getPersons()
        myFamilyMember = content
        // Do any additional setup after loading the view.
    }
    
    @objc
    func openTappedOnFilter() {
        let filterBar = UIAlertController(title: "Filter", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Male", style: .default, handler: selectedMaleMember)
        let action2 = UIAlertAction(title: "Female", style: .default, handler: selectedFemaleMember)
        let action3 = UIAlertAction(title: "Cancel", style: .cancel)
        filterBar.addAction(action1)
        filterBar.addAction(action2)
        filterBar.addAction(action3)
        present(filterBar, animated: true)
    }
    
    @objc
    func openTappedOnSort() {
        let SortBar = UIAlertController(title: "Sort", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "DOB", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Alphabet", style: .default, handler: nil)
        let action3 = UIAlertAction(title: "Cancel", style: .cancel)
        SortBar.addAction(action1)
        SortBar.addAction(action2)
        SortBar.addAction(action3)
        present(SortBar, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFamilyMember.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOfPersonDetail.dequeueReusableCell(withIdentifier: "cellOfDetails", for: indexPath) as! PersonalDetailCell
        cell.personImageView.image = myFamilyMember[indexPath.row].personImage
        cell.personImageView.backgroundColor = UIColor.lightGray
        cell.personImageView.layer.cornerRadius = 8
        let dateprint = myFamilyMember[indexPath.row].dOB
        cell.nameLabel.text = myFamilyMember[indexPath.row].name
        cell.dOBLabel.text =  "\(convertedDate(dateprint)) "
        cell.genderLabel.text = myFamilyMember[indexPath.row].gender
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondPageViewController") as! SecondPageViewController
        controller.image = content[indexPath.row].personImage
        controller.name = content[indexPath.row].name
        controller.gender = content[indexPath.row].gender
        let dateprint = content[indexPath.row].dOB
        controller.date = "\(convertedDate(dateprint)) "
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func convertedDate(_ mydate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let newDate = dateFormatter.date(from: mydate)!
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let revievedDate = dateFormatter.string(from: newDate)
        return revievedDate
    }
    
    func getPersons() -> [Person] {
        return  [
            Person( personImage: nil, name: "Buwa", dOB: "2/12/2045", gender: "Male", Address: "kathmandu"),
            Person( personImage: nil, name: "Aama", dOB: "2/12/2046", gender: "Female", Address: "kathmandu"),
            Person( personImage: UIImage(named: "Achyut") , name: "Achyut", dOB: "2/12/2048", gender: "Male", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Pabitra"), name: "Pabitra", dOB: "2/12/2047", gender: "Female", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Archana"), name: "Archana", dOB: "2/12/2042", gender: "Female", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Sirose"), name: "Sirose", dOB: "2/12/2051", gender: "Male", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Sishir") , name: "Sishir", dOB: "2/12/2053", gender: "Male", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Rojina"), name: "Rojina", dOB: "2/12/2050", gender: "Female", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Arjun"), name: "Arjun", dOB: "2/12/2060", gender: "Male", Address:  "kathmandu"),
            Person(personImage: UIImage(named: "Anoop"), name: "Anup", dOB: "2/12/2064", gender: "Male", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Rasila"), name: "Rasila", dOB: "1/12/2070", gender: "Female", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Rahul"), name: "Rahul", dOB: "2/12/2039", gender: "Male", Address: "kathmandu"),
            Person(personImage: UIImage(named: "Rashna"), name: "Rashna", dOB: "2/12/2038", gender: "Female", Address: "kathmandu"),
            Person( personImage: UIImage(named: "Suraj") , name: "Suraj", dOB: "2/12/2033", gender: "Male", Address: "kathmandu"),
            Person( personImage: UIImage(named: "Amrit") , name: "Amrit", dOB: "2/12/2022", gender: "Male", Address: "kathmandu"),
            Person( personImage: UIImage(named: "Rabita") , name: "Rabita", dOB: "2/12/2071", gender: "Female", Address: "kathmandu"),
            Person( personImage: UIImage(named: "Punam") , name: "Punam", dOB: "2/12/2077", gender: "Female", Address: "kathmandu"),
            Person( personImage: UIImage(named: "Baburaja") , name: "Baburaja", dOB: "2/12/2045", gender: "Male", Address: "kathmandu"),
            Person( personImage: nil , name: "Dinesh", dOB: "2/12/2045", gender: "Male", Address: "kathmandu")
        ]
    }
    func selectedMaleMember( _ :UIAlertAction) {
        // print("its been tapped")
        self.myFamilyMember = myFamilyMember.filter{ $0.gender == "Male"}
    }
    func selectedFemaleMember( _ :UIAlertAction) {
        // print("its been tapped")
        self.myFamilyMember = myFamilyMember.filter{ $0.gender == "Female"}
    }
}
