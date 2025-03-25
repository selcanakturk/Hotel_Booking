import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/headerlogo.png',
            height: 40,
          ),
          Row(
            children: [
              _NavItem(title: 'ANA SAYFA'),
              _NavItem(title: 'ODALARIMIZ'),
              _NavItem(title: 'HAKKIMIZDA'),
              _NavItem(title: 'İLETİŞİM'),
              const SizedBox(width: 12),
              DropdownButton<String>(
                value: 'TR',
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 'TR', child: Text('TR')),
                  DropdownMenuItem(value: 'EN', child: Text('EN')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  shadowColor: Colors.black,
                  elevation: 8,
                ),
                onPressed: () {},
                child:
                    Text("REZERVASYON", style: TextStyle(color: Colors.black)),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _NavItem extends StatelessWidget {
  final String title;
  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: () {
          // Navigasyon işlemi burada yapılabilir
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
