import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/snack.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Women Safety'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: SizedBox(
            height: 80,
            width: 80,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Text(
                'SOS',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                //Todo: Add on press functionality
              },
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Emergency Contacts',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Click on Phone number to call',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  int i = index + 1;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.teal,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${args['name$i']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () async {
                                  String url = 'tel:+91${args['phone$i']}';
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    launchUrl(Uri.parse(url));
                                  } else {
                                    Snack.show(
                                        context, 'Couldn\'t launch dialer');
                                  }
                                },
                                child: Text(
                                  '${args['phone$i']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
