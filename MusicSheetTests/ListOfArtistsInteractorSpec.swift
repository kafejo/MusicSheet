import Quick
import Nimble

@testable import MusicSheet

class ListOfArtistsInteractorSpec: QuickSpec {
    override func spec() {

        class ListOfArtistsOutputSpy: ListOfArtistsInteractorOutput {

            var presentArtistsCalledWith: ListOfArtistsResponse?

            func presentArtists(response: ListOfArtistsResponse) {
                presentArtistsCalledWith = response
            }
        }

        class ArtistsSpyStore: ArtistStoreProtocol {

            static let MockupArtists = [
                Artist(name: "Britney Spears", numberOfAlbums: 14),
                Artist(name: "Jenifer Lopez", numberOfAlbums: 4),
                Artist(name: "Beyonce", numberOfAlbums: 10),
                Artist(name: "Madonna", numberOfAlbums: 20)
            ]

            func fetchAllArtists(callback callback: [Artist] -> ()) {

                callback(ArtistsSpyStore.MockupArtists)
            }
        }

        var sot: ListOfArtistsInteractor!

        describe("List of artists interactor") {
            beforeEach {
                sot = ListOfArtistsInteractor()
            }

            it("can present fetched artists") {
                // given
                let outputSpy = ListOfArtistsOutputSpy()
                sot.output = outputSpy
                let worker = ArtistWorker(store: ArtistsSpyStore())
                sot.worker = worker

                // when
                let request = ListOfArtistsRequest(order: .Alphabetically)
                sot.fetchArtistsOnLoad(request)

                // then
                expect(outputSpy.presentArtistsCalledWith).notTo(beNil())

                if let response = outputSpy.presentArtistsCalledWith {
                    expect(response.artists.count).to(equal(4))

                    expect(response.artists[0]).to(equal(ArtistsSpyStore.MockupArtists[2]))
                    expect(response.artists[1]).to(equal(ArtistsSpyStore.MockupArtists[0]))
                    expect(response.artists[2]).to(equal(ArtistsSpyStore.MockupArtists[1]))
                    expect(response.artists[3]).to(equal(ArtistsSpyStore.MockupArtists[3]))
                }
            }
        }
    }
}
