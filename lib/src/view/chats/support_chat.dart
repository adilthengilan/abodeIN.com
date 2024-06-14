import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/chat_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupportChat extends StatefulWidget {
  final double height;
  final double width;
  const SupportChat({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<SupportChat> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<SupportChat> {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Color.fromARGB(255, 220, 247, 255),
        shadowColor: backgroundColor,
        elevation: .01,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Support', style: mediumTextStyleLight),
            sizedBox(widget.height * 0.002, 0.0),
            Text('24 Hour custumer support', style: smallTextStyle)
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: chatProvider.scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Consumer<ChatProvider>(
              builder: (context, chat, child) => 
              ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chat.messages.length,
                itemBuilder: (context, index) {
                  final message = chat
                      .messages[chat.messages.length - 1 - index];
                  return Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: widget.height * 0.01,
                            horizontal: widget.width * 0.02,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.width * 0.03,
                            vertical: widget.height * 0.012,
                          ),
                          decoration: BoxDecoration(
                            gradient: message['sender'] != 'user'
                                ? LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                        Color.fromARGB(255, 163, 238, 255),
                                        Color.fromARGB(255, 252, 215, 249),
                                      ])
                                : LinearGradient(
                                    colors: [
                                      Colors.grey.shade200,
                                      Colors.white
                                    ],
                                  ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.grey.shade300,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: message['sender'] == 'user'
                                  ? Radius.circular(10)
                                  : Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: message['sender'] == 'bot'
                                  ? Radius.circular(10)
                                  : Radius.circular(0),
                            ),
                          ),
                          child: Text(
                            message['text']!,
                            style: smallTextStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        surfaceTintColor: Colors.transparent,
        padding: EdgeInsets.only(
            left: widget.width * 0.02,
            right: widget.width * 0.03,
            top: widget.height * 0.014),
        height: MediaQuery.of(context).viewInsets.bottom + widget.height * 0.1,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: chatProvider.predefinedMessages.keys.map((msg) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: widget.width * 0.012),
                    child: Consumer<ChatProvider>(
                      builder: (context, chat, child) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => chat.sendMessage(msg),
                        child: Text(msg),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<ChatProvider>(
        builder: (context, chat, child) => Visibility(
          visible: chat.isFabVisible,
          child: FloatingActionButton(
            mini: true,
            elevation: 0,
            shape: CircleBorder(),
            onPressed: chat.scrollToBottom,
            child: Icon(Icons.keyboard_double_arrow_down_outlined),
          ),
        ),
      ),
    );
  }
}
