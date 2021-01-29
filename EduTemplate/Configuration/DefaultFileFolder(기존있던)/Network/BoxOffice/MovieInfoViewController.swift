//
//  MovieInfoViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit

class MovieInfoViewController: BaseViewController {
    var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .NotoSans(.medium, size: 16)
        return label
    }()
    
    let movie: DailyBoxOffice
    
    init(movie: DailyBoxOffice) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = movie.movieCd
        
        // Info Label
        infoLabel.text = movie.movieNm
        self.view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { $0.center.equalToSuperview() }
    }
}
