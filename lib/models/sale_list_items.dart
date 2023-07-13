class SaleListModel {
  final String productID;
  final String productName;
  final String productImage;
  final double productPrice;

  int productQuantity;

  SaleListModel({
    required this.productID,
    required this.productQuantity,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });
}
