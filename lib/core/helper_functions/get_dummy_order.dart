import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

OrderEntity getDummyOrders() {
  List<OrderProductModel> products = [
    OrderProductModel(
      name: 'تيشيرت رجالي',
      code: 'TSH123',
      imageUrl:
          'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=2048x2048&w=is&k=20&c=KTpY1O4d7-EuX-R_GR_44Upc-n9esJOZFpcqvA4CM0E=',
      price: 300.0,
      quantity: 2,
    ),
    OrderProductModel(
      name: 'بنطال جينز',
      code: 'JNS456',
      imageUrl:
          'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=2048x2048&w=is&k=20&c=KTpY1O4d7-EuX-R_GR_44Upc-n9esJOZFpcqvA4CM0E=',
      price: 450.0,
      quantity: 1,
    ),
  ];
  ShippingAddressModel shippingAddresses = ShippingAddressModel(
    name: 'أحمد محمد',
    phone: '0123456789',
    address1: '123 شارع النيل، القاهرة، مصر',
    city: 'القاهرة',
  );
  List<String> paymentMethods = [
    'الدفع عند الاستلام',
    'الدفع عن طريق Paypal',
  ];
  OrderStatus status = OrderStatus.pending;
  double totalPrice =
      products.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  String uId = 'ORDER123456';
  String orderId = 'ORDER123';
  // Create and return the OrderEntity

  return OrderEntity(
    uId: uId,
    orderId: orderId,
    status: status,
    totalPrice: totalPrice,
    shippingAddress: shippingAddresses,
    paymentMethod: paymentMethods[0],
    products: products,
  );
}
