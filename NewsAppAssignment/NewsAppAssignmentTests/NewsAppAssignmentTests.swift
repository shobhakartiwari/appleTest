//
//  NewsAppAssignmentTests.swift
//  NewsAppAssignmentTests


import XCTest
@testable import NewsAppAssignment

class NewsAppAssignmentTests: XCTestCase {

    var mockObj : MockNewsArticleProtocol!
    override func setUp() {
        //creating mock object
        mockObj = MockNewsArticleProtocol()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        mockObj = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsArticle() {
        mockObj.getNews { (result, error) in
            XCTAssertTrue(result?.count == 1)
        }
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}


class MockNewsArticleProtocol: NewsArticleProtocol{
    var mockArticle = Article(source: Source(id: "1", name: "Adam"), author: "Jane", title: "TestTitle", description: "TestDescription", url: "TestUrl", urlToImage: "TestUrlImage", publishedAt: "testPublished", content: "testContent")
    func getNews(completion: @escaping ([Article?]?, Error?) -> ()) {
        completion([mockArticle], nil)
    }
  
}
