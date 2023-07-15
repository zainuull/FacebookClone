//
//  ContentView.swift
//  FacebookUI
//
//  Created by Zainul on 02/06/23.
//

import SwiftUI

struct ContentView: View {
    
    let image : [String] = [
        "foto1","foto2","foto3","foto4"
    ]
    
    @State var dataArray : [String] = []

    
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack{
                    VStack{
                        //Icons Navigation
                        IconsNavigation()
                        
                        //Status
                        Status(dataArray: $dataArray)
                        
                        // Line Gray
                        LineGray()
                        
                      //Story
                        ScrollView(.horizontal,showsIndicators: false) {
                            Story()
                        }
                        
                        // Line Gray
                        LineGray()
                        
                        //Output
                        ForEach(dataArray, id: \.self) { data in
                            Feed2(caption: data, dataArray : $dataArray)
                        }
                        
                        // Feed 1
                        Feed(image: "me", caption: "Bersabar seluas lautan dan berfikir setinggi langit", jumlah : 57)
                        
                        // Friends
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(image, id: \.self) { data in
                                    Friends(image: data)
                                }
                            }
                        }
                        
                        // Line Gray
                        LineGray()
                        
                        // Feed 2
                        Feed(image: "foto4", caption: "Hidup adalah Perjuangan, berani Hidup maka berani Berjuang", jumlah : 100)
                        
                        
                    }
                }
            }
            .navigationBarItems(
                leading:
                    Text("Facebook")
                        .font(.system(size:33, design: .monospaced))
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                ,
                trailing:
                    //Icons Header
                    IconsHeader()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct IconsHeader: View {
    var body: some View {
        HStack{
            Circle()
                .fill(Color.gray.opacity(0.2))
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.bold)
                    
                )
                .frame(width: 40, height: 40)
            
            Circle()
                .fill(Color.gray.opacity(0.2))
                .overlay(
                    Image(systemName: "ellipsis.message.fill")
                        .fontWeight(.bold)
                    
                )
                .frame(width: 40, height: 40)
        }
    }
}

struct IconsNavigation: View {
    var body: some View {
        HStack(spacing: 25){
            Image(systemName: "house.fill")
                .foregroundColor(.blue)
            Image(systemName: "person.2.fill")
            Image(systemName: "play.tv")
            Image(systemName: "stove")
            Image(systemName: "bell")
            Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(
                    Circle()
                        .stroke(
                            Color.gray, lineWidth : 5
                        )
                )
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }.font(.title).padding(.top)
    }
}

struct Status: View {
    
    
    @State var textFieldText : String = ""
    @Binding var dataArray : [String]
    
    var body: some View {
        HStack{
            Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(
                    Circle()
                        .stroke()
                )
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            ZStack(alignment: .trailing) {
                TextField("What do you think ?", text: $textFieldText)
                    .font(.headline)
                    .padding(.vertical,11)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke()
                )
                
                Button {
                    dataArray.append(textFieldText)
                    textFieldText = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                }.padding(.trailing)

            }
            
            Image(systemName: "photo.on.rectangle.angled")
                .font(.title2)
                .foregroundColor(.green)
        }.padding(.horizontal).padding(.top).padding(.bottom,5)
    }
}

struct Story: View {
    let image : [String] = [
        "foto1","foto2","foto3","foto4"
    ]
    
    var body: some View {
        HStack(spacing: 30){
            ZStack(alignment: .center){
                Image("me")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 200)
                
                
                VStack(alignment: .center) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.blue)
                        .background(.white)
                        .clipShape(Circle())
                    
                    Text("Buat \nCerita")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,1)
                }.padding(.top,60)
                
            }.padding(.horizontal)
            
            
            ForEach(image, id: \.self) { data in
                ZStack(alignment: .topLeading){
                    Image(data)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 200)
                    
                    
                    Profil()
                }.padding(.horizontal)
            }
        }
    }
}

struct LineGray: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(maxWidth: .infinity, maxHeight: 10)
        }
    }
}

struct StripGray: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
    }
}

struct Profil: View {
    var body: some View {
        Image("me")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth:5)
            )
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .padding(.top,5)
            .padding(.leading,-10)
    }
}

struct Feed: View {
    
    @State var isLike : Bool = false
    @State var likeName : String = ""
    @State var isActionSheet : Bool = false
    let image : String
    let caption : String
    let jumlah : Int
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                //Profil
                Profil()
                VStack(alignment: .leading){
                    Text("Zainul")
                        .fontWeight(.bold)
                    HStack {
                        Text("02 Juni 2023")
                        Image(systemName: "globe")
                    }
                }
                Spacer()
                Button {
                    isActionSheet.toggle()
                } label: {
                    Image(systemName: "text.aligncenter")
                }.accentColor(.black)
                
                Image(systemName: "xmark")
            }
            .padding(.horizontal)
            .actionSheet(isPresented: $isActionSheet) {
                getAction()
            }
            
            Text(caption)
                .padding(.horizontal).padding(.top,2)
            
            Text("#Clone")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Image(image)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
            
            HStack{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.blue)
                Text("\(likeName)Thoba dan \(jumlah) lainnya")
            }.padding(.horizontal)
            
            // Strip Gray
            StripGray()
            
            HStack(spacing: 50){
                HStack {
                    Button {
                        isLike.toggle()
                        if(isLike) {
                            likeName = "Anda, "
                        } else {
                            likeName = ""
                        }
                    } label: {
                        Image(systemName: isLike ? "hand.thumbsup.fill" : "hand.thumbsup")
                    }

                    Text("Like")
                }
                
                HStack {
                    Image(systemName: "message")
                        .font(.title3)
                    Text("Comment")
                }
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.title3)
                    Text("Share")
                }
            }.padding(.horizontal).padding(.top,2)
            
            // Line Gray
            LineGray()
        }
    }
    
    func getAction() -> ActionSheet {
        let save : ActionSheet.Button = .default(Text("Save"))
        let hidden : ActionSheet.Button = .default(Text("Hidden"))
        let delete : ActionSheet.Button = .destructive(Text("Delete"))
        let edit : ActionSheet.Button = .default(Text("Edit"))
        let cancel : ActionSheet.Button = .cancel()
        
        return ActionSheet(
            title: Text(""),
            message: nil,
            buttons: [save, hidden, delete, edit, cancel]
        )
    }
}

struct Friends: View {
    
    let image : String
    @State var isAdd : Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 400)
            
            Text("Zainul")
                .fontWeight(.bold)
                .padding(.horizontal)
            HStack {
                Image("me")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text("2 friends is same")
                    .foregroundColor(.gray)
            }.padding(.horizontal)
            
            HStack {
                Button {
                    isAdd.toggle()
                } label: {
                    HStack {
                        Image(systemName: isAdd ?  "person.fill" : "person.badge.plus")
                        Text(isAdd ? "Cancel Add" : "Add Friend")
                    }
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(isAdd ? .gray : .blue)
                    .cornerRadius(10)
                }
                
                Button {
                    
                } label: {
                    Text("Delete")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                }
                
            }.padding(.horizontal)
            
        }
    }
}


struct Feed2: View {
    
    @State var isLike : Bool = false
    @State var likeName : String = ""
    @State var isActionSheet : Bool = false
    let caption : String
    @Binding var dataArray : [String]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                //Profil
                Profil()
                VStack(alignment: .leading){
                    Text("Zainul")
                        .fontWeight(.bold)
                    HStack {
                        Text("02 Juni 2023")
                        Image(systemName: "globe")
                    }
                }
                Spacer()
                Button {
                    isActionSheet.toggle()
                } label: {
                    Image(systemName: "text.aligncenter")
                }.accentColor(.black)
                
                Button {
                    dataArray.removeFirst()
                } label: {
                    Image(systemName: "xmark")
                }.accentColor(.black)

            }
            .padding(.horizontal)
            .actionSheet(isPresented: $isActionSheet) {
                getAction()
            }
            
            Text(caption)
                .padding(.horizontal).padding(.top,2)
            
            
            HStack{
                Image(systemName: isLike ? "hand.thumbsup.fill" : "")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                Text("\(likeName)")
                    .font(.subheadline)
            }.padding(.horizontal)
            
            // Strip Gray
            StripGray()
            
            HStack(spacing: 50){
                HStack {
                    Button {
                        isLike.toggle()
                        if(isLike) {
                            likeName = "Zainul"
                        } else {
                            likeName = ""
                        }
                    } label: {
                        Image(systemName: isLike ? "hand.thumbsup.fill" : "hand.thumbsup")
                    }

                    Text("Like")
                }
                
                HStack {
                    Image(systemName: "message")
                        .font(.title3)
                    Text("Comment")
                }
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.title3)
                    Text("Share")
                }
            }.padding(.horizontal)
            
            // Line Gray
            LineGray()
        }
    }
    
    func getAction() -> ActionSheet {
        let save : ActionSheet.Button = .default(Text("Save"))
        let hidden : ActionSheet.Button = .default(Text("Hidden"))
        let delete : ActionSheet.Button = .destructive(Text("Delete")) {
            dataArray.remove(at: 0)
        }
        let edit : ActionSheet.Button = .default(Text("Edit"))
        let cancel : ActionSheet.Button = .cancel()
        
        return ActionSheet(
            title: Text(""),
            message: nil,
            buttons: [save, hidden, delete, edit, cancel]
        )
    }
}

