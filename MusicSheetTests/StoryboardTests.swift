import Quick
import Nimble

@testable import MusicSheet

class StoryboardTests: QuickSpec {
    override func spec() {
        describe("List of user controllers") {
            it("can instantiate List of artists controller") {
                expect { try Storyboard.ListOfArtists.ListOfArtistsVC.instantiate() }.notTo(throwError())
            }
        }
    }
}
