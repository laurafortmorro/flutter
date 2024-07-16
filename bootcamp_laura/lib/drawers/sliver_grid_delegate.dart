import 'package:flutter/material.dart';

class SliverGridDelegate extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                String name = index == 0? 'Chats' : 'Peticiones';
            return Container(
              color: Colors.deepOrangeAccent,
              child: TextButton(
                onPressed: (){},
                focusNode: FocusNode(),
                child: Text(name, style: TextStyle(color: Colors.white),),
              ),
            );
          },
          childCount: 2,
        )
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }


}