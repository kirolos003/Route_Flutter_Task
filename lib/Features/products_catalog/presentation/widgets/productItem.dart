import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> words = product.title!.split(' ');

    String? displayText = words.length > 1 ? '${words[0]} ${words[1]}' : product.title;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding:  EdgeInsets.only(right: 16.0.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
            height: 122.r,
            width: 158.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children:[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: product.images != null && product.images!.length > 1 ? product.images![1] : '', // Add a null check here
                          height: 200.r,
                          width: double.infinity,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          right: 5.w,
                          child: IconButton(onPressed: (){},
                              icon : InkWell(
                                onTap: () {
                                  },
                              child: Container(
                                width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                  child: ImageIcon(const AssetImage('assets/icons/wish.png') , size: 30.sp,))))),
                    ] ,
                  ),
                ),
                 SizedBox(height: 8.r),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                  child: Text(
                    displayText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xff06004F),
                      fontSize: 14.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 SizedBox(height: 8.r),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'EGP',
                              style: TextStyle(
                                color: const Color(0xff06004F),
                                fontSize: 9.r,
                              ),
                            ),
                             SizedBox(width: 5.r),
                            Text(
                              '${product.price}',
                              style: TextStyle(
                                color: const Color(0xff06004F),
                                fontSize: 14.r,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             SizedBox(width: 10.r),
                            Text(
                              '${product.discountPercentage} %',
                              style: TextStyle(
                                color: const Color(0xff06004F),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        Text(
                          'dis',
                          style: TextStyle(
                            color: const Color(0xff06004F),
                            fontSize: 10.r,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Review (${product.rating})',
                              style: const TextStyle(
                                color: Color(0xff06004F),
                              ),
                            ),
                             SizedBox(width: 5.r),
                            const Icon(
                              Icons.star,
                              color: Color(0xffF4B400),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: (){},
                              child: Image(
                                width: 30.r,
                                height: 30.r,
                                image: const AssetImage('assets/images/add_button.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
