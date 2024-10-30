//
//  chartViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//


import UIKit
import SwiftUI
import Then
import SnapKit

class ChartViewController: UIViewController {
    
    private let tableView = UITableView()
    private let appList = App.mockData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
    }
    
    private func setStyle() {
        
        tableView.do {
              $0.register(
                  AppRowView.self,
                  forCellReuseIdentifier: AppRowView.identifier
              )
              $0.estimatedRowHeight = 100 
              $0.rowHeight = UITableView.automaticDimension 
              $0.dataSource = self
              $0.delegate = self
          }
        
    }
    
    private func setUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}


extension ChartViewController: UITableViewDelegate { }
extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //data 8개
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AppRowView.identifier,
            for: indexPath
        ) as? AppRowView else { return UITableViewCell() }
        cell.configure(app: appList[indexPath.row])
        
        
        return cell
    }
    
    
    
    
}

//프리뷰
struct ChartViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ChartViewController {
        return ChartViewController()
    }
    
    func updateUIViewController(_ uiViewController: ChartViewController, context: Context) {}
}

#Preview {
    ChartViewControllerPreview()
}
