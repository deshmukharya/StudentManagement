//
//  StudentsListViewController.swift
//  StudentManagement
//
//  Created by E5000861 on 07/06/24.
//
//Implement a UITabbar controller
//the first tab has a navigation controller with a list of students(photo, names),
//click on any row should navigate to the second screen and display student details(id, name, age, photo, date)
//the second tab has add student details(age - uipickerview, date - uidatepicker)
//after adding student, student will display 1st tab.
//Photo - pick from library and update

import UIKit

class StudentsListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  

    @IBOutlet  weak var tableView : UITableView!
   
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
        
    }
  
    override func viewDidLoad() {
          super.viewDidLoad()
          setUp()
      }
      
      func setUp() {
          tableView.delegate = self
          tableView.dataSource = self
          tableView.separatorColor = UIColor.black
       
      }

      func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return StudentDataModel.shared.students.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
          let student = StudentDataModel.shared.students[indexPath.row]
          cell.profileImage.image = student.photo
          cell.studentName.text = student.name
          cell.studentName.textColor = .black
          return cell
      }

      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 90
      }

      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "listView", sender: nil)
      }

      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "listView" {
              if let indexPath = tableView.indexPathForSelectedRow {
                  let destinationController = segue.destination as! DetailsViewController
                  destinationController.student = StudentDataModel.shared.students[indexPath.row]
                  tableView.deselectRow(at: indexPath, animated: false)
              }
          }
      }
      
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          tableView.reloadData()  // Reload data every time the view appears
      }
  }
