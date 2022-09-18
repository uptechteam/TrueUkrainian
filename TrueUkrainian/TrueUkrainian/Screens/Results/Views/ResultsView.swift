//
//  ResultsView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class ResultsView: UIView {

    struct Props: Equatable {
        let title: String
        let items: [ResultsitemCell.Props]
    }

    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, ResultsitemCell.Props>
    typealias DataSource = UICollectionViewDiffableDataSource<Int, ResultsitemCell.Props>

    // MARK: - Properties

    private let titleLabel = UILabel()
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
        setupContentView()
        setupTitleLabel()
        setupCollectionView()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
    }

    private func setupCollectionView() {
        collectionView.register(cell: ResultsitemCell.self)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, collectionView])
        stackView.axis = .vertical
        stackView.spacing = 32
        addSubview(
            stackView,
            withEdgeInsets: UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0),
            isSafeAreaRequired: true
        )
    }

    // MARK: - Public methods

    func render(props: Props) {
        titleLabel.text = props.title
        dataSource.apply(sections: [0], items: [props.items])
    }

    // MARK: - Private methods

    private func makeDataSource() -> DataSource {
        return DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, props in
            let cell: ResultsitemCell = collectionView.dequeueReusableCell(for: indexPath)
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


extension ResultsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTapItem(indexPath)
    }
}

extension ResultsView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let item = dataSource.itemIdentifier(for: indexPath) else {
            return .zero
        }

        return ResultsitemCell.calcualteSize(props: item, availableWidth: collectionView.bounds.width)
    }
}
