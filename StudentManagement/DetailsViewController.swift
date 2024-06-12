//
//  DetailsViewController.swift
//  StudentManagement
//
//  Created by E5000861 on 07/06/24.
//

import UIKit

class DetailsViewController: UIViewController {

    var student: Student?
    
    var detailimageView = UIImageView()
    var idLabel = UILabel()
    var studentId = UILabel()
    var nameLabel = UILabel()
    var studentName = UILabel()
    var dateOfBirthLabel = UILabel()
    var dateOfBirth = UILabel()
    var ageLabel2 = UILabel()
    var studentAge = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp(){
        detailimageView.contentMode = .scaleAspectFill
        detailimageView.backgroundColor = .white
        detailimageView.isUserInteractionEnabled = true
        detailimageView.translatesAutoresizingMaskIntoConstraints = false
        detailimageView.layer.cornerRadius = 75 // Half of the width/height to make it circular
        detailimageView.layer.masksToBounds = true
        detailimageView.image = student?.photo
        view.addSubview(detailimageView)
        NSLayoutConstraint.activate([
            detailimageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            detailimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailimageView.heightAnchor.constraint(equalToConstant: 150),
            detailimageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        
        idLabel.text = "Id"
        idLabel.textColor = .white
        idLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idLabel)
        
        studentId.text = String(student!.id)
        studentId.textColor = .white
        studentId.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(studentId)
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: detailimageView.bottomAnchor, constant: 30),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            idLabel.widthAnchor.constraint(equalToConstant: 150),
            
            studentId.centerYAnchor.constraint(equalTo: idLabel.centerYAnchor),
            studentId.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 50),
            studentId.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            studentId.heightAnchor.constraint(equalToConstant: 50)
        ])
        

        
        nameLabel.text = "Name   "
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        studentName.text = student?.name
        studentName.textColor = .black
        studentName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(studentName)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            studentName.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            studentName.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 50),
            studentName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            studentName.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        dateOfBirthLabel.text = "Date Of Birth "
        dateOfBirthLabel.textColor = .white
        dateOfBirthLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        dateOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateOfBirthLabel)
        
        if let date = student?.dateOfBirth {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd" // Set your desired date format
            dateOfBirth.text = dateFormatter.string(from: date)
        } else {
            print("Date is nil")
        }
        
        dateOfBirth.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirth.textColor = .white
        view.addSubview(dateOfBirth)
        
        NSLayoutConstraint.activate([
            dateOfBirthLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            dateOfBirthLabel.widthAnchor.constraint(equalToConstant: 150),
        
            dateOfBirth.centerYAnchor.constraint(equalTo: dateOfBirthLabel.centerYAnchor),
            dateOfBirth.leadingAnchor.constraint(equalTo: dateOfBirthLabel.trailingAnchor, constant: 50),
            dateOfBirth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateOfBirth.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        ageLabel2.text = "Age  "
        ageLabel2.textColor = .white
        ageLabel2.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        ageLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageLabel2)
        
        studentAge.text = String(student!.age)
        studentAge.textColor = .white
        studentAge.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(studentAge)
        
        NSLayoutConstraint.activate([
            ageLabel2.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 30),
            ageLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            ageLabel2.widthAnchor.constraint(equalToConstant: 150),
            
            studentAge.centerYAnchor.constraint(equalTo: ageLabel2.centerYAnchor),
            studentAge.leadingAnchor.constraint(equalTo: ageLabel2.trailingAnchor, constant: 50),
            studentAge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            studentAge.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
        
    }
    
    


