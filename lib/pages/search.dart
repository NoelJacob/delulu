import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';
import '/components/icons.dart';
import '/components/loading.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delulu',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            iconSize: 32,
            onPressed: () {
              Share.share('Check out this cool app!');
            },
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            iconSize: 32,
            onPressed: () {},
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        children: [
          SizedBox(height: 46),
          SearchBox(),
          SizedBox(height: 64),
          // Placeholder(),
          SizedBox(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File("/home/noel/Dev/Temp/news/banner.png")),
                  fit: BoxFit.cover, // Ensures the image covers the container
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextField(
            minLines: 2,
            maxLines: 8,
            autocorrect: true,
            enableSuggestions: true,
            spellCheckConfiguration: SpellCheckConfiguration(
              misspelledSelectionColor: Colors.redAccent,
              spellCheckService: DefaultSpellCheckService(),
            ),
            cursorColor: Colors.white70,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: 'Ask anything...',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
                color: Colors.white24,
              ),
              border: InputBorder.none,
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(width: 5),
              TextBoxIcon(
                Icons.filter_center_focus_rounded,
                "Field",
              ),
              SizedBox(width: 12),
              TextBoxIcon(
                Icons.add_circle_outline_rounded,
                "Attach",
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return Placeholder();
                        }),
                      );
                    },
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      iconSize: MaterialStatePropertyAll(20),
                      // overlayColor:
                      //     MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer;
                        } else {
                          return Theme.of(context).colorScheme.primary;
                        }
                      }),
                    ),
                    icon: Icon(Icons.send_rounded),
                  ),
                ),
              )
            ],
          ), // Button
        ],
      ),
    );
  }
}
