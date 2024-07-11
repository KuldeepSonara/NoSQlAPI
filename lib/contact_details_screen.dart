import 'package:flutter/material.dart';
import 'package:crudsqllite/database_helper.dart';
import 'package:crudsqllite/update_data_screen.dart';

class ContactDetailsScreen extends StatefulWidget {
  final Contact contact;

  const ContactDetailsScreen({super.key, required this.contact});

  @override
  _ContactDetailsScreenState createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  DatabaseHelper dbHelper = DatabaseHelper();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.contact.name;
    addressController.text = widget.contact.address;
    phoneController.text = widget.contact.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTextWidget('Name', nameController.text),
          const SizedBox(height: 16.0),
          _buildTextWidget('Address', addressController.text),
          const SizedBox(height: 16.0),
          _buildTextWidget('Phone', phoneController.text),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateContactScreen(contact: widget.contact),
                ),
              ).then((value) => _refreshContacts());
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextWidget(String label, String value) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value),
    );
  }

  void _refreshContacts() {
    // Implement your refresh logic here if needed
  }
}
