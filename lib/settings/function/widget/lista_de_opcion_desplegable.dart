import 'package:flutter/material.dart';

class ListaDedescripcion extends StatefulWidget {
  final List<String>? dropmenuitem;
  final TextEditingController controller;
  final VoidCallback press;
  final void Function(int index) pressedit;
  final String titulo;
  const ListaDedescripcion({
    super.key,
    this.dropmenuitem,
    required this.press,
    required this.controller,
    required this.pressedit, required this.titulo,
  });

  @override
  State<ListaDedescripcion> createState() => _ListaDedescripcionState();
}

class _ListaDedescripcionState extends State<ListaDedescripcion> {
  bool expanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: ListTile(
            title: SizedBox(
              height: 50,
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  labelText: widget.titulo,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffix: IconButton(
                    onPressed: widget.press,
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
            trailing: widget.dropmenuitem != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    icon: expanded
                        ? const Icon(Icons.arrow_drop_up)
                        : const Icon(Icons.arrow_drop_down_sharp),
                  )
                : null,
          ),
        ),
        Container(
          child: expanded
              ? Column(
                  children: [
                    ...widget.dropmenuitem!.asMap().entries.map(
                          (entry) => ListTile(
                            title: Text(entry.value),
                            trailing: IconButton(
                              onPressed: () {
                                widget.pressedit(entry.key);
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                        )
                  ],
                )
              : null,
        )
      ],
    );
  }
}
