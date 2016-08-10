import Quick
import Nimble
import UIKit

@testable import MusicSheet

class ListOfArtistsViewControllerSpec: QuickSpec {

    class ListOfArtistsInteractorSpy: ListOfArtistsViewControllerOutput {
        var fetchArtistsOnLoadCalled = false

        func fetchArtistsOnLoad(request: ListOfArtistsRequest) {
            fetchArtistsOnLoadCalled = true
        }
    }

    override func spec() {

        var sot: ListOfArtistsViewController!
        var window: UIWindow!

        describe("List od Artists View Controller") {

            beforeEach {
                window = UIWindow()
                sot = try? Storyboard.ListOfArtists.ListOfArtistsVC.instantiate()
            }

            it("can fetch artist on load") {
                // given
                let interactorSpy = ListOfArtistsInteractorSpy()
                sot.output = interactorSpy

                // when
                window.addSubview(sot.view)
                NSRunLoop.currentRunLoop().runUntilDate(NSDate())

                // then
                expect(interactorSpy.fetchArtistsOnLoadCalled).to(beTrue())
            }

            it("can display artists") {
                // given
                let artistsViewModels = [ArtistViewModel(title: "Artist 1"), ArtistViewModel(title: "Artist 2"), ArtistViewModel(title: "Artist 3"), ArtistViewModel(title: "Artist 4")]
                let viewModel = ListOfArtistsViewModel(artistsViewModels: artistsViewModels)
                let tableViewSpy = TableViewSpy()
                sot.tableView = tableViewSpy

                // when
                sot.displayArtists(viewModel: viewModel)

                // then
                expect(sot.tableView(sot.tableView, numberOfRowsInSection: 0)).to(equal(4))
                expect(tableViewSpy.reloadDataCalled).to(beTrue())
            }

            it("has only one section") {
                // given
                let tableView = UITableView()

                // when
                sot.tableView = tableView

                // then
                expect(sot.numberOfSectionsInTableView(tableView)).to(equal(1))
            }
        }
    }
}
