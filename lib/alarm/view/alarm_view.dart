import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_sub/widgets/bottom_loader.dart';
import '../bloc/alarm_bloc.dart';
import '../widgets/alarm_box.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  _AlarmViewState createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 7),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 40, bottom: 20),
            child: const Text("알림",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Noto',
                  fontWeight: FontWeight.w700,
                )),
          ),
          Expanded(
            child: BlocBuilder<AlarmBloc, AlarmState>(
              builder: (context, state) {
                switch (state.status) {
                  case AlarmStatus.failure:
                    return const Center(child: Text('failed to fetch Alarms'));
                  case AlarmStatus.success:
                    if (state.alarms.isEmpty) {
                      return const Center(child: Text('no alarms'));
                    }
                    print("state.status : ${state.status}");
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return index >= state.alarms.length
                            ? const BottomLoader()
                            : AlarmBox(alarm: state.alarms[index]);
                      },
                      itemCount: state.hasReachedMax
                          ? state.alarms.length
                          : state.alarms.length + 1,
                      controller: _scrollController,
                    );
                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<AlarmBloc>().add(AlarmFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
