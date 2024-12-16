import UIKit

class WeatherInfoView: UIView {
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "today"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text = "50%"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        let backgroundImage = UIImageView(image: UIImage(named: "cloud"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.layer.cornerRadius = 16
        addSubview(blurEffectView)
        addSubview(mainLabel)
        addSubview(subLabel)
        
        blurEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setupConstraints(){
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            
        }
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    public func setData(title: String, subTitle: String){
        mainLabel.text = title
        subLabel.text = subTitle
    }
}
