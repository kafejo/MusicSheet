import Quick
import Nimble

@testable import MusicSheet

class ArtistDetailInteractorSpec: QuickSpec {

    class ArtistDetailInteractorOutputSpy: ArtistDetailInteractorOutput {
        var presentArtistDetailsCalledWith: ArtistDetailResponse?

        func presentArtistDetails(response: ArtistDetailResponse) {
            presentArtistDetailsCalledWith = response
        }
    }

    override func spec() {

        // Test the business logic
        describe("Artist detail interactor") {

            var sot: ArtistDetailInteractor!

            beforeEach {
                sot = ArtistDetailInteractor()
                sot.artist = Artist(name: "Madonna", numberOfAlbums: 20)
            }

            it("can fetch advert details") {
                // given
                let mockupWorker = ArtistMockupStore()
                sot.worker = mockupWorker
                let outputSpy = ArtistDetailInteractorOutputSpy()
                sot.output = outputSpy

                // when
                sot.fetchArtistDetailsOnLoad()

                // then
                expect(outputSpy.presentArtistDetailsCalledWith).toNot(beNil())

                if let response = outputSpy.presentArtistDetailsCalledWith {
                    expect(response.albums.count).to(equal(ArtistMockupStore.Albums.count))
                }
            }
        }
    }
}
