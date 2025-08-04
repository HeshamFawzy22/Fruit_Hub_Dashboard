import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/show_image_error.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/build_image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_item.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_item.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../domain/entities/product_entity.dart';
import '../../manager/cubit/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationMonths, numOfCalories, unitAmount;
  bool isFeaturedItem = false;
  bool isOrganicItem = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'اسم المنتج',
                inputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'سعر المنتج',
                inputType: TextInputType.number,
                onSaved: (value) {
                  price = num.parse(value!);
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'تاريخ الانتهاء',
                inputType: TextInputType.number,
                onSaved: (value) {
                  expirationMonths = num.parse(value!);
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'عدد السعرات الحرارية',
                inputType: TextInputType.number,
                onSaved: (value) {
                  numOfCalories = num.parse(value!);
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'عدد الوحدات',
                inputType: TextInputType.number,
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'كود المنتج',
                inputType: TextInputType.number,
                onSaved: (value) {
                  code = value!;
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'الوصف',
                inputType: TextInputType.text,
                maxLines: 5,
                onSaved: (value) {
                  description = value!;
                },
              ),
              const SizedBox(height: 16.0),
              IsOrganicItem(onChanged: (value) {
                setState(() {
                  isOrganicItem = value;
                });
              }),
              const SizedBox(height: 16.0),
              IsFeaturedItem(onChanged: (value) {
                setState(() {
                  isFeaturedItem = value;
                });
              }),
              const SizedBox(height: 16.0),
              BuildImageField(onImageChanged: (image) {
                this.image = image;
              }),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'إضافة منتج',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (image != null) {
                      ProductEntity product = ProductEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        numOfCalories: numOfCalories.toInt(),
                        expirationMonths: expirationMonths.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic: isOrganicItem,
                        idFeaturedItem: isFeaturedItem,
                        image: image!,
                        reviews: [
                          ReviewEntity(
                            name: 'هشام',
                            image: 'assets/images/avatar.png',
                            ratting: 5,
                            date: DateTime.now().toIso8601String(),
                            reviewDescreption: 'منتج جيد',
                          ),
                        ],
                      );
                      context.read<AddProductCubit>().addProduct(product);
                    } else {
                      showImageError(context);
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
