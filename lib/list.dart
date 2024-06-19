import 'package:app1/firebase_service.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
      ),
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: FutureBuilder(
        future: getFutneet(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          var data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var item = data[index];
              var uid = item['uid'] ?? 'no-uid';
              var title = item['title'] ?? 'Untitled';

              return Dismissible(
                onDismissed: (direction) async {
                  await deleteFutneet(uid);
                  setState(() {
                    data.removeAt(index);
                  });
                },
                confirmDismiss: (direction) async {
                  bool result = false;
                  result = await showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("¿Eliminar a $title?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text("Comfirmar"),
                        ),
                      ],
                    );
                  });
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete),
                ),
                direction: DismissDirection.endToStart,
                key: Key(uid),
                child: ListTile(
                  title: Text(title),
                  onTap: () async {
                    await Navigator.pushNamed(context, "/edit", arguments: {
                      "title": title,
                      "uid": uid,
                    });
                    setState(() {});
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addNews");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
