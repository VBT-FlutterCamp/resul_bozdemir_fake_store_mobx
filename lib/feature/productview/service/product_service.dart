import 'package:fake_store_api/feature/productview/model/product_model.dart';
import 'package:vexana/vexana.dart';

abstract class IProductService {
  final INetworkManager networkManager;

  IProductService(this.networkManager);

  Future<List<ProductModel>?> storyFetch();
}

class ProductService extends IProductService {
  ProductService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProductModel>?> storyFetch() async {
    final response =
        await networkManager.send<ProductModel, List<ProductModel>>(
      "products?limit=5",
      parseModel: ProductModel(),
      method: RequestType.GET,
    );
    return response.data;
  }
}
