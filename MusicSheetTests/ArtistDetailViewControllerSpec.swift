import Quick
import Nimble

@testable import MusicSheet

class ArtistDetailViewControllerSpec: QuickSpec {

    class ArtistDetailViewControllerOutputSpy: ArtistDetailViewControllerOutput {

        var artist: Artist! = Artist(name: "Test", numberOfAlbums: 10)

        var fetchArtistDetailsOnLoadCalled = false

        func fetchArtistDetailsOnLoad() {
            fetchArtistDetailsOnLoadCalled = true
        }
    }

    override func spec() {
        var sot: ArtistDetailViewController!
        var window: UIWindow!

        describe("List od Artists View Controller") {

            beforeEach {
                window = UIWindow()
                sot = try? Storyboard.ListOfArtists.ArtistDetailVC.instantiate()
            }

            it("can fetch artist details on viewDidLoad") {
                // given
                let outputSpy = ArtistDetailViewControllerOutputSpy()
                sot.output = outputSpy

                // when
                window.addSubview(sot.view)
                NSRunLoop.currentRunLoop().runUntilDate(NSDate())

                // then
                expect(outputSpy.fetchArtistDetailsOnLoadCalled).to(beTrue())
            }

            it("can display details") {
                // given
                let albumViewModels = [
                    ArtistDetailAlbumViewModel(title: "Rebel Heart - 2015", description: "19 tracks"),
                    ArtistDetailAlbumViewModel(title: "True Blue - 1986", description: "9 tracks")
                ]
                let viewModel = ArtistDetailViewModel(albumsViewModels: albumViewModels)
                let tableViewSpy = TableViewSpy()
                sot.tableView = tableViewSpy

                // when
                sot.displayArtistDetails(viewModel)

                // then
                expect(sot.tableView(sot.tableView, numberOfRowsInSection: 0)).to(equal(albumViewModels.count))
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
