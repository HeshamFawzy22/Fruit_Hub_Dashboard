import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';

class OrderEntity {
  final String uId;
  final String orderId;
  final double totalPrice;
  final ShippingAddressModel shippingAddress;
  final String paymentMethod;
  final List<OrderProductModel> products;
  final OrderStatus status;

  OrderEntity({
    required this.uId,
    required this.orderId,
    required this.status,
    required this.totalPrice,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.products,
  });
}

/**
 * uId: Unique identifier for the user placing the order.
 * total price: Total price of the order.
 * shipping address: Shipping address for the order.
 * payment method: Method of payment for the order (e.g., cash on delivery, online payment).
 * List of products: List of products included in the order.
 */
