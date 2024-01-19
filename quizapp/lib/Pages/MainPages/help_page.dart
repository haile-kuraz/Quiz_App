import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'package:provider/provider.dart';

import '../../Provider/DataProvider.dart';
import '../../Widgets/ReportAproblemButton.dart';
import '../../Widgets/UnderlinedTextFormfield.dart';
import '../../Widgets/messageTextAreaforReportProblem.dart';

class Help_page extends StatelessWidget {
  Help_page({super.key});
  TextEditingController SubjectController = TextEditingController();
  TextEditingController messageProblemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var DataProviderState = Provider.of<DataProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("FAQ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: ExpansionTile(
                        backgroundColor: Theme.of(context).canvasColor,
                        // collapsedBackgroundColor: Theme.of(context).canvasColor,
                        collapsedBackgroundColor: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.4),
                        title: Text(
                          "${DataProviderState.getFAQData()[index]["Title"]}",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: size.height * 0.3,
                              maxWidth: size.width,
                              minHeight: size.height * 0.1,
                              minWidth: size.width,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 40, bottom: 10),
                              child: Text(
                                "${DataProviderState.getFAQData()[index]["Message"]}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        // textColor: ,
                      ),
                    );
                  },
                  itemCount: DataProviderState.getFAQData().length,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            Text(
                              "Haven't found an answer to ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                  ),
                            ),
                            Text(
                              "your question ?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      ReportAproblemButton(myfunction: () {
                        _bottomSheetBuilder(context);
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _bottomSheetBuilder(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "How can we help you ? ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              UnderlinedTextFormfield(
                hint: " ",
                inputController: SubjectController,
                lable: "Subject",
                expression: RegExp(r'^[a-zA-Z]{1,45}$'),
              ),
              // const UnderlinedTextFormfield(),
              messageTextAreaforReportProblem(
                  inputController: messageProblemController),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ReportAproblemButton(myfunction: () {
                  if (SubjectController.text != "" &&
                      SubjectController.text != "") {
                    sendEmail(
                      SubjectController.text,
                      messageProblemController.text,
                      "hailetechlover@gmail.com",
                    );
                  }
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  sendEmail(String subject, String body, String recipientemail) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipientemail],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  // sendEmail(String subject, String body, String recipientemail,
  //     String useremail) async {
  //   final message = Message()
  //     ..from = Address(recipientemail, 'Your name')
  //     ..recipients.add(useremail)
  //     // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //     // ..bccRecipients.add(Address('bccAddress@example.com'))
  //     ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
  //     ..text = 'This is the plain text.\nThis is line 2 of the text part.';
  //   // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  //   try {
  //     final sendReport = await send(message, smtpServer);
  //     print('Message sent: ' + sendReport.toString());
  //   } on MailerException catch (e) {
  //     print('Message not sent.');
  //     for (var p in e.problems) {
  //       print('Problem: ${p.code}: ${p.msg}');
  //     }
  //   }
  // }
}
