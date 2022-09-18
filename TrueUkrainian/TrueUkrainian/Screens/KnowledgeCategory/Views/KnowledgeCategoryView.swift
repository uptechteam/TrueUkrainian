//
//  KnowledgeCategoryView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class KnowledgeCategoryView: UIView {

    struct Props: Equatable {
        let backColor: UIColor
        let items: [KnowledgeCategoryCell.Props]
    }

    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, KnowledgeCategoryCell.Props>
    typealias DataSource = UICollectionViewDiffableDataSource<Int, KnowledgeCategoryCell.Props>

    // MARK: - Properties

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private lazy var dataSource = makeDataSource()
    // callbacks
    var onTapItem: (IndexPath) -> Void = { _ in }

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }

    // MARK: - Set up

    private func setup() {
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.backgroundColor = .bg
        collectionView.register(cell: KnowledgeCategoryCell.self)
        collectionView.delegate = self
        addSubview(
            collectionView,
            withEdgeInsets: .zero,
            isSafeAreaRequired: true
        )
    }

    // MARK: - Public methods

    func render(props: Props) {
        backgroundColor = props.backColor
        dataSource.apply(sections: [0], items: [props.items])
    }

    // MARK: - Private methods

    private func makeDataSource() -> DataSource {
        return DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, props in
            let cell: KnowledgeCategoryCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.render(props: props)
            return cell
        })
    }

    private func setupLayout() {
        guard collectionView.collectionViewLayout as? UICollectionViewFlowLayout == nil else {
            return
        }

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension KnowledgeCategoryView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTapItem(indexPath)
    }
}

extension KnowledgeCategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let props = dataSource.itemIdentifier(for: indexPath) else {
            return .zero
        }

        return KnowledgeCategoryCell.calcualteSize(props: props, availableWidth: collectionView.bounds.width)
    }
}
