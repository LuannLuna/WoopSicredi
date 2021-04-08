//
//  EventDetailViewController.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import UIKit
import MapKit

protocol EventDetailViewControllerDelegate: class {
    func configure(_ event: Event)
}

class EventDetailViewController: UIViewController {
    
    var viewModel: EventDetailViewModelType?
    
    private lazy var scrollView = UIScrollView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alwaysBounceVertical = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    private lazy var stackView = UIStackView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 8
    }
    
    private lazy var secondStack = UIStackView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 8
    }
    
    private lazy var thumbView = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = #imageLiteral(resourceName: "placeholder")
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
    
    private lazy var descriptionTitle = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    private lazy var descriptionText = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = $0.font.withSize(15)
        $0.textColor = .gray
        $0.numberOfLines = 0
        $0.setLineSpacing(lineSpacing: 5.0, lineHeightMultiple: 1)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
        $0.setContentHuggingPriority(.defaultLow, for: .vertical)
        $0.textAlignment = .justified
    }
    
    private lazy var separatorView = UIView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.snp.makeConstraints {
            $0.height.equalTo(0.5)
        }
    }
    
    private lazy var spacerView = UIView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.snp.makeConstraints {
            $0.height.equalTo(25)
        }
    }
    
    private lazy var checkinButton = UIButton().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(checkinDidTaped), for: .touchUpInside)
        $0.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
    private lazy var mapView = MKMapView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.snp.makeConstraints {
            $0.height.equalTo(200)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "share"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(shareButton))
        setup()
    }
    
    @objc
    func shareButton() {
        guard let viewModel = viewModel else { return }
        let eventTitle = "Venha para o \(viewModel.title)."
        let eventDescription = viewModel.description
        let textToShare = [eventTitle, eventDescription ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc
    func checkinDidTaped() {
        viewModel?.checkinButtonDidTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.viewDidAppear()
    }
    
    private func setupMap() {
        if let coordination = viewModel?.coordination {
            let coordinate = CLLocationCoordinate2D(latitude: coordination.0,
                                                    longitude: coordination.1)
            let region = mapView.regionThatFits(MKCoordinateRegion(center: coordinate,
                                                                   latitudinalMeters: 750,
                                                                   longitudinalMeters: 750))
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            mapView.setRegion(region, animated: true)
            mapView.addAnnotation(annotation)
        }
    }
    
    deinit {
        viewModel?.onFinish()
    }
    
}

extension EventDetailViewController: ViewCodable {
    func setupViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(thumbView)
        stackView.addArrangedSubview(secondStack)
        
        secondStack.addArrangedSubview(titleLabel)
        secondStack.addArrangedSubview(dateTitle)
        secondStack.addArrangedSubview(valueLabel)
        secondStack.addArrangedSubview(separatorView)
        secondStack.addArrangedSubview(descriptionTitle)
        secondStack.addArrangedSubview(descriptionText)
        secondStack.addArrangedSubview(checkinButton)
        
        secondStack.addArrangedSubview(mapView)
        
        secondStack.addArrangedSubview(spacerView)
    }
    
    func setupAnchors() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        thumbView.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height / 3)
        }
        
        stackView.setCustomSpacing(20, after: thumbView)
        
        secondStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        secondStack.setCustomSpacing(20, after: descriptionTitle)
        secondStack.setCustomSpacing(20, after: descriptionText)
        secondStack.setCustomSpacing(20, after: valueLabel)
        secondStack.setCustomSpacing(20, after: separatorView)
        
    }
}

extension EventDetailViewController: EventDetailViewControllerDelegate {
    func configure(_ event: Event) {
        thumbView.downloaded(from: event.image, contentMode: .scaleAspectFill)
        titleLabel.text = event.title
        dateTitle.text = event.date.toDate().formatted(dateStyle: .long, timeStyle: .none)
        valueLabel.text = event.price.formatted
        descriptionTitle.text = "Descrição".uppercased()
        descriptionText.text = event.description
        separatorView.backgroundColor = .gray
        checkinButton.setTitle("check-in".uppercased(), for: .normal)
        checkinButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        setupMap()
    }
}
