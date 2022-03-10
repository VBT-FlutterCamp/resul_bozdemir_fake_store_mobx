import 'package:fake_store_api/core/base_view.dart';
import 'package:fake_store_api/feature/productview/viewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BaseView<ProductViewModel>(
      viewModel: ProductViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ProductViewModel viewModel) =>
          Scaffold(
              appBar: AppBar(title: const Text("Products")),
              body: Observer(builder: (_) {
                return viewModel.isLoading
                    ? ListView.builder(
                        itemCount: viewModel.productModel?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: height,
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      elevation: 10,
                                      child: Column(
                                        children: [
                                          Text(viewModel
                                                  .productModel?[index].title ??
                                              ""),
                                          Image(
                                            fit: BoxFit.scaleDown,
                                            image: NetworkImage(viewModel
                                                    .productModel?[index]
                                                    .image ??
                                                ""),
                                          ),
                                          Text(viewModel
                                                  .productModel?[index].price
                                                  .toString() ??
                                              ""),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              })),
    );
  }
}
