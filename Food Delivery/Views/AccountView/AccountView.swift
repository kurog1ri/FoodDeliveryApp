//
//  AccountView.swift
//  Food Delivery
//
//  Created by   Kosenko Mykola on 19.07.2024.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var vm = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section(header: Text("Your Personal Info")) {
                    TextField("First Name", text: $vm.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.continue)
                    
                    TextField("Last Name", text: $vm.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.continue)
                    
                    TextField("Your Email", text: $vm.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.done)
                    
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $vm.user.birthDay, displayedComponents: .date)
                        .foregroundColor(.myColor)
                    
                    Button {
                        vm.save()
                    } label: {
                        Text("Save")
                    }
                }
                Section(header: Text("Additional Requests")) {
                    Toggle("Add napkins", isOn: $vm.user.napkins)
                    Toggle("Frequent Refills", isOn: $vm.user.frequent)
                }
                .toggleStyle(SwitchToggleStyle(tint: .myColor))
            }
            .navigationTitle("👤 Account 👤")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            vm.getUser()
        }
        .alert(item: $vm.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
