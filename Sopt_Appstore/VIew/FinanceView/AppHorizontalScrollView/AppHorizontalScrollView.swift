//
//  AppHorizontalScrollView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//


import UIKit
import SnapKit
import SwiftUI
class AppHorizontalScrollView: UIViewController {

    private var collectionView: UICollectionView!
    private let appData = App.mockData.prefix(9).map { $0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal 
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: view.bounds.width - 32, height: 80)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.showsVerticalScrollIndicator = false

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AppRowView_Collection.self, forCellWithReuseIdentifier: AppRowView_Collection.identifier)

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

}


extension AppHorizontalScrollView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppRowView_Collection.identifier, for: indexPath) as? AppRowView_Collection else {
            return UICollectionViewCell()
        }
        let app = appData[indexPath.section * 3 + indexPath.item]
        cell.configure(app: app)
        return cell
    }
}

struct HorizontalScrollViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AppHorizontalScrollView {
        return AppHorizontalScrollView()
    }
    
    func updateUIViewController(_ uiViewController: AppHorizontalScrollView, context: Context) {}
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollViewControllerPreview()
            .edgesIgnoringSafeArea(.all)
    }
}
