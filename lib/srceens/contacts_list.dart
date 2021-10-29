import 'package:flutter/material.dart';
import 'package:projeto2/database/app_database.dart';
import 'package:projeto2/models/contact.dart';
import 'package:projeto2/srceens/contact_from.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      // inserido generics no FutureBuilder
      body: FutureBuilder<List<Contact>>(
        future: findAll(),
        builder: (context, snapshot) {
          final List<Contact>? contacts = snapshot
              .data; // usado null safe na lista pois é regra da nova versão do flutter
          if (contacts != null) {
            //feito if para validar nulo
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return _ContactItem(contact);
              },
              itemCount: contacts.length,
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              )
              .then(
                (newContact) => debugPrint(newContact.toString()),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
