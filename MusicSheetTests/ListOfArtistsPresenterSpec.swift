import Quick
import Nimble

@testable import MusicSheet

class ListOfArtistsPresenterSpec: QuickSpec {

    class ListOfArtistsPresenterOutputSpy: ListOfArtistsPresenterOutput {
        var displayArtistsCalledWith: ListOfArtistsViewModel?

        func displayArtists(viewModel viewModel: ListOfArtistsViewModel) {
            displayArtistsCalledWith = viewModel
        }
    }

    override func spec() {
        describe("List of artists presenter") {
            var sot: ListOfArtistsPresenter!

            beforeEach {
                sot = ListOfArtistsPresenter()
            }

            it("can present artists") {
                // given
                let outputSpy = ListOfArtistsPresenterOutputSpy()
                sot.output = outputSpy
                let artists = [
                    Artist(name: "Beyonce", numberOfAlbums: 10),
                    Artist(name: "Britney Spears", numberOfAlbums: 14)
                ]
                let response = ListOfArtistsResponse(artists: artists)

                // when
                sot.presentArtists(response)

                // then
                expect(outputSpy.displayArtistsCalledWith).notTo(beNil())

                if let viewModel = outputSpy.displayArtistsCalledWith {
                    expect(viewModel.artistsViewModels.count).to(equal(2))

                    let first = viewModel.artistsViewModels[0]
                    expect(first.title).to(equal("Beyonce - 10"))
                }
            }
        }
    }
}
