import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/provider.dart';

class DetailsCart extends ConsumerWidget {
  const DetailsCart( {
    super.key,
    required this.onTap,
    required this.productModel,
  });
  final ProductModel productModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController(initialPage: 0);
    final pageViewCurrentIndex = ref.watch(currentPageView);
    final CategoryModel categoryProduct =
        CategoryModel.fromJson(productModel.category);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 218, 214, 214),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    ref.read(currentPageView.notifier).update((state) => value);
                  },
                  itemCount: productModel.images.length,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(3, 0),
                                blurRadius: 6,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                productModel.images[index],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(3, 0),
                                    blurRadius: 6,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: LottieBuilder.network(
                                "https://lottie.host/0ff3ffc0-6767-4f65-9def-3af40d58371d/m8FtyrhmZ7.json",
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(
                  decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  position: pageViewCurrentIndex,
                  dotsCount: productModel.images.length,
                  onTap: (position) {
                    pageController.animateToPage(position,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              productModel.title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "Php. ${productModel.price}0",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryProduct.name,
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productModel.description,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
           
           
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Add To Cart",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
