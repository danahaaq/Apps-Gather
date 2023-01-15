//
//  Scan.swift
//  Test
//
//  Created by Aldanah Alqbbani on 22/06/1444 AH.
//

import SwiftUI

@available(iOS 15.0, *)
struct ScanApp: View {
    @State var text: String = ""
    var body: some View {
        NavigationView{
        VStack{
            Text(text)
            ActionMenuView_UI(text: $text)
        }.navigationTitle("Scan App")
    }
    }
}
@available(iOS 15.0, *)
struct ActionMenuView_UI: UIViewRepresentable {
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context: Context) -> some UIView {

        //let choosePhotoOrVideo = UIAction(…)
        //let takePhotoOrVideo = UIAction(…)
        //let scanDocuments = UIAction(…)

        // A UIButton can hold the menu, it is a long press to get it to come up
        let button = UIButton()
        let textFromCamera = UIAction.captureTextFromCamera(responder: context.coordinator, identifier: nil)
        let cameraMenu = UIMenu(children: [
            //choosePhotoOrVideo, takePhotoOrVideo, scanDocuments,
            textFromCamera])
        button.setImage(UIImage(systemName: "text.viewfinder"), for: .normal)
        button.menu = cameraMenu
        return button
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    //Making the Coordinator a UIResponder as! UIKeyInput gives access to the text
    class Coordinator: UIResponder, UIKeyInput{
        var hasText: Bool{
            !parent.text.isEmpty
        }
        
        let parent: ActionMenuView_UI
        
        init(_ parent: ActionMenuView_UI){
            self.parent = parent
        }
        func insertText(_ text: String) {
            //Update the @Binding
            parent.text = text
        }

        func deleteBackward() { }
    }
}
@available(iOS 15.0, *)
struct ScanApp_Previews: PreviewProvider {
    static var previews: some View {
        ScanApp()
    }
}
