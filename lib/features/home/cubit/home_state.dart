class HomeState {
	final bool isLoading;
	final String? error;
	  
	const HomeState({
		this.isLoading = false,
		this.error,
	});
	  
	HomeState copyWith({
		bool? isLoading,
		String? error,
	}) {
		return HomeState(
			isLoading: isLoading ?? this.isLoading,
			error: error ?? this.error,
		);
	}

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomeState &&
      other.isLoading == isLoading &&
      other.error == error;
  }

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;
}
