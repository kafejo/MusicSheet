import Quick
import Nimble

@testable import MusicSheet

class ArtistDetailPresenterSpec: QuickSpec {


    class ArtistDetailPresenterOutputSpy: ArtistDetailPresenterOutput {
        var displayArtistDetailsCalledWith: ArtistDetailViewModel?
        func displayArtistDetails(viewModel: ArtistDetailViewModel) {
            displayArtistDetailsCalledWith = viewModel
        }
    }

    override func spec() {

        describe("Artist detail presenter") {

            var sot: ArtistDetailPresenter!

            beforeEach {
                sot = ArtistDetailPresenter()
            }

            it("can present artist details") {
                // given
                let outputSpy = ArtistDetailPresenterOutputSpy()
                sot.output = outputSpy

                // when
                let response = ArtistDetailResponse(albums: ArtistMockupStore.Albums)
                sot.presentArtistDetails(response)

                // then
                expect(outputSpy.displayArtistDetailsCalledWith).notTo(beNil())

                if let viewModel = outputSpy.displayArtistDetailsCalledWith {
                    expect(viewModel.albumsViewModels.count).to(equal(ArtistMockupStore.Albums.count))
                    let firstViewModel = viewModel.albumsViewModels[0]

                    expect(firstViewModel.title).to(equal("Rebel Heart - 2015"))
                    expect(firstViewModel.description).to(equal("19 tracks"))
                }
            }
        }
    }
}
