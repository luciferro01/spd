import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spd/gpt_assistant/chat_gpt/controller/chat_gpt_controller.dart';

class ChatGpt extends StatelessWidget {
  final controller = Get.put(ChatGptController());
  String prompt = "";
  ChatGpt({super.key});
  // TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          child: Icon(
            CupertinoIcons.chevron_back,
            size: size.width * 0.08,
            // color: Colors.black,
          ),
        ),
        middle: const Text(
          'Chat GPT',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.26),
                    const Text(
                      'Hey!',
                      style: TextStyle(fontSize: 35),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Icon(
                      CupertinoIcons.heart,
                      size: size.height * 0.3,
                    ),
                    SizedBox(height: size.height * 0.03),
                    const Text(
                      'Welcome to Chat - GPT',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: size.height * 0.03),
                    const Text(
                      'Your very own assistant',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
          CupertinoTextField(
            autocorrect: true,
            autofocus: false,
            onChanged: (value) {
              prompt = value;
            },
            // controller: controller.textEditingController,

            suffix: CupertinoButton(
                child: const Icon(
                  CupertinoIcons.arrow_turn_up_right,
                  size: 30,
                ),
                // onPressed: () {
                //   print(textEditingController);
                // },
                onPressed: () async {
                  // String value = "hello";
                  // value = controller.textEditingController.toString();
                  // await ChatGptServices()
                  //     .chatGptResponse(textEditingController.text);
                  controller.chatGptResponse(prompt);
                  debugPrint('Button Pressed');
                }),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            style: const TextStyle(fontSize: 24),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.lightBlueAccent),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            // minLines: 1,
            // maxLines: 4,
            clearButtonMode: OverlayVisibilityMode.always,
            // onSubmitted: () {},
          ),
        ],
      ),
    );
  }
}
