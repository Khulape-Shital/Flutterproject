import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todowithfirebase/TaskList.dart';
import 'package:todowithfirebase/firebase_options.dart';
import 'package:todowithfirebase/Category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference catagoriesRef =
        FirebaseFirestore.instance.collection('categories');
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: catagoriesRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final List<Category> Categories = snapshot.data!.docs
                .map((doc) => Category.fromSnapshot(doc))
                .toList();

                return ListView.builder(
                  itemCount: Categories.length,
                  itemBuilder: (context,index){
                    final category = Categories[index];
                    return ListTile(
                      title: Text(category.name),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Tasklist(categoryId: category.id, categoryName: category.name)
                        )
                          );
                      },
                    );
                }
                );

          }),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
            _showBottomSheet(context,catagoriesRef);
          },
          child: const Icon(Icons.add),
          ),
    );
  }
  void _showBottomSheet(BuildContext context,CollectionReference categoriesRef){
    final TextEditingController controller =TextEditingController();

    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Category name',

              ),
            ),
            const SizedBox(height: 20,),
         ElevatedButton(onPressed: () async{

         }, child: const Text('Add category'))
          ],
        ),
      );
    });
  }
}
