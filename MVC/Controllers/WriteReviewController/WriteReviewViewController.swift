//
//  WriteReviewViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 19.02.2023.
//

import UIKit
import Kingfisher

class WriteReviewViewController: UIViewController {
    
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    
    var productImageUrl = String()
    var productName = String()
    
    let coloredSafeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return view
    }()
    
    let navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        return view
    }()
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.backward.circle.fill")
        return image
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    let navigationTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Новый отзыв"
        label.textColor = .white
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let productView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeShadow()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.kf.indicatorType = .activity
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = .systemGray
        return label
    }()
    
    let nameTFContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeShadow()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .systemGray
        label.text = "*Имя:"
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите имя"
        textField.font = UIFont(name: "Helvetica", size: 14)
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .systemGray6
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 5
        textField.leftView = view
        textField.leftViewMode = .always
        textField.rightView = view
        textField.rightViewMode = .always
        return textField
    }()
    
    let emailTFContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeShadow()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .systemGray
        label.text = "*e-mail:"
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        var attribute = NSAttributedString()
        textField.font = UIFont(name: "Helvetica", size: 14)
        textField.placeholder = "Введите e-mail"
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .systemGray6
        textField.leftView = view
        textField.leftViewMode = .always
        textField.rightView = view
        textField.rightViewMode = .always
        return textField
    }()
    
    let reviewTFContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeShadow()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .systemGray
        label.text = "*Комментарий:"
        return label
    }()
        
    let reviewTextView: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.textContainerInset.left = 10
        textView.textContainerInset.right = 10
        textView.layer.cornerRadius = 5
        textView.backgroundColor = .systemGray6
        return textView
    }()
    
    let sendReviewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        button.setTitle("ОТПРАВИТЬ", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.setTitleColor( #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1) , for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.9072937369, green: 0.3698979914, blue: 0.4464819431, alpha: 1)
        button.titleLabel?.font = UIFont(name: "helvetica-Bold", size: 14)
        return button
    }()
    
    let tapOnScreen = UITapGestureRecognizer()
    
    let rulesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.systemGray3,
                     NSAttributedString.Key.font: UIFont(name: "Helvetica-light", size: 14)!,
                     NSAttributedString.Key.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle as NSString
                     ]
        let string = NSAttributedString(string: "Ваш адрес email не будет опубликован. Обязательные поля помечены *", attributes: attrs)
        label.attributedText = string
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        reviewTextView.delegate = self
        
        createNavigationView()
        addBackButton()
        addViews()
        setupConstraints()
        
        sendReviewButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        
        tapOnScreen.addTarget(self, action: #selector(endEditingOnTap))
        view.backgroundColor = .systemGray6
        
    }
    
    func addViews() {
        
        view.addGestureRecognizer(tapOnScreen)
        
        view.addSubview(scrollView)
        scrollView.addSubview(productView)
        productView.addSubview(productImage)
        productView.addSubview(productNameLabel)
        scrollView.addSubview(nameTFContainer)
        nameTFContainer.addSubview(nameLabel)
        nameTFContainer.addSubview(nameTextField)
        scrollView.addSubview(emailTFContainer)
        emailTFContainer.addSubview(emailLabel)
        emailTFContainer.addSubview(emailTextField)
        scrollView.addSubview(reviewTFContainer)
        reviewTFContainer.addSubview(reviewLabel)
        reviewTFContainer.addSubview(reviewTextView)
        scrollView.addSubview(sendReviewButton)
        scrollView.addSubview(rulesLabel)
        
        DispatchQueue.main.async {
            self.productImage.kf.setImage(with: URL(string: self.productImageUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self.productImageUrl))
        }
        
        productNameLabel.text = productName
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            productView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            productView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            productView.heightAnchor.constraint(equalToConstant: 120),
            
            productImage.topAnchor.constraint(equalTo: productView.topAnchor, constant: 5),
            productImage.leadingAnchor.constraint(equalTo: productView.leadingAnchor, constant: 5),
            productImage.bottomAnchor.constraint(equalTo: productView.bottomAnchor, constant: -5),
            productImage.widthAnchor.constraint(equalToConstant: 75),
            
            productNameLabel.topAnchor.constraint(equalTo: productView.topAnchor, constant: 20),
            productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: productView.trailingAnchor, constant: -20),
            
            nameTFContainer.topAnchor.constraint(equalTo: productView.bottomAnchor, constant: 20),
            nameTFContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTFContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTFContainer.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: nameTFContainer.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: nameTFContainer.leadingAnchor, constant: 10),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: nameTFContainer.leadingAnchor, constant: 5),
            nameTextField.trailingAnchor.constraint(equalTo: nameTFContainer.trailingAnchor, constant: -5),
            nameTextField.bottomAnchor.constraint(equalTo: nameTFContainer.bottomAnchor, constant: -5),
            
            emailTFContainer.topAnchor.constraint(equalTo: nameTFContainer.bottomAnchor, constant: 5),
            emailTFContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTFContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTFContainer.heightAnchor.constraint(equalToConstant: 60),
            
            emailLabel.topAnchor.constraint(equalTo: emailTFContainer.topAnchor, constant: 5),
            emailLabel.leadingAnchor.constraint(equalTo: emailTFContainer.leadingAnchor, constant: 10),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: emailTFContainer.leadingAnchor, constant: 5),
            emailTextField.trailingAnchor.constraint(equalTo: emailTFContainer.trailingAnchor, constant: -5),
            emailTextField.bottomAnchor.constraint(equalTo: emailTFContainer.bottomAnchor, constant: -5),
            
            reviewTFContainer.topAnchor.constraint(equalTo: emailTFContainer.bottomAnchor, constant: 5),
            reviewTFContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reviewTFContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            reviewTFContainer.heightAnchor.constraint(equalToConstant: view.frame.height / 4.5),
            
            reviewLabel.topAnchor.constraint(equalTo: reviewTFContainer.topAnchor, constant: 5),
            reviewLabel.leadingAnchor.constraint(equalTo: reviewTFContainer.leadingAnchor, constant: 10),
            
            reviewTextView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 5),
            reviewTextView.leadingAnchor.constraint(equalTo: reviewTFContainer.leadingAnchor, constant: 5),
            reviewTextView.trailingAnchor.constraint(equalTo: reviewTFContainer.trailingAnchor, constant: -5),
            reviewTextView.bottomAnchor.constraint(equalTo: reviewTFContainer.bottomAnchor, constant: -5),
            
            sendReviewButton.topAnchor.constraint(equalTo: reviewTFContainer.bottomAnchor, constant: 20),
            sendReviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendReviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendReviewButton.heightAnchor.constraint(equalToConstant: 40),
            
            rulesLabel.topAnchor.constraint(equalTo: sendReviewButton.bottomAnchor, constant: 20),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rulesLabel.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor, constant: -100)
            
        ])
        
    }
    
    @objc func sendButtonTapped() {
        
        sendReviewButton.showAnimation {
            print("Имя: \(self.nameTextField.text ?? "-") ,e-mail: \(self.emailTextField.text ?? "-"), Отзыв: \(self.reviewTextView.text ?? "-")")
        }
        
    }
    
    @objc func endEditingOnTap() {
        view.endEditing(true)
    }
}
