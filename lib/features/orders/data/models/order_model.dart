import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final String orderId;
  final String name;
  final double totalPrice;
  final ShippingAddressModel shippingAddress;
  final String paymentMethod;
  final List<OrderProductModel> products;
  final String status;

  OrderModel({
    required this.uId,
    required this.orderId,
    required this.name,
    required this.status,
    required this.totalPrice,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'orderId': orderId,
      'name': name,
      'status': status,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress.toJson(),
      'paymentMethod': paymentMethod,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uId: json['uId'],
      orderId: json['orderId'],
      name: ShippingAddressModel.fromJson(json['shippingAddress']).name.toString(),
      status: json['status'],
      totalPrice: json['totalPrice'],
      shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
      paymentMethod: json['paymentMethod'],
      products: (json['products'] as List)
          .map((product) => OrderProductModel.fromJson(product))
          .toList(),
    );
  }

  toEntity() {
    return OrderEntity(
      uId: uId,
      orderId: orderId,
      userName: name,
      status: fetchOrderStatus(),
      totalPrice: totalPrice,
      shippingAddress: shippingAddress,
      paymentMethod: paymentMethod,
      products: products,
    );
  }

  OrderStatus fetchOrderStatus() {
    return OrderStatus.values.firstWhere((e) {
      return e.name.toString() == status;
    });
  }
}

/**
 * uId: Unique identifier for the user placing the order.
 * total price: Total price of the order.
 * shipping address: Shipping address for the order.
 * payment method: Method of payment for the order (e.g., cash on delivery, online payment).
 * List of products: List of products included in the order.
 */
