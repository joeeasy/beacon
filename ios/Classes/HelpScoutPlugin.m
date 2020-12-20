#import "HelpScoutPlugin.h"
#if __has_include(<help_scout/help_scout-Swift.h>)
#import <help_scout/help_scout-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "help_scout-Swift.h"
#endif

@implementation HelpScoutPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHelpScoutPlugin registerWithRegistrar:registrar];
}
@end
