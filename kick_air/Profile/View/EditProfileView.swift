//
//  EditProfileView.swift
//  kick_air
//
//  Created by Kry Sonita on 28/02/2025.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var email: String = "nitafromyt@gmail.com"
    @State private var username: String = "Kry Sonita"
    @State private var profileImage: UIImage?
    @State private var isShowingPhotoPicker = false
    @Environment(\.dismiss) var dimiss
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                if let image = profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2.5))
                } else {
                    Image("berger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2.5))
                        .padding()
                }

                Button(action: {
                    isShowingPhotoPicker = true
                }) {
                    Text("Edit Photo")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShowingPhotoPicker) {
                    ImagePicker(selectedImage: $profileImage)
                }
            }
            .frame(maxWidth: .infinity)


            VStack(alignment: .leading, spacing: 15) {
                CustomTextFields(icon: "person.fill", placeholder: "Enter your name", text: $username)
                CustomTextFields(icon: "envelope.fill", placeholder: "Enter your email", text: $email)
            }
            .padding([.leading, .trailing], 16)

            Button(action: {
                saveProfileChanges()
                dimiss()
            }) {
                Text("Save Changes")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(25)
            }
            .padding([.leading, .trailing], 16)
        }
        .padding()
    }

    private func saveProfileChanges() {
        print("Saved Username: \(username), Email: \(email)")
    }
}

struct CustomTextFields: View {
    var icon: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .padding(.leading, 10)
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal, 10)
        .frame(height: 50)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                parent.selectedImage = image
            } else if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    EditProfileView()
}

