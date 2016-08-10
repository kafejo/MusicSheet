//
//  ArtistDetailViewController.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.

import UIKit

protocol ArtistDetailViewControllerOutput {
    func fetchArtistDetailsOnLoad()

    var artist: Artist! { get set }
}

class ArtistDetailViewController: UIViewController, ArtistDetailPresenterOutput {
    var output: ArtistDetailViewControllerOutput!
    var router: ArtistDetailRouterInput!

    @IBOutlet weak var tableView: UITableView!
    
    var displayedAlbums: [ArtistDetailAlbumViewModel] = []

    // MARK: - Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        ArtistDetailConfigurator.sharedInstance.configure(self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCellClass(AlbumCell)
        tableView.dataSource = self

        fetchArtistOnLoad()
    }

    // MARK: - Event handling

    func fetchArtistOnLoad() {
        output.fetchArtistDetailsOnLoad()
    }

    // MARK: - Display logic

    func displayArtistDetails(viewModel: ArtistDetailViewModel) {
        displayedAlbums = viewModel.albumsViewModels
        tableView.reloadData()
    }
}

extension ArtistDetailViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedAlbums.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(AlbumCell.reuseIdentifier, forIndexPath: indexPath) as! AlbumCell
        let albumViewModel = displayedAlbums[indexPath.row]

        cell.titleLabel.text = albumViewModel.title
        cell.descriptionLabel.text = albumViewModel.description

        return cell
    }
}
