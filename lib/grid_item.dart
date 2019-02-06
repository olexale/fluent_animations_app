import 'package:fluent_animations_app/animated_appearing.dart';
import 'package:flutter/material.dart';
import 'package:random_user/models.dart';

class GridItem extends StatelessWidget {
  const GridItem({Key key, @required this.profile, this.isSelected})
      : super(key: key);

  final User profile;
  final bool isSelected;

  static const animationDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
      duration: animationDuration,
      padding:
          isSelected ? const EdgeInsets.all(0.0) : const EdgeInsets.all(6.0),
      child: Card(
          color: isSelected ? Colors.grey[700] : Theme.of(context).cardColor,
          elevation: isSelected ? 15 : 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              CircleAvatar(
                  radius: isSelected ? 33.0 : 26.0,
                  backgroundImage: NetworkImage(profile.picture.medium)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            _capitalize(profile.name.first),
                            style: Theme.of(context).textTheme.subhead,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _getProfileTexts(context, isSelected),
                        Text(
                          _capitalize(profile.location.city),
                          style: Theme.of(context).textTheme.caption,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                ),
              ),
              AnimatedOpacity(
                opacity: isSelected ? 1 : 0,
                duration: animationDuration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.phone, size: 20),
                        onPressed: isSelected ? () {} : null),
                    IconButton(
                        icon: const Icon(Icons.videocam, size: 20),
                        onPressed: isSelected ? () {} : null),
                  ],
                ),
              )
            ]),
          )));

  Widget _getProfileTexts(BuildContext context, bool isSelected) =>
      AnimatedAppearing(
        duration: animationDuration * 2,
        appearingFactor: isSelected ? 1 : 0,
        child: Text(
          _capitalize(profile.location.street),
          style: Theme.of(context).textTheme.caption,
          overflow: TextOverflow.ellipsis,
        ),
      );

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
