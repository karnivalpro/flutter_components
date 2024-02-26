import 'package:flutter/material.dart';
import 'package:flutter_component/src/widget/avatar/k_avatar.dart';

class KAvatarGroup extends StatelessWidget {
  final List<AGData> agItems;
  final Function(AGData)? onClickItem;
  double? avatarSize;
  double? avatarSpacing;

  KAvatarGroup(
      {Key? key,
      required this.agItems,
      this.onClickItem,
      this.avatarSize = 32,
      this.avatarSpacing = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: List.generate(
          agItems.length,
          (index) => Positioned(
            left: ((agItems.length - index) * avatarSpacing!),
            child: Tooltip(
              message: '${agItems[index].name}',
              child: InkWell(
                onTap: () {
                  onClickItem!.call(agItems[index]);
                },
                child: KAvatar(
                  imageUrl: "${agItems[index].imageSrc}",
                  size: avatarSize,
                  boxShape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AGData {
  String? name;

  String? email;

  String? key;

  String? href;

  String? imageSrc;

  AGData({this.name, this.email, this.key, this.href, this.imageSrc});
}
