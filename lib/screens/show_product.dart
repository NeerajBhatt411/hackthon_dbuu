import 'package:flutter/material.dart';
import 'package:untitled2/common/common_widgets.dart';
import 'package:untitled2/controller/product_controller.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  ProductController controller = ProductController();
  TextEditingController nameController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Show Product"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: controller.fetchProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: const CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    SizedBox(
                      height: 20,
                    );
                    return Card(
                        color: Colors.deepPurple.shade400,
                        child: ListTile(
                          title: Text(
                            product.name.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(product.color,
                              style: TextStyle(color: Colors.white)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                 await  controller.deleteProduct(product.id);
                                  setState(() {

                                  });
                                  }, icon: Icon(Icons.delete,color: Colors.white,)),
//upate button
                              IconButton(
                                  onPressed: (){
                                    nameController.text = product.name;
                                    showDialog(context: context, builder: (context) {
                                      return AlertDialog(title: Text("This is Text",),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CommonWidget.buildTextFormField(controller: nameController, labelText: "Name", prefixIcon:Icons.person)
                                          ],
                                        ),
                                        actions: [
                                         TextButton(onPressed:  () async {
                                           await controller.updateProuct(product.id, {"Name": nameController.text});
                                           setState(() {

                                           });
                                           Navigator.pop(context);
                                           
                                         }, child: Text("Update"))
                                        ],
                                      );
                                    },);

                                  }, icon: Icon(Icons.edit,color: Colors.white,)),
                              Text(
                                product.price,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              );
            }
          },
        ));
  }
}
