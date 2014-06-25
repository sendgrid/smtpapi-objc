# SMTPAPI for iOS

This module will let you build SendGrid"s SMTP API headers with simplicity.

**Important:** This library requires [AFNetworking](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking) 2.0 or higher.


```objective-c
SendGrid *sendgrid = [SendGrid apiUser:@"username" apiKey:@"password"];   

Email *email = [[Email alloc] init];
email.to = @"foo@bar.com";
email.subject = @"subject goes here";
email.from = @"me@bar.com";
email.text = @"hello world";   
email.html = @"<h1>hello world!</h1>";
    
[sendgrid sendWithWeb:email];    
```

## Installation via CocoaPods (Recommended Method)
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like SendGrid and its dependencies in your projects. Simply add the lines below to your existing Podfile or make a new 'Podfile' that contain the lines below. 

#### Podfile

```ruby
platform :ios, '7.0'
pod 'sendgrid', '~>  0.1.0'
```

Run the following in the command line
```
pod install
```

Be sure to open up the .xcworkspace file now instead of the .xcodeproj file. 

## Alternative installation
Install via Source

    1. Clone this repository.
    2. Copy SendGrid.h and .m, and Email.h and .m files to your project.
    3. Import both SendGrid and AFNetworking in your project

## Usage


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

