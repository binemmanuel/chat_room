import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/models/fake_user.dart';
import 'package:frontend/src/models/message.dart';
import 'package:frontend/src/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'utils/palette.dart';
import 'widgets/message_card.dart';
// import 'widgets/message_card.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  late FakeUser loggedInUser;
  late FocusNode chatInputFocusNode;
  late TextEditingController chatInputController;
  late ScrollController chatRoomScrollController;

  List<Message> messages = [];

  @override
  void initState() {
    super.initState();

    chatInputController = TextEditingController();
    chatInputFocusNode = FocusNode();
    chatRoomScrollController = ScrollController();

    loggedInUser = context.read<AuthService>().loggedInUser;

    messages = [
      Message(
        id: '1',
        message: 'Hello',
        sender: loggedInUser,
      ),
      Message(
        id: '2',
        message: 'Hi',
        sender: FakeUser(id: '2', username: 'Jane Doe'),
      ),
    ];
  }

  @override
  void dispose() {
    chatInputController.dispose();
    chatInputFocusNode.dispose();
    chatRoomScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chatInputFocusNode.unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.backgroundColor,
          title: const Text('Chat Room'),
        ),

        // The chat room
        body: ListView.separated(
          controller: chatRoomScrollController,
          padding: const EdgeInsets.all(10),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            final message = messages[index];

            return MessageCard(
              message: message,
              isMine: message.sender == loggedInUser,
            );
          },
          separatorBuilder: (_, index) => const SizedBox(height: 10),
        ),

        // Chat input field
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: TextField(
              controller: chatInputController,
              focusNode: chatInputFocusNode,
              onSubmitted: (value) => sendMessage(),
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                  isDense: true,

                  // Send Button
                  suffixIcon: IconButton(
                    tooltip: 'Send',
                    onPressed: sendMessage,
                    icon: const Icon(
                      CupertinoIcons.paperplane,
                      size: 25,
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  void sendMessage() {
    final text = chatInputController.text.trim();

    if (text.isEmpty) return;

    final message = Message(
      id: const Uuid().v4(),
      message: text,
      sender: loggedInUser,
    );

    /// TODO: Send the message here
    log(message.toString());

    // Add the message to the list of messages
    messages.add(message);
    setState(() {});

    // Clear the input field
    chatInputController.clear();

    // Keep the focus on the input field
    chatInputFocusNode.requestFocus();

    // Auto scroll to the last message
    moveToLastMessage();
  }

  void moveToLastMessage() {
    chatRoomScrollController.animateTo(
      chatRoomScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
