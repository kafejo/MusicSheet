import Quick
import Nimble

@testable import MusicSheet

class ArtistServiceSpec: QuickSpec {
    override func spec() {
        describe("Artist service") {
            it("can download artists") {
                waitUntil(timeout: 2.0) { done in
                    ArtistService.artists { result in
                        expect {
                            if case Result.Success(let artists) = result {
                                return artists.count
                            } else {
                                return 0
                            }
                        }.to(beGreaterThan(0))
                        done()
                    }
                }
            }
        }
    }
}
