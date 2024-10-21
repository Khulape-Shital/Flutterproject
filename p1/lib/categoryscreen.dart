import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p1/taskscreen.dart';
import 'package:p1/category.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CollectionReference categoriesRef =
        FirebaseFirestore.instance.collection('categories');

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: StreamBuilder<QuerySnapshot>(
        stream: categoriesRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Category> categories = snapshot.data!.docs
              .map((doc) => Category.fromSnapshot(doc))
              .toList();

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://png.pngtree.com/thumb_back/fh260/background/20210224/pngtree-blue-abstract-background-business-image_564246.jpg"),
                  fit: BoxFit.cover
              )
            ),
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  child: ListTile(
                    title: Text(category.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showBottomSheet(context, categoriesRef,
                                categoryId: category.id, initialName: category.name);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await categoriesRef.doc(category.id).delete();
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskList(
                            categoryId: category.id,
                            categoryName: category.name,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context, categoriesRef);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://st3.depositphotos.com/1654249/13003/i/450/depositphotos_130034044-stock-photo-blank-square-frame-or-white.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // Modified _showBottomSheet function for both add and update
  void _showBottomSheet(
      BuildContext context, CollectionReference categoriesRef,
      {String? categoryId, String? initialName}) {
    final TextEditingController _controller = TextEditingController();
    if (initialName != null) {
      _controller.text = initialName; // Prefill for update
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://static.vecteezy.com/system/resources/thumbnails/046/605/934/small/sky-with-a-beautiful-sunset-a-blue-and-orange-sky-with-soft-clouds-a-sky-background-photo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter category name',
                  labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String categoryName = _controller.text.trim();
                  if (categoryName.isNotEmpty) {
                    if (categoryId == null) {
                      // Create new category
                      await categoriesRef.add({
                        'name': categoryName,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    } else {
                      // Update existing category
                      await categoriesRef.doc(categoryId).update({
                        'name': categoryName,
                      });
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  categoryId == null ? 'Add Category' : 'Update Category',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
