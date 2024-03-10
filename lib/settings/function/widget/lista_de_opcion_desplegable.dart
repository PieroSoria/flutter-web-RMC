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
    required this.pressedit,
    required this.titulo,
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
          child: SizedBox(
            height: 60,
            child: TextField(
              style: const TextStyle(fontSize: 16),
              controller: widget.controller,
              decoration: InputDecoration(
                labelText: widget.titulo,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: widget.press,
                      icon: const Icon(Icons.add),
                    ),
                    Container(
                      child: widget.dropmenuitem != null
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          child: expanded
              ? Column(
                  children: [
                    ...widget.dropmenuitem!.asMap().entries.map(
                          (entry) => ListTile(
                            title: Text(
                              entry.value,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
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
