//
//  EventsTableViewCell.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    private lazy var bgview = UIView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.setBackgroundShadow()
    }
    
    private lazy var mainStack = UIStackView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fill
        $0.spacing = 5
        $0.axis = .vertical
    }
    
    private lazy var thumbView = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.image = #imageLiteral(resourceName: "placeholder")
    }
    
    private lazy var dateTitle = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = $0.font.withSize(11)
        $0.textColor = .gray
    }
    
    private lazy var title = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private lazy var descriptionText = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = $0.font.withSize(13)
        $0.textColor = .gray
        $0.numberOfLines = 3
        $0.setLineSpacing(lineSpacing: 5.0, lineHeightMultiple: 1)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
        $0.setContentHuggingPriority(.defaultLow, for: .vertical)
        $0.textAlignment = .justified
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
    
    private lazy var lineStack = UIStackView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 5.0
        $0.alignment = .fill
        $0.distribution = .fill
        $0.axis = .horizontal
        $0.addArrangedSubview(UIView())
    }
    
    private lazy var valueText = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fill(event: Event) {
        thumbView.downloaded(from: event.image, contentMode: .scaleToFill)
        title.text =  event.title
        dateTitle.text = "• " + event.date.toDate().formatted(dateStyle: .long, timeStyle: .none) + " •"
        descriptionText.text = event.description
        valueText.text = event.price.formatted
    }
    
    override func prepareForReuse() {
        title.text = ""
        thumbView.image = #imageLiteral(resourceName: "placeholder")
    }

}

extension EventsTableViewCell: ViewCodable {
    func setupViews() {
        addSubview(bgview)
        
        bgview.addSubview(thumbView)
        bgview.addSubview(mainStack)
        
        mainStack.addArrangedSubview(dateTitle)
        mainStack.addArrangedSubview(title)
        mainStack.addArrangedSubview(descriptionText)
        mainStack.addArrangedSubview(separatorView)
        mainStack.addArrangedSubview(lineStack)
        lineStack.addArrangedSubview(valueText)
        
    }
    
    func setupAnchors() {
        
        bgview.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        thumbView.snp.makeConstraints {
            $0.width.height.equalTo(90)
            $0.leading.top.equalToSuperview().inset(10)
        }
        
        mainStack.snp.makeConstraints {
            $0.leading.equalTo(thumbView.snp.trailing).offset(10)
            $0.top.bottom.trailing.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.greaterThanOrEqualTo(thumbView).offset(5)
        }

    }
}
