// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'58eeefbd0832498ca2574c1fe69ed783c58d1d8f';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$weatherServiceHash() => r'c21d5d343cefd4e746a22c96f895a460880c8228';

/// See also [weatherService].
@ProviderFor(weatherService)
final weatherServiceProvider = AutoDisposeProvider<WeatherService>.internal(
  weatherService,
  name: r'weatherServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherServiceRef = AutoDisposeProviderRef<WeatherService>;
String _$analyticsServiceHash() => r'9358bd5804022f9734a0bf8df65ee3da22fd45a6';

/// See also [analyticsService].
@ProviderFor(analyticsService)
final analyticsServiceProvider = AutoDisposeProvider<AnalyticsService>.internal(
  analyticsService,
  name: r'analyticsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analyticsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnalyticsServiceRef = AutoDisposeProviderRef<AnalyticsService>;
String _$bundleDownloadServiceHash() =>
    r'19454d9826a5aa8e69e94cdafb327e34ddb7329f';

/// See also [bundleDownloadService].
@ProviderFor(bundleDownloadService)
final bundleDownloadServiceProvider =
    AutoDisposeProvider<BundleDownloadService>.internal(
  bundleDownloadService,
  name: r'bundleDownloadServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bundleDownloadServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BundleDownloadServiceRef
    = AutoDisposeProviderRef<BundleDownloadService>;
String _$openWeatherApiKeyHash() => r'b7c6c4dc4ae25e3dc1cf03b8440883c7e3578414';

/// See also [openWeatherApiKey].
@ProviderFor(openWeatherApiKey)
final openWeatherApiKeyProvider = AutoDisposeProvider<String>.internal(
  openWeatherApiKey,
  name: r'openWeatherApiKeyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$openWeatherApiKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OpenWeatherApiKeyRef = AutoDisposeProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
