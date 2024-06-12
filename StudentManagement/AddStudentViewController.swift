//
//  AddStudentViewController.swift
//  StudentManagement
//
//  Created by E5000861 on 07/06/24.
//


import UIKit


class AddStudentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var imageView1 = UIImageView()
    let profileImageLabel = UILabel()
    let idTextField = UITextField()
    let nameTextField = UITextField()
    var dateLabel = UILabel()
    let datePicker = UIDatePicker()
    let ageLabel = UILabel()
    let ageTextField = UITextField()
    let saveButton = UIButton()
    let agePicker = UIPickerView()
    let numbers: [Int] = Array(1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        // Image View
        imageView1.contentMode = .scaleAspectFill
        imageView1.backgroundColor = .white
        imageView1.isUserInteractionEnabled = true
        imageView1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImage)))
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.layer.cornerRadius = 75 // Half of the width/height to make it circular
        imageView1.layer.masksToBounds = true
        imageView1.image = UIImage(named: "student")
        view.addSubview(imageView1)
        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView1.heightAnchor.constraint(equalToConstant: 150),
            imageView1.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        // Profile Image Label
        profileImageLabel.text = "Select Profile Image"
        profileImageLabel.textColor = .white
        profileImageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        profileImageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageLabel)
        NSLayoutConstraint.activate([
            profileImageLabel.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 15),
            profileImageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // ID Text Field
        idTextField.placeholder = "Enter ID"
        idTextField.borderStyle = .roundedRect
        view.addSubview(idTextField)
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: profileImageLabel.bottomAnchor, constant: 40),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Name Text Field
        nameTextField.placeholder = "Enter Name"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Date Label and Picker
        dateLabel.text = "Date of Birth: "
        dateLabel.textColor = .white
        dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        datePicker.backgroundColor = .white
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 150),
            
            datePicker.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            datePicker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            datePicker.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Age Label and Picker
        ageLabel.text = "Age: "
        ageLabel.textColor = .white
        ageLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageLabel)
        
        agePicker.delegate = self
        agePicker.dataSource = self
        agePicker.backgroundColor = .white
        agePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(agePicker)
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageLabel.widthAnchor.constraint(equalToConstant: 150),
            
            agePicker.centerYAnchor.constraint(equalTo: ageLabel.centerYAnchor),
            agePicker.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: 10),
            agePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            agePicker.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Save Button
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .white
        saveButton.layer.cornerRadius = 5
        saveButton.addTarget(self, action: #selector(saveStudent), for: .touchUpInside)
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: agePicker.bottomAnchor, constant: 50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func selectImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @objc func saveStudent() {
        if !validateID() || !validateName() || !validateAge() {
                    return
                }
                
                guard let id = idTextField.text,
                      let name = nameTextField.text,
                      let age = ageTextField.text,
                      let profileImage = imageView1.image else {
                    showAlert(message: "Please fill all fields and select an image.")
                    return
                }
                
                let newStudent = Student(id: Int(id) ?? 0, name: name, dateOfBirth: datePicker.date, photo: profileImage, age: Int(age) ?? 0)
                
                StudentDataModel.shared.students.append(newStudent)
                clearFields()
                showAlert(message: "Student data saved successfully.")
       }
    
    func clearFields() {
        idTextField.text = ""
        nameTextField.text = ""
        datePicker.date = Date()
        ageTextField.text = ""
        imageView1.image = nil
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // UIImagePickerControllerDelegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView1.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    // UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numbers[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageTextField.text = "\(numbers[row])"
        
    }
    
    func validateID() -> Bool {
         guard let id = idTextField.text, !id.isEmpty else {
             showAlert(message: "ID cannot be empty.")
             return false
         }
         guard let _ = Int(id) else {
             showAlert(message: "Please enter a numeric value for ID.")
             return false
         }
        if id.count > 5 {
            showAlert(message: "Id should contain less than 5 digits.")
            return false
        }
        
         return true
     }
     
     func validateName() -> Bool {
         guard let name = nameTextField.text, !name.isEmpty else {
             showAlert(message: "Name cannot be empty.")
             return false
         }
         let nameCharacterSet = CharacterSet.letters.union(CharacterSet.whitespaces)
         if name.rangeOfCharacter(from: nameCharacterSet.inverted) != nil {
             showAlert(message: "Please enter a valid name (alphabetic characters only) .")
             return false
         }
         return true
     }
     
     func validateAge() -> Bool {
         guard let age = ageTextField.text, !age.isEmpty else {
             showAlert(message: "Age cannot be empty.")
             return false
         }
         guard let _ = Int(age) else {
             showAlert(message: "Please enter a numeric age.")
             return false
         }
         return true
     }
    
  
   
}
