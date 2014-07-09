# SMTPAPI for iOS

This module will let you build SendGrid's SMTP API headers with simplicity.

## Installing

Choose your installation method - CocoaPods (recommended) or via source.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like SendGrid and its dependencies in your projects. Simply add the lines below to your existing Podfile or make a new 'Podfile' that contain the lines below. 

#### Podfile

```ruby
platform :ios, '7.0'
pod 'smtpapi', '~>  0.1.0'
```

Run the following in the command line
```
pod install
```

Be sure to open up the xcworkspace file now instead of the xcodeproj file. 

Then import the library - in the file appropriate to your project.

```objective-c
import <SMTPAPI/SMTPAPI.h>
```

### Alternative installation
Install via Source

    1. Clone this repository.
    2. Copy SMTPAPI.h and .m files to your project.
    3. Import SMTPAPI.h in the file appropriate to your project.

## Examples

### Create headers

```objective-c
import <SMTPAPI/SMTPAPI.h>

SMTPAPI *header = [SMTPAPI alloc] init];
```

### [To](http://sendgrid.com/docs/API_Reference/SMTP_API/index.html)
```objective-c
[header addTo:@"email@email.com"];
// or
[header addTo:@[@"email@email.com"];
// or
[header setTos:@[@"email@email.com"]];

NSArray *tos = [header getTos];
```

### [Substitutions](http://sendgrid.com/docs/API_Reference/SMTP_API/substitution_tags.html)

```objective-c
[header addSubstitution:@"key" val:@"value"];

NSMutableDictionary *subs = [header getSubstitutions];
```

### [Unique Arguments](http://sendgrid.com/docs/API_Reference/SMTP_API/unique_arguments.html)

```objective-c
[header addUniqueArg:@"key" val:@"value"];
// or
NSMutableDictionary *uniqueArgs = [[NSMutableDictionary alloc] init];
[uniqueArgs setObject:@"value" forKey:@"unique"];
[header setUniqueArgs:uniqueArgs];

NSMutableDictionary *args = [header getUniqueArgs];
```

### [Categories](http://sendgrid.com/docs/API_Reference/SMTP_API/categories.html)

```objective-c
[header addCategory:@"category"];
// or
[header addCategories:@[@"category1", @"category2"]];
// or
[header setCategories:@[@"category1", @"category2"]];

NSMutableArray *cats = [header getCategories];
```

### [Sections](http://sendgrid.com/docs/API_Reference/SMTP_API/section_tags.html)

```objective-c
[header addSection:@"key" val:@"section"];
// or
NSMutableDictionary *newSec = [[NSMutableDictionary alloc] init];
[newSec setObject:@"value" forKey:@"-section-"];
[header setSections:newSec];

NSMutableDictionary *sections = [header getSections];
```

### [Filters](http://sendgrid.com/docs/API_Reference/SMTP_API/apps.html)

```objective-c
[header addFilter:@"filter" setting:@"setting" val:@"value"];
[header addFilter:@"filter" settings:@"setting" val:1];

NSMutableDictionary *filters = [header getFilters];
```

### Get Headers

```objective-c
[header configureHeader];
NSString *headers = header.encodedHeader;
```

## License

Licensed under the MIT License.