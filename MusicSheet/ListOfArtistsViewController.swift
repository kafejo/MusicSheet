//
//  ListOfArtistsViewController.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 09/08/16.
//  Copyright (c) 2016 Rubicoin. All rights reserved.

import UIKit

protocol ListOfArtistsViewControllerOutput {
    func fetchArtistsOnLoad(request: ListOfArtistsRequest)

    var fetchedArtists: [Artist] { get }
}

class ListOfArtistsViewController: UIViewController, ListOfArtistsPresenterOutput {
    var output: ListOfArtistsViewControllerOutput!
    var router: ListOfArtistsRouterInput!

    var displayedArtists: [ArtistViewModel] = []

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        ListOfArtistsConfigurator.sharedInstance.configure(self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNibForCellClass(ArtistTableViewCell)

        fetchArtistsOnLoad()
    }

    // MARK: - Event handling

    func fetchArtistsOnLoad() {
        let request = ListOfArtistsRequest(order: .Alphabetically)
        output.fetchArtistsOnLoad(request)
    }

    // MARK: - Display logic

    func displayArtists(viewModel viewModel: ListOfArtistsViewModel) {
        self.displayedArtists = viewModel.artistsViewModels
        tableView.reloadData()
    }
}

extension ListOfArtistsViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedArtists.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ArtistTableViewCell.reuseIdentifier, forIndexPath: indexPath) as! ArtistTableViewCell
        let viewModel = displayedArtists[indexPath.row]

        cell.titleLabel.text = viewModel.title

        return cell
    }
}

extension ListOfArtistsViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let artist = output.fetchedArtists[indexPath.row]
        router.navigateArtistDetail(artist)
    }
}
