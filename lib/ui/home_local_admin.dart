import 'package:flutter/material.dart';

import '../global.dart';

class HomeLocalAdmin extends StatefulWidget {
  const HomeLocalAdmin({Key? key}) : super(key: key);

  @override
  State<HomeLocalAdmin> createState() => _HomeLocalAdminState();
}

class _HomeLocalAdminState extends State<HomeLocalAdmin> {
  @override
  Widget build(BuildContext context) {
    Globals.fcm.subscribeToTopic('LocalAdmin');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Safety'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Users in area',
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
              itemCount: 6,
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
                              'User$i',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'phone$i',
                              style: const TextStyle(
                                fontSize: 18,
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
    );
  }
}
