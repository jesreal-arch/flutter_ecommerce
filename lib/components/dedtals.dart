import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/models/model_product.dart';

class DetailsCart extends StatelessWidget {
  const DetailsCart({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
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
            Text(
              "Php. ${productModel.price}0",
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
              height: 70,
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
