//
//  CheckinViewController.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import UIKit

protocol CheckinViewControllerDelegate {
    func configure(_ event: Event)
    func success()
    func failure(msg: String)
    func isValidName() -> Bool
    func isValidEmail() -> Bool
}

class CheckinViewController: UIViewController {
    
    var viewModel: CheckinViewModelType?
    
    private lazy var scrollView = UIScrollView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alwaysBounceVertical = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    private lazy var stackView = UIStackView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 5.0
        $0.alignment = .fill
        $0.distribution = .fill
        $0.axis = .vertical
    }
    
    private lazy var lineStack = UIStackView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 5.0
        $0.alignment = .fill
        $0.distribution = .fill
        $0.axis = .horizontal
    }
    
    private lazy var closeButton = UIButton(type: .close).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.snp.makeConstraints {
            $0.height.width.equalTo(40)
        }
        $0.addTarget(self,
                     action: #selector(close),
                     for: .touchUpInside)
    }
    
    private lazy var titleLabel = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    private lazy var dateTitle = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = $0.font.withSize(15)
        $0.textColor = .gray
    }
    
    private lazy var valueLabel = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        $0.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
    }
    
    private var separatorView: UIView {
        let view = UIView().with{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .gray
            $0.snp.makeConstraints {
                $0.height.equalTo(0.5)
            }
        }
        return view
    }
    
    private lazy var checkinLabel = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private lazy var nameTextField = UITextField().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Nome"
        $0.leftViewMode = .always
        
        let imageView = UIImageView(frame: CGRect(x: 0.0,
                                                  y: 8.0,
                                                  width: 24.0,
                                                  height: 24.0))
        imageView.image = #imageLiteral(resourceName: "user")
        imageView.contentMode = .scaleAspectFit
        
        let view = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 32,
                                        height: 40))
        view.addSubview(imageView)
        $0.leftView = view
        $0.addTarget(self,
                     action: #selector(textFieldDidChange(_:)),
                     for: .editingChanged)
    }
    
    private lazy var emailTextField = UITextField().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Email"
        $0.leftViewMode = .always
        
        let imageView = UIImageView(frame: CGRect(x: 0.0,
                                                  y: 8.0,
                                                  width: 24.0,
                                                  height: 24.0))
        imageView.image = #imageLiteral(resourceName: "email")
        imageView.contentMode = .scaleAspectFit
        
        let view = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 32,
                                        height: 40))
        view.addSubview(imageView)
        $0.leftView = view
        $0.addTarget(self,
                     action: #selector(textFieldDidChange(_:)),
                     for: .editingChanged)
    }
    
    private lazy var checkinButton = UIButton().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.addTarget(self,
                     action: #selector(doCheckin),
                     for: .touchUpInside)
        $0.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func close() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.viewDidAppear()
    }
    
}

extension CheckinViewController: ViewCodable {
    func setupViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(lineStack)
        lineStack.addArrangedSubview(UIView())
        lineStack.addArrangedSubview(closeButton)
        
        stackView.addArrangedSubview(dateTitle)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(separatorView)
        
        stackView.addArrangedSubview(checkinLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(checkinButton)
        
    }
    
    func setupAnchors() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(30)
            $0.width.equalTo(UIScreen.main.bounds.width - 60)
        }
        
        stackView.setCustomSpacing(20, after: valueLabel)
        stackView.setCustomSpacing(20, after: checkinLabel)
        stackView.setCustomSpacing(30, after: nameTextField)
        stackView.setCustomSpacing(30, after: emailTextField)
    }
}

extension CheckinViewController: CheckinViewControllerDelegate {
    
    @objc
    func doCheckin() {
        if isValidName(), isValidEmail() {
            viewModel?.doCheckin()
        }
    }
    
    func configure(_ event: Event) {
        titleLabel.text = event.title
        dateTitle.text = event.date.toDate().formatted(dateStyle: .long, timeStyle: .none)
        valueLabel.text = event.price.formatted
        checkinLabel.text = "\nCheckin".uppercased()
        nameTextField.addBottomBorder(.black)
        emailTextField.addBottomBorder(.black)
        checkinButton.setTitle("Realizar checkin".uppercased(), for: .normal)
        checkinButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    
    func success() {
        showAlert(title: "Sucesso",
                  message: "Checkin realizado com sucesso") { action in
            self.close()
        }
    }
    
    func failure(msg: String) {
        showAlert(title: "Error",
                  message: "Não foi possível realizar seu login. \(msg)")
    }
    
    func isValidName() -> Bool {
        if nameTextField.text?.isEmpty ?? false {
            nameTextField.tintColor = .red
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Nome",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            nameTextField.becomeFirstResponder()
            return false
        }
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Nome",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        nameTextField.tintColor = .black
        return true
    }
    
    func isValidEmail() -> Bool {
        if let text = emailTextField.text {
            if text.isValidEmail {
                emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
                emailTextField.textColor = .black
                return true
            }
        }
        
        emailTextField.textColor = .red
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        emailTextField.becomeFirstResponder()
        return false
    }
}

extension CheckinViewController {
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        if textField == nameTextField {
            viewModel?.setName(textField.text)
        } else {
            viewModel?.setEmail(textField.text)
        }
    }
    
    func showAlert(title: String, message: String, handler: ((UIAlertAction)->Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: handler))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
