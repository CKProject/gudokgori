import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/service_sub/bloc/service_list_bloc.dart';

import '../widgets/bottom_loader.dart';
import '../widgets/service_box.dart';

class ServiceListView extends StatefulWidget {
  const ServiceListView({Key? key}) : super(key: key);

  @override
  _ServiceListViewState createState() => _ServiceListViewState();
}

class _ServiceListViewState extends State<ServiceListView> {
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
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Text("구독 서비스를 선택해 주세요."),
          Expanded(
            child: BlocBuilder<ServiceListBloc, ServiceListState>(
              builder: (context, state) {
                switch (state.status) {
                  case ServiceListStatus.failure:
                    return const Center(
                        child: Text('failed to fetch ServiceLists'));
                  case ServiceListStatus.success:
                    if (state.serviceList.isEmpty) {
                      return const Center(child: Text('no alarms'));
                    }
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return index >= state.serviceList.length
                            ? const BottomLoader()
                            : ServiceBox(serviceList: state.serviceList[index]);
                      },
                      itemCount: state.hasReachedMax
                          ? state.serviceList.length
                          : state.serviceList.length + 1,
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
    if (_isBottom) context.read<ServiceListBloc>().add(ServiceListFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
