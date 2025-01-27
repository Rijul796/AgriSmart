//
//  ChatMessage.swift
//  AgriSmart_12
//
//  Created by Rijul Sharma on 22/01/25.
//


import UIKit

struct ChatMessage {
    let content: String
    let isFromCurrentUser: Bool
    let timestamp: Date
}

class DetailChatViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentPickerDelegate{

    var userName: String = ""
    var userImage: UIImage?
    private var messages: [ChatMessage] = []

    private let automatedResponses: [String: [String]] = [
        "hi": ["Hello! Ready to pick some fresh vegetables today?", "Hi! Looking for farm-fresh vegetables? Let me know what you need!", "Hey there! How can I help you with your vegetable shopping today?"],
        "hello": ["Hello! Ready to pick some fresh vegetables today?", "Hi! Looking for farm-fresh vegetables? Let me know what you need!", "Hey there! How can I help you with your vegetable shopping today?"],
        "how's the farm": ["The farm is doing great! The vegetables are growing wonderfully. How can I assist you with your veggie needs today?", "The farm is thriving! What vegetables can I help you find today?", "The crops are healthy and fresh! What veggies can I get for you today?"],
        "good morning": ["Good morning! Ready for some fresh vegetables to start your day?", "Morning! How can I help you find the best vegetables today?", "Good morning! Looking for fresh veggies to cook with today?"],
        "what's growing": ["Just harvesting the freshest veggies from the garden! How can I help you today?", "The crops are in full bloom! What can I get for you today?", "I'm busy tending to the garden! What fresh veggies can I get for you today?"],
        "bye": ["Goodbye! Enjoy your fresh vegetables, and have a great day!", "Take care, and thanks for supporting fresh produce!", "See you later! Come back anytime for more farm-fresh vegetables!"],
        "thanks": ["You're welcome! Glad I could provide you with some fresh veggies!", "Anytime! Let me know if you need more fresh vegetables!", "You're welcome! Enjoy your vegetables and happy cooking!"],
        "default": ["Thanks for reaching out! What vegetables are you looking for today?", "I can help you with fresh tomatoes, spinach, carrots, and more! What do you need?", "We’ve got fresh veggies ready! What can I assist you with today?"]
    ]

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupMessageInput()
        loadInitialMessages()
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        navigationItem.title = nil  // Ensure no title is set
        
        profileImageView.image = userImage
        nameLabel.text = userName
        
        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    private func setupUI() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.image = userImage
        nameLabel.text = userName

        let navView = UIView()
        navView.translatesAutoresizingMaskIntoConstraints = false

        let leftBarButtonItem = UIBarButtonItem(customView: navView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
 
        navView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 40).isActive = true
         messageTextField.placeholder = "Type a message..."
        messageTextField.delegate = self
//        messageTextField.backgroundColor = .white
//        messageTextField.textColor = .black

        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }

      private func setupTableView() {
          chatTableView.delegate = self
          chatTableView.dataSource = self
          chatTableView.register(ChatMessageCell.self, forCellReuseIdentifier: "ChatMessageCell")
          chatTableView.separatorStyle = .none
          chatTableView.backgroundColor = .systemBackground

          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
      }

      private func setupMessageInput() {
          messageTextField.layer.cornerRadius = 18
          messageTextField.layer.borderWidth = 2
          messageTextField.layer.borderColor = UIColor.systemGray4.cgColor
          messageTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
          messageTextField.leftViewMode = .always
      }

      private func loadInitialMessages() {
          messages = [
              ChatMessage(content: "Hey! How can i assist you today?", isFromCurrentUser: false, timestamp: Date().addingTimeInterval(-3600)),
          ]
          chatTableView.reloadData()
          scrollToBottom()
      }

      private func getAutomatedResponse(for message: String) -> String {
          let lowercasedMessage = message.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
          for (key, responses) in automatedResponses {
              if lowercasedMessage.contains(key) {
                  return responses.randomElement() ?? automatedResponses["default"]!.randomElement()!
              }
          }
          return automatedResponses["default"]!.randomElement()!
      }

      private func simulateTypingAndRespond(with response: String) {
          let typingMessage = ChatMessage(content: "Typing...", isFromCurrentUser: false, timestamp: Date())
          messages.append(typingMessage)
          chatTableView.reloadData()
          scrollToBottom()

          DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
              guard let self = self else { return }
              self.messages.removeLast()
              let responseMessage = ChatMessage(content: response, isFromCurrentUser: false, timestamp: Date())
              self.messages.append(responseMessage)
              self.chatTableView.reloadData()
              self.scrollToBottom()
          }
      }

      @objc private func sendButtonTapped() {
          guard let messageText = messageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !messageText.isEmpty else { return }

          let newMessage = ChatMessage(content: messageText, isFromCurrentUser: true, timestamp: Date())
          messages.append(newMessage)
          messageTextField.text = ""

          chatTableView.reloadData()
          scrollToBottom()

          let response = getAutomatedResponse(for: messageText)
          simulateTypingAndRespond(with: response)
      }

      @objc private func plusButtonTapped() {
          let actionSheet = UIAlertController(title: "Choose Source", message: nil, preferredStyle: .actionSheet)

          actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
              self.openCamera()
          }))

          actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
              self.openPhotoLibrary()
          }))

          actionSheet.addAction(UIAlertAction(title: "Files", style: .default, handler: { _ in
              self.openFilePicker()
          }))

          actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
          present(actionSheet, animated: true, completion: nil)
      }

      private func openCamera() {
          // Check if the device has a camera
          guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
              print("Camera not available")
              return
          }

          let imagePickerController = UIImagePickerController()
          imagePickerController.delegate = self
          imagePickerController.sourceType = .camera
          imagePickerController.mediaTypes = ["public.image"]  // Set it to allow images only
          present(imagePickerController, animated: true, completion: nil)
      }

      private func openPhotoLibrary() {
          guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
              print("Photo library not available")
              return
          }

          let imagePickerController = UIImagePickerController()
          imagePickerController.delegate = self
          imagePickerController.sourceType = .photoLibrary
          imagePickerController.mediaTypes = ["public.image"]  // Set it to allow images only
          present(imagePickerController, animated: true, completion: nil)
      }

    private func openFilePicker() {
        // Use UTType instead of documentTypes
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.item], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
    }

      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          if let selectedImage = info[.originalImage] as? UIImage {
              // Handle the selected image (e.g., display it or send it in the chat)
              print("Selected image: \(selectedImage)")
          }
          picker.dismiss(animated: true, completion: nil)
      }

      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          picker.dismiss(animated: true, completion: nil)
      }

      func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
          // Handle the selected file URL(s)
          for url in urls {
              print("Selected file: \(url)")
          }
      }

      func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
          print("Document picker was cancelled.")
      }

      private func scrollToBottom() {
          guard !messages.isEmpty else { return }
          let indexPath = IndexPath(row: messages.count - 1, section: 0)
          chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
      }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            chatTableView.contentInset.bottom = keyboardSize.height
            chatTableView.verticalScrollIndicatorInsets.bottom = keyboardSize.height
            scrollToBottom()
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        chatTableView.contentInset.bottom = 0
        chatTableView.verticalScrollIndicatorInsets.bottom = 0
    }


      @objc private func backButtonTapped() {
          navigationController?.popViewController(animated: true)
      }

      @objc private func shareButtonTapped() {
          print("Share button tapped")
      }
  }

  extension DetailChatViewController: UITableViewDelegate, UITableViewDataSource {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return messages.count
      }

      class ChatMessageCell: UITableViewCell {
          private let messageLabel = UILabel()
          private let messageContainer = UIView()

          override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
              super.init(style: style, reuseIdentifier: reuseIdentifier)

              contentView.addSubview(messageContainer)
              messageContainer.addSubview(messageLabel)

              messageLabel.numberOfLines = 0
              messageLabel.translatesAutoresizingMaskIntoConstraints = false
              messageContainer.translatesAutoresizingMaskIntoConstraints = false

              NSLayoutConstraint.activate([
                  messageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                  messageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                  messageLabel.topAnchor.constraint(equalTo: messageContainer.topAnchor, constant: 5),
                  messageLabel.bottomAnchor.constraint(equalTo: messageContainer.bottomAnchor, constant: -5),
                  messageLabel.leadingAnchor.constraint(equalTo: messageContainer.leadingAnchor, constant: 10),
                  messageLabel.trailingAnchor.constraint(equalTo: messageContainer.trailingAnchor, constant: -10)
              ])

              messageContainer.layer.cornerRadius = 15
              messageContainer.layer.masksToBounds = true
          }

          required init?(coder: NSCoder) {
              fatalError("init(coder:) has not been implemented")
          }

          func configure(with message: ChatMessage) {
              messageLabel.text = message.content

              if message.isFromCurrentUser {
                  // Align user messages to the right
                  messageContainer.backgroundColor = .systemBlue
                  messageLabel.textColor = .white
                  messageLabel.textAlignment = .right
 
                  messageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90).isActive = true
                  messageContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
              } else {
                  // Align system messages to the left
                  messageContainer.backgroundColor = .lightGray
                  messageLabel.textColor = .black
                  messageLabel.textAlignment = .left
 
                  messageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
                  messageContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -90).isActive = true
              }
          }
      }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatMessageCell") as? ChatMessageCell else {
              return UITableViewCell()
          }
          let message = messages[indexPath.row]
          cell.configure(with: message)
          return cell
      }
  }
