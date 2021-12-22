import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/components/components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      children: [
        userTile(),
        divider(),
        colorTiles(),
        divider(),
        bwTiles(),
      ],
    );
  }

  Widget userTile() {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/03/29/03/14/portrait-1287421_960_720.jpg"),
      ),
      title: Txt(
        text: "Talan Lipshutz",
        fontWeight: FontWeight.bold,
      ),
      subtitle: Txt(text: "Mobile Developers"),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  Widget colorTiles() {
    return Column(
      children: [
        colorTile(Icons.person_outline, Colors.deepPurple, "Personal data"),
        colorTile(Icons.settings_outlined, Colors.blue, "Settings"),
        colorTile(Icons.credit_card, Colors.pink, "Payment"),
        colorTile(Icons.favorite_border, Colors.orange, "Personal data"),
      ],
    );
  }

  Widget colorTile(IconData icon, Color color, String text, {bool blackAndWhite = false}) {
    Color pickedColor = const Color(0xfff3f4fe);
    return ListTile(
      leading: Container(
        child: Icon(icon, color: color),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: blackAndWhite ? pickedColor : color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Txt(
        text: text,
        fontWeight: FontWeight.w500,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {},
    );
  }

  Widget bwTiles() {
    return Column(
      children: [
        bwTile(Icons.info_outline, "FAQs"),
        bwTile(Icons.border_color_outlined, "Handbook"),
        bwTile(Icons.textsms_outlined, "Community"),
      ],
    );
  }

  Widget bwTile(IconData icon, String text) {
    return colorTile(icon, Colors.black, text, blackAndWhite: true);
  }
}
