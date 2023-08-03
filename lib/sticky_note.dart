import 'package:flutter/material.dart';

import 'use-cases/update_sticky_note_use_case.dart';

class StickyNote extends StatelessWidget {
  final UpdateStickyNoteUseCase updateStickyNoteUseCase;
  const StickyNote(this.updateStickyNoteUseCase, {super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    const paddingHorizontalSticky = 5.0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        width: size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.amber[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: paddingHorizontalSticky),
              child: Row(
                children: [
                  Expanded(
                    child: !updateStickyNoteUseCase.stickyNoteModel.editable
                        ? Text(
                            updateStickyNoteUseCase.stickyNoteModel.title,
                            style: const TextStyle(color: Colors.white),
                          )
                        : TextField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              hintText: "Titulo do Texto",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            onChanged: (value) {
                              updateStickyNoteUseCase.title = value;
                            },
                          ),
                  ),
                  IconButton(
                    onPressed: updateStickyNoteUseCase.update,
                    icon: Icon(
                      updateStickyNoteUseCase.stickyNoteModel.editable
                          ? Icons.check
                          : Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: updateStickyNoteUseCase.delete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: paddingHorizontalSticky),
              child: Divider(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: paddingHorizontalSticky),
              child: !updateStickyNoteUseCase.stickyNoteModel.editable
                  ? Text(
                      updateStickyNoteUseCase.stickyNoteModel.description,
                      style: const TextStyle(color: Colors.white),
                    )
                  : TextField(
                      style: const TextStyle(color: Colors.white),
                      maxLines: 5,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintText: "Descrição da nota",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        updateStickyNoteUseCase.description = value;
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
