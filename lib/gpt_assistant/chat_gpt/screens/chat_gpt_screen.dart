import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spd/gpt_assistant/chat_gpt/controller/chat_gpt_controller.dart';

// ignore: must_be_immutable
class ChatGpt extends StatelessWidget {
  ChatGpt({super.key});
  final controller = Get.put(ChatGptController());
  String prompt = "";
  String response = '';
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
            child: SizedBox(
              // decoration: BoxDecoration(
              // color: Colors.black54,
              // borderRadius:
              //     BorderRadius.only(bottomRight: Radius.circular(12))),
              width: double.infinity,
              height: size.height * 0.5,
              child: Obx(
                () => SingleChildScrollView(
                  child: controller.isPrompt.value == false
                      ? SizedBox(
                          height: size.height * 1.0,
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
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.26),
                            MessageBubble(response: prompt),
                            MessageBubble(
                              response: controller.response.toString(),
                            ),
                          ],
                        ),
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
            suffix: CupertinoButton(
                child: const Icon(
                  CupertinoIcons.arrow_turn_up_right,
                  size: 30,
                ),
                onPressed: () async {
                  controller.isPrompt.value = false;
                  response = await controller.chatGptResponse(prompt);
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
            // clearButtonMode: OverlayVisibilityMode.always,
            // onSubmitted: () {},
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.response,
  });

  final String response;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(14),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
        color: Colors.grey,
      ),
      child: AnimatedTextKit(
        repeatForever: false,
        displayFullTextOnTap: true,
        isRepeatingAnimation: false,
        animatedTexts: [
          TypewriterAnimatedText(
            response,
            textStyle: const TextStyle(fontSize: 20),
            speed: const Duration(milliseconds: 50),
          ),
        ],
      ),
    );
  }
}
