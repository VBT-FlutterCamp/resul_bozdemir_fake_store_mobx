import 'package:fake_store_api/core/base_view_model.dart';
import 'package:fake_store_api/feature/productview/model/product_model.dart';
import 'package:fake_store_api/feature/productview/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'product_view_model.g.dart';

class ProductViewModel = _ProductViewModelBase with _$ProductViewModel;

abstract class _ProductViewModelBase with Store, BaseViewModel {
  late IProductService productService;

  @observable
  List<ProductModel>? productModel;
  @observable
  bool isLoading = true;

  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchStory() async {
    changeLoading();
    productModel = await productService.storyFetch();
    changeLoading();
  }

  @override
  void setContext(BuildContext context) {}
  @override
  void init() {
    productService = ProductService(networkManager);
    fetchStory();
  }
}
