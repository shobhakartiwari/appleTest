//
//  newsDetailsView.swift
//  NewsAppAssignment

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailsView: View {
    var data: [Article?] = []
    var indexPath : Int = 0
    var tempImage : UIImage?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(data[0]?.title ?? "")
                .padding(.top, 5)
                .padding(.bottom, 8)
                .font(.system(size: 30, weight: .heavy, design: .default))
            
            HStack{
                Text("By: \(data[0]?.author ?? "")" )
                    .padding(.leading, 0)
                    .font(.system(size: 12, weight: .light, design: .default))
                
                Text("Source: \(data[0]?.source.name ?? "")")
                    .padding(.leading, 5)
                    .font(.system(size: 12, weight: .light, design: .default))
                
                Spacer()
            }
            
            ScrollView(){
                //3PL SDWebImageSwiftUI used for displaying Image from url
                WebImage(url: URL(string: data[0]!.urlToImage))
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                
                HStack{
                    Text(data[0]?.description ?? "")
                        .padding(.bottom, 8)
                        .font(.system(size: 14, weight: .medium, design: .default))
                    
                    Spacer()
                }
                HStack{
                    Text(data[0]?.content ?? "")
                        .padding(.bottom, 8)
                        .lineLimit(200)
                        .font(.system(size: 12, weight: .light, design: .default))
                    
                    Spacer()
                }
                
                HStack{
                    //navigating to WKWebView with URL request
                    NavigationLink(destination: URLWebView(request: URLRequest(url: URL(string: data[0]?.url ?? "")!))){
                        Text(data[0]?.url ?? "")
                    }
                    Spacer()
                }
            }
        }.padding(.all, 8)
    }
}

