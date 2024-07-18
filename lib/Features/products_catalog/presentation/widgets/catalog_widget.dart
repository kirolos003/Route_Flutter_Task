import 'package:flutter/material.dart';
import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';
import 'package:flutter_route_task/Features/products_catalog/presentation/widgets/productItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/catalogViewModel.dart';


// ignore: must_be_immutable
class CatalogWidget extends StatelessWidget {
  final CatalogScreenViewModel? viewModel;
  List<Products> catalogProductsList;
  String? categoryName;



  CatalogWidget(this.catalogProductsList,{super.key, this.viewModel , this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/Group 5.png'),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
           viewModel!.loadCatalogProducts();
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.r,
                      width: MediaQuery.of(context).size.width.w - 80.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(
                            color: const Color(0xff004182),
                            strokeAlign: BorderSide.strokeAlignInside,
                            width: 1.5
                        ),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            const ImageIcon(
                              AssetImage('assets/images/search.png'),
                              color: Color(0xff004182),
                            ),
                            SizedBox(width: 10.r),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "What do you search for ?",
                                  hintStyle: TextStyle(
                                      color: Color(0x9906004f),
                                      fontWeight: FontWeight.w400
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24.r),
                  const ImageIcon(
                    AssetImage('assets/images/cart.png'),
                    color: Color(0xff004182),
                  ),
                ],
              ),
              SizedBox(height: 16.r),
              SizedBox(height: 16.r),
              Expanded(
                child: GridView.builder(
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 16.r,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: catalogProductsList.length ,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: ProductItem(
                          catalogProductsList[index],
                        )
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
