import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

import 'build_action_buttons.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// السعر الإجمالي
            Row(
              children: [
                Text('الإجمالي: ${order.totalPrice.toStringAsFixed(2)} ج.م',
                    style: TextStyles.bold16),
                const Spacer(),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: getOrderStatusColor(order.status),
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    getArabicOrderStatus(order.status),
                    style: TextStyles.bold13.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'اسم المستخدم: ${order.userName}',
              style: TextStyles.bold13.copyWith(
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'الرقم: ${order.uId}',
              style: TextStyles.bold13.copyWith(
                color: Colors.grey[500],
              ),
            ),

            const Divider(height: 24),

            /// بيانات الشحن
            Text(
              'عنوان الشحن:',
              style: TextStyles.bold13,
            ),
            const SizedBox(height: 4),
            Text(order.shippingAddress.toString()),
            Text('هاتف: ${order.shippingAddress.phone ?? 'غير متوفر'}',
                style: TextStyles.bold13),

            const Divider(height: 24),

            /// طريقة الدفع
            Text(
              'طريقة الدفع: ${order.paymentMethod}',
              style: TextStyles.bold13.copyWith(
                color: Colors.grey[500],
              ),
            ),

            const Divider(height: 24),

            /// قائمة المنتجات
            Text(
              'المنتجات:',
              style: TextStyles.bold16,
            ),
            const SizedBox(height: 8),

            ListView.builder(
              itemCount: order.products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = order.products[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      /// صورة المنتج
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.imageUrl,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_not_supported),
                        ),
                      ),
                      const SizedBox(width: 12),

                      /// تفاصيل المنتج
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(
                              'الكود: ${product.code}',
                            ),
                            Text('الكمية: ${product.quantity}'),
                          ],
                        ),
                      ),

                      /// السعر
                      Text('${product.price.toStringAsFixed(2)} ج.م',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          )),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BuildActionButtons(
              orderEntity: order,
            ),
          ],
        ),
      ),
    );
  }

  Color getOrderStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.grey;
      case OrderStatus.cancelled:
        return Colors.red;
      case OrderStatus.processing:
        return Colors.blue;
      case OrderStatus.accepted:
        return Colors.green;
      case OrderStatus.delivered:
        return Colors.teal;
      case OrderStatus.refunded:
        return Colors.purple;
    }
  }

  String getArabicOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'قيد الانتظار';
      case OrderStatus.cancelled:
        return 'ملغي';
      case OrderStatus.processing:
        return 'قيد المعالجة';
      case OrderStatus.accepted:
        return 'تم القبول';
      case OrderStatus.delivered:
        return 'تم التوصيل';
      case OrderStatus.refunded:
        return 'تم الاسترجاع';
    }
  }
}
