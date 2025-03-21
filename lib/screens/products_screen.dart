import 'package:flutter/material.dart';
import 'package:untitled2/common/common_widgets.dart';
import 'package:untitled2/controller/product_controller.dart';
import 'package:untitled2/models/product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  ProductController controller = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      // body: ListView.builder(
      //   itemCount: controller.products.length,
      //   itemBuilder: (context, index) {
      //     final product = controller.products[index];
      //     return ListTile(title: Text(product.name),
      //       subtitle: Text(product.color),
      //         trailing: Text(product.price.toString()),
      //     );
      //
      //
      // },)

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CommonWidget.buildTextFormField(
                controller: nameController,
                labelText: "Name",
                prefixIcon: Icons.person),
            SizedBox(
              height: 20,
            ),
            CommonWidget.buildTextFormField(
                controller: colorController,
                labelText: "Color",
                prefixIcon: Icons.color_lens),
            SizedBox(
              height: 20,
            ),
            CommonWidget.buildTextFormField(
                controller: priceController,
                labelText: "Price",
                prefixIcon: Icons.price_change),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    controller.uploadProducts(ProductModel(
                        name: nameController.text.toString(),
                        color: colorController.text.toString(),
                        price:
                          priceController.text.toString(),


                        id: '',
                    ));
                    nameController.clear();
                    colorController.clear();
                    priceController.clear();
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
