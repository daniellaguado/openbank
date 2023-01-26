import 'package:flutter/material.dart';

class CarrouselWidget extends StatelessWidget {
  const CarrouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 400,
        color: Colors.red,
        height: 170,
        // color: Colors.red,
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: ((context, index) => const _ItemListView())))
        ]));
  }
}

class _ItemListView extends StatelessWidget {
  const _ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: Colors.grey[100]),
        width: 300,
        // height: 190,
        // color: Colors.grey[300],
        // margin: const EdgeInsets.symmetric(horizontal: 5),
      ),
    );
  }
}



// class CarrouselWidget extends StatelessWidget {
//   const CarrouselWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemBuilder: (context, index) => ItemListView(),
//         itemCount: 3,
//         scrollDirection: Axis.horizontal,
//       ),
//     );
//   }
// }

// class ItemListView extends StatelessWidget {
//   const ItemListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: Container(
//         // margin: EdgeInsets.only(bottom: 450),
//         width: 250,
//         color: Colors.red,
//       ),
//     );
//   }
// }
