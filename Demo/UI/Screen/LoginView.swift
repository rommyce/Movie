//
//  LoginView.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var username : String = ""
    @State var password : String = ""
    @State var isDisabled : Bool = true
    @State var isSecureTextEntry : Bool = true
    @State var fieldFocus = [false, false]
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    let LOGIN_CONTAINER_WIDTH = 300
    
    var body: some View {
        ZStack{
            VStack{
                Spacer().frame(maxWidth: .infinity)
                
                LoginContainer()
                
                Spacer().frame(height:50)
            }
            .frame(maxWidth: CGFloat(LOGIN_CONTAINER_WIDTH), alignment: .center)
            
        }
        .ignoresSafeArea()
        .background(
            Background()
        )
    }
    
    struct Background: View {
        var body: some View {
            Image("login_background")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .overlay(Color.background.opacity(0.2))
                .ignoresSafeArea()
        }
    }

    fileprivate func UserTextField() -> some View {
        let label = LocalizedStringKey("lbl_user").toString()

        return KitTextField (
                        label: "\(label)",
                        text: $username,
                        focusable: $fieldFocus,
                        returnKeyType: .next,
                        tag: 0
        )
        .frame(height: CGFloat(values.textfield_height))
        .onChange(of: username, perform: { value in
                                isDisabled = !isValidForm()
        })
    }
    
    fileprivate func PasswordTextField() -> some View {
        let label = LocalizedStringKey("lbl_password").toString()
        
        return KitTextField (
                        label: "\(label)",
                        text: $password,
                        focusable: $fieldFocus,
                        isSecureTextEntry: $isSecureTextEntry,
                        returnKeyType: .done,
                        tag: 1
        )
        .frame(height: CGFloat(values.textfield_height))
        .onChange(of: password, perform: { value in
                                isDisabled = !isValidForm()
        })
    }
    
    fileprivate func LoginButton() -> some View {
        return Button(action: {
            validLoginWS()
        }, label: {
            Text("btn_login")
        })
        .buttonStyle(LoginButtonStyle(startColor: Color.yellow, endColor: Color.orange, colorScheme: colorScheme, isDisabled: isDisabled))
        .fullScreenCover(isPresented: $viewModel.loginResponse.success, content: {
            HomeView()
        })
        .alert(isPresented: $viewModel.showErrorAlert, content: {
            Alert(title: Text(viewModel.error!.localizedDescription))
        })
    }
    
    fileprivate func LoginContainer() -> some View {
        return VStack(){
            UserTextField()
            
            PasswordTextField()
            
            LoginButton()
        }
        .padding(25)
        .background(Color.background)
        .cornerRadius(CGFloat(values.radius))
        .modifier(AdaptsToSoftwareKeyboard())
        .opacity(0.95)
    }
    
    func validLoginWS(){
        if(!isDisabled){
            viewModel.login(user: username, password: password)
        }
    }
    
    
    func isValidForm() -> Bool{
        (username.count != 0 && password.count != 0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LoginView()
                .environment(\.colorScheme, .dark)
            LoginView()
                .environment(\.colorScheme, .light)
        }
    }
}
