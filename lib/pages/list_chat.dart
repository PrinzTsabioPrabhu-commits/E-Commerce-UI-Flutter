import 'package:flutter/material.dart';
import 'detail_chat.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  String _selectedFilter = 'Semua';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Nike Official',
        'message': 'Segera Memesan Sebelum Kehabisan.',
        'time': '12:30',
        'avatar': 'images/7.jpg',
      },
      {
        'name': 'Expander',
        'message': 'Hallo, Selamat Datang Di Nike Official.',
        'time': '12:05',
        'avatar': 'images/5.jpg',
      },
    ];

    final filteredChats = _selectedFilter == 'Belum Dibaca'
        ? chats.where((chat) => chat['name'] == 'Nike Official').toList()
        : chats;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xFF4C53A5),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF4C53A5)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur pencarian chat dibuka')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() => _selectedFilter = 'Semua');
                  },
                  child: Text(
                    'Semua',
                    style: TextStyle(
                      color: _selectedFilter == 'Semua'
                          ? const Color(0xFF4C53A5)
                          : const Color.fromRGBO(114, 123, 216, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    setState(() => _selectedFilter = 'Belum Dibaca');
                  },
                  child: Text(
                    'Belum Dibaca',
                    style: TextStyle(
                      color: _selectedFilter == 'Belum Dibaca'
                          ? const Color(0xFF4C53A5)
                          : const Color.fromRGBO(114, 123, 216, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat['avatar']!),
                    radius: 25,
                  ),
                  title: Text(
                    chat['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chat['message']!),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat['time']!,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      if (chat['name'] == 'Nike Official')
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(contactName: chat['name']!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}