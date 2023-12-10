import 'package:flutter/material.dart';
import 'package:home_screen/component/custom_Text.dart';
import 'package:home_screen/component/gap.dart';
import 'package:home_screen/controllers/userProfile/user_profile_controller.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key}) : _controller = UserProfileController();

  final UserProfileController _controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Gap(height: 50),
          _userData,
          const Gap(height: 20),
          _userServices,
        ],
      ),
    );
  }

  Widget get _userData {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180.0),
              color: Colors.grey,
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://media.licdn.com/dms/image/C4D03AQFxJBJVIEFN9w/profile-displayphoto-shrink_200_200/0/1654592507704?e=2147483647&v=beta&t=PY_FtgYvOx3hPdRKTT6yes8DNPhJh1DWInoli-HNciQ'),
                  fit: BoxFit.cover)),
        ),
        const Gap(height: 20),
        const CustomText(text: 'Ali Jboor', color: Colors.black)
      ],
    );
  }

  Widget get _userServices => Expanded(
        child: ListView.builder(
          itemCount: _controller.services.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemBuilder: (BuildContext context, int index) {
            String key = _controller.services.keys.elementAt(index);
            var values = _controller.services.values.elementAt(index);

            return InkWell(
              onTap: () {
                if (values['screen'] is Container) return;
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => values['screen']));
              },
              child: Card(
                shadowColor: Colors.grey,
                elevation: 3.5,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  leading: Icon(values['icon'], color: Colors.black),
                  title: CustomText(
                      text: key,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            );
          },
        ),
      );
}