import 'package:api_integeration/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:api_integeration/services/base_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];

  getData() async {
    products = await getProductsApi();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products Api',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: getProductsApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(products[index].image),
                            ),
                            trailing:
                                Text(products[index].rating.rate.toString()),
                            title: Text(products[index].title),
                            subtitle: Text(products[index].description),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                }));
          }),
    );
  }
}
