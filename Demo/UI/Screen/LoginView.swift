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
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .overlay(Color("background").opacity(0.2))
                .ignoresSafeArea()
                
                
        }
    }

    fileprivate func UserTextField() -> some View {
        return TextField("lbl_user", text: $username)
            .onChange(of: username, perform: { value in
                isDisabled = !isValidForm()
            })
            .textFieldStyle(LoginTextfieldStyle())
            .keyboardType(.emailAddress)
    }
    
    fileprivate func PasswordTextField() -> some View {
        return SecureField("lbl_password", text: $password)
            .onChange(of: password, perform: { value in
                isDisabled = !isValidForm()
            })
            .textFieldStyle(LoginTextfieldStyle())
    }
    
    fileprivate func LoginButton() -> some View {
        return Button(action: {
            validLoginWS()
        }, label: {
            Text("btn_login")
        })
        .buttonStyle(LoginButtonStyle(startColor: Color.yellow, endColor: Color.orange, colorScheme: colorScheme, isDisabled: isDisabled))
        .fullScreenCover(isPresented: $viewModel.success, content: {
            HomeView()
        })
        
    }
    
    fileprivate func LoginContainer() -> some View {
        return VStack(){
            UserTextField()
            PasswordTextField()
            LoginButton()
        }
        .padding(25)
        .background(Color("background"))
        .cornerRadius(CGFloat(RADIUS_STAND))
        .modifier(AdaptsToSoftwareKeyboard())
    }
    
    func validLoginWS(){
        viewModel.login(user: username, password: password)
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
