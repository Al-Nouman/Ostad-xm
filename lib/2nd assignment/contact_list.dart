import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contact List",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const ContactScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final List<Map<String, String>> _contacts = [];

  //contact function
  _addContact() {
    if (_nameController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      setState(() {
        _contacts.add({
          'name': _nameController.text,
          'number': _numberController.text,
        });
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  //alertdialog
  _alertDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Are you sure for delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.signal_cellular_no_sim_outlined,
                  color: Colors.blue),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.delete_outline, color: Colors.blue),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Contact List", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          //input name
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 2.5),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          //input number
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2.5, 10, 0),
            child: TextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          //add button
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("Add"),
              ),
            ),
          ),

          //contact list view

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.blueGrey),
                      title: Text(
                        _contacts[index]['name']!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      subtitle: Text(_contacts[index]['number']!),
                      trailing: const Icon(Icons.call, color: Colors.blue),
                      onLongPress: () => _alertDialog(context, index),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
